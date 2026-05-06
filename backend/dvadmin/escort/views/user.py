# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact:
@Created on: 2026/4/2
@Remark: 小程序用户管理API
"""
import json
import urllib.request
import urllib.parse
import urllib.error
import os
import uuid
import time
from datetime import datetime, timedelta
from django.utils import timezone
from django.db.models import Sum
from django.conf import settings
from django.core.files.storage import default_storage
from rest_framework import serializers
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated, AllowAny
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework_simplejwt.tokens import RefreshToken
from django.db.models import Q
from dvadmin.utils.json_response import ErrorResponse, DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet
from dvadmin.utils.request_util import save_login_log
from ..models import EscortUser


class EscortUserSerializer(CustomModelSerializer):
    """小程序用户管理-序列化器"""
    
    hunter_status_display = serializers.CharField(source='get_hunter_status_display', read_only=True)
    
    class Meta:
        model = EscortUser
        read_only_fields = ["id"]
        fields = ['id', 'openid', 'nickname', 'avatar_url', 'phone', 'real_name', 'id_card', 'id_card_front', 'id_card_back', 'hunter_status', 'hunter_status_display', 'balance', 'total_income', 'total_withdrawal', 'completed_orders', 'avg_rating', 'apply_time', 'approve_time', 'reject_reason', 'create_datetime', 'update_datetime', 'creator', 'modifier']
        extra_kwargs = {
            "openid": {"required": False},
            "unionid": {"required": False},
            "nickname": {"required": False},
            "avatar_url": {"required": False},
        }


class EscortUserCreateUpdateSerializer(CustomModelSerializer):
    """小程序用户管理-创建/更新序列化器"""
    
    class Meta:
        model = EscortUser
        fields = ['openid', 'nickname', 'avatar_url', 'phone', 'real_name', 'id_card', 'id_card_front', 'id_card_back', 'hunter_status', 'balance']


class EscortUserViewSet(CustomModelViewSet):
    """小程序用户管理接口"""
    
    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        return [EscortUserAuthentication()]
    
    queryset = EscortUser.objects.all().order_by('-create_datetime')
    serializer_class = EscortUserSerializer
    create_serializer_class = EscortUserCreateUpdateSerializer
    permission_classes = []  # 暂时禁用所有权限检查
    extra_filter_class = []  # 禁用额外的过滤器，避免权限检查
    update_serializer_class = EscortUserCreateUpdateSerializer
    filter_fields = ['hunter_status', ]
    search_fields = ['nickname', 'openid', 'phone', 'real_name']
    
    @action(methods=["POST"], detail=True, permission_classes=[IsAuthenticated])
    def approve_hunter(self, request, *args, **kwargs):
        """批准打手申请"""
        instance = self.get_object()
        if instance.hunter_status != EscortUser.HUNTER_PENDING:
            return ErrorResponse(msg="只有审核中的申请才能批准")
        
        instance.hunter_status = EscortUser.HUNTER_APPROVED
        instance.approve_time = timezone.now()
        instance.save()
        return SuccessResponse(msg="打手申请已批准")
    
    @action(methods=["POST"], detail=True, permission_classes=[IsAuthenticated])
    def reject_hunter(self, request, *args, **kwargs):
        """拒绝打手申请"""
        instance = self.get_object()
        if instance.hunter_status != EscortUser.HUNTER_PENDING:
            return ErrorResponse(msg="只有审核中的申请才能拒绝")
        
        reject_reason = request.data.get('reject_reason', '资料审核不通过，请重新提交')
        instance.hunter_status = EscortUser.HUNTER_REJECTED
        instance.reject_reason = reject_reason
        instance.save()
        return SuccessResponse(msg="打手申请已拒绝")
    
    @action(methods=["POST"], detail=True, permission_classes=[IsAuthenticated])
    def suspend_hunter(self, request, *args, **kwargs):
        """暂停打手"""
        instance = self.get_object()
        if instance.hunter_status != EscortUser.HUNTER_APPROVED:
            return ErrorResponse(msg="只有已通过的打手才能暂停")
        
        instance.hunter_status = EscortUser.HUNTER_SUSPENDED
        instance.save()
        return SuccessResponse(msg="打手已暂停")
    
    @action(methods=["POST"], detail=True, permission_classes=[IsAuthenticated])
    def activate_hunter(self, request, *args, **kwargs):
        """激活打手"""
        instance = self.get_object()
        if instance.hunter_status != EscortUser.HUNTER_SUSPENDED:
            return ErrorResponse(msg="只有已暂停的打手才能激活")
        
        instance.hunter_status = EscortUser.HUNTER_APPROVED
        instance.save()
        return SuccessResponse(msg="打手已激活")
    
    @action(methods=["GET"], detail=False, permission_classes=[IsAuthenticated])
    def statistics(self, request, *args, **kwargs):
        """用户统计"""
        total_users = self.queryset.count()
        pending_hunters = self.queryset.filter(hunter_status=EscortUser.HUNTER_PENDING).count()
        approved_hunters = self.queryset.filter(hunter_status=EscortUser.HUNTER_APPROVED).count()
        total_balance = self.queryset.aggregate(total=Sum('balance'))['total'] or 0
        
        return SuccessResponse(data={
            'total_users': total_users,
            'pending_hunters': pending_hunters,
            'approved_hunters': approved_hunters,
            'total_balance': float(total_balance)
        })

    @action(methods=["POST"], detail=False)
    def quit_hunter(self, request, *args, **kwargs):
        """用户主动注销达人身份"""
        user = request.user
        if user.hunter_status != EscortUser.HUNTER_APPROVED:
            return ErrorResponse(msg="只有认证打手才能注销身份")

        user.hunter_status = EscortUser.HUNTER_NOT_APPLIED
        user.apply_time = None
        user.approve_time = None
        user.reject_reason = None
        user.save()
        return SuccessResponse(msg="达人身份已注销")

    @action(methods=["POST"], detail=False, permission_classes=[])
    def wx_login(self, request, *args, **kwargs):
        """
        微信小程序登录接口
        支持手机号一键登录和静默登录（无手机号）
        ---
        流程：
        1. 前端调用 wx.login() 获取 code（必填）
        2. 前端通过 getPhoneNumber 获取 phone_code（可选）
        3. 后端用 wx_code 换取 openid
        4. 后端用 phone_code 向微信换手机号（如有）
        5. 创建/更新用户，签发 JWT
        """
        wx_code = request.data.get('code', '').strip()
        phone_code = request.data.get('phone_code', '').strip() or None
        nickname = request.data.get('nickname', '').strip() or None
        avatar_url = request.data.get('avatar_url', '').strip() or None

        if not wx_code:
            return ErrorResponse(msg="code 不能为空")

        # ========== 1. 用 wx_code 换取 openid ==========
        wx_url = (
            f"https://api.weixin.qq.com/sns/jscode2session"
            f"?appid={settings.WECHAT_MINI_APPID}"
            f"&secret={settings.WECHAT_MINI_APPSECRET}"
            f"&js_code={wx_code}&grant_type=authorization_code"
        )
        try:
            with urllib.request.urlopen(wx_url, timeout=10) as resp:
                session_data = json.loads(resp.read().decode())
        except Exception as e:
            return ErrorResponse(msg=f"微信服务连接失败: {e}")

        if 'openid' not in session_data:
            err_msg = session_data.get('errmsg', '换取 openid 失败')
            return ErrorResponse(msg=f"微信登录失败: {err_msg}")

        openid = session_data['openid']
        unionid = session_data.get('unionid')

        # ========== 2. 用 phone_code 换取手机号 ==========
        # phone_code 有效期5分钟，仅能使用一次
        phone = None
        if phone_code:
            phone = self._decrypt_phone(phone_code)
            # 解密失败不影响登录，仅记录日志
            if not phone:
                import logging
                logging.getLogger('escort').warning(f"手机号解密失败，phone_code={phone_code[:8]}...")

        # ========== 3. 查询或创建用户 ==========
        user, created = EscortUser.objects.get_or_create(
            openid=openid,
            defaults={
                'nickname': nickname or f"用户{openid[-6:]}",
                'avatar_url': avatar_url or '',
                'phone': phone or '',
                'unionid': unionid or '',
            }
        )

        if not created:
            update_fields = []
            if phone and not user.phone:
                user.phone = phone
                update_fields.append('phone')
            if nickname and user.nickname and user.nickname.startswith('用户'):
                user.nickname = nickname
                update_fields.append('nickname')
            if avatar_url and not user.avatar_url:
                user.avatar_url = avatar_url
                update_fields.append('avatar_url')
            if update_fields:
                user.save(update_fields=update_fields)

        # ========== 4. 签发 JWT ==========
        refresh = RefreshToken.for_user(user)
        refresh['openid'] = openid
        refresh['user_id'] = user.id

        return SuccessResponse(data={
            'access': str(refresh.access_token),
            'refresh': str(refresh),
            'openid': openid,
            'user_id': user.id,
            'phone': user.phone or None,
        })

    def _decrypt_phone(self, phone_code):
        """
        向微信换取手机号
        POST https://api.weixin.qq.com/wxa/business/getuserphonenumber?access_token=ACCESS_TOKEN
        body: { "code": phone_code }
        返回: { "errcode": 0, "errmsg": "ok", "phone_info": { "phoneNumber": "xxx" } }
        """
        # 先获取 access_token（需要已发布的小程序才有效，开发阶段会失败）
        # 这里直接用 phone_code 换手机号
        try:
            # 获取 access_token（可缓存，实际项目建议加缓存逻辑）
            token_url = (
                f"https://api.weixin.qq.com/cgi-bin/token"
                f"?grant_type=client_credential"
                f"&appid={settings.WECHAT_MINI_APPID}"
                f"&secret={settings.WECHAT_MINI_APPSECRET}"
            )
            with urllib.request.urlopen(token_url, timeout=10) as resp:
                token_data = json.loads(resp.read().decode())
            access_token = token_data.get('access_token')
            if not access_token:
                return None

            # 用 access_token + phone_code 换手机号
            decrypt_url = (
                f"https://api.weixin.qq.com/wxa/business/getuserphonenumber"
                f"?access_token={access_token}"
            )
            payload = json.dumps({'code': phone_code}).encode('utf-8')
            req = urllib.request.Request(
                decrypt_url, data=payload,
                headers={'Content-Type': 'application/json; charset=utf-8'}
            )
            with urllib.request.urlopen(req, timeout=10) as resp:
                result = json.loads(resp.read().decode())

            if result.get('errcode') == 0:
                phone_info = result.get('phone_info', {})
                return phone_info.get('phoneNumber')
            else:
                import logging
                logging.getLogger('escort').warning(
                    f"获取手机号失败: errcode={result.get('errcode')}, errmsg={result.get('errmsg')}"
                )
                return None
        except Exception:
            return None

    @action(methods=["GET"], detail=False, permission_classes=[IsAuthenticated])
    def current(self, request, *args, **kwargs):
        """
        获取当前登录用户信息
        JWT 认证后，通过 token 中存储的 openid 查找 EscortUser 并返回
        """
        openid = None
        if hasattr(request, 'auth') and request.auth:
            openid = request.auth.get('openid')
        if not openid:
            try:
                openid = request.user.openid
            except Exception:
                pass
        if not openid:
            return ErrorResponse(msg="未登录")

        try:
            user = EscortUser.objects.get(openid=openid)
        except EscortUser.DoesNotExist:
            return ErrorResponse(msg="用户不存在")

        serializer = EscortUserSerializer(user, context={'request': request})
        return SuccessResponse(data=serializer.data)

    @action(methods=["POST"], detail=False, permission_classes=[IsAuthenticated])
    def update_info(self, request, *args, **kwargs):
        """
        更新当前登录用户信息
        支持更新：nickname（昵称）、real_name（真实姓名）、avatar_url（头像）
        """
        openid = None
        if hasattr(request, 'auth') and request.auth:
            openid = request.auth.get('openid')
        if not openid:
            try:
                openid = request.user.openid
            except Exception:
                pass
        if not openid:
            return ErrorResponse(msg="未登录")

        try:
            user = EscortUser.objects.get(openid=openid)
        except EscortUser.DoesNotExist:
            return ErrorResponse(msg="用户不存在")

        # 获取需要更新的字段
        nickname = request.data.get('nickname')
        real_name = request.data.get('real_name')
        avatar_url = request.data.get('avatar_url')

        update_fields = []
        if nickname is not None:
            user.nickname = nickname.strip()
            update_fields.append('nickname')
        if real_name is not None:
            user.real_name = real_name.strip()
            update_fields.append('real_name')
        if avatar_url is not None:
            user.avatar_url = avatar_url.strip()
            update_fields.append('avatar_url')

        if update_fields:
            user.save(update_fields=update_fields)

        serializer = EscortUserSerializer(user, context={'request': request})
        return SuccessResponse(data=serializer.data, msg="用户信息更新成功")


class ApplyHunterView(APIView):
    """申请成为陪玩达人接口"""
    authentication_classes = []  # 不需要认证，因为前端会传 token 在 Authorization header
    permission_classes = []  # 手动验证 token

    def post(self, request):
        """
        申请成为陪玩达人
        需要提交：真实姓名、身份证号、身份证正面照片、身份证反面照片
        """
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        auth = EscortUserAuthentication()
        try:
            validated = auth.get_validated_token(auth.get_raw_token(auth.get_header(request)))
            user = auth.get_user(validated)
        except Exception:
            return ErrorResponse(msg="认证失败，请重新登录")

        openid = None
        if hasattr(validated, 'get'):
            openid = validated.get('openid')
        if not openid:
            openid = getattr(user, 'openid', None)
        if not openid:
            return ErrorResponse(msg="认证失败，请重新登录")

        try:
            escort_user = EscortUser.objects.get(openid=openid)
        except EscortUser.DoesNotExist:
            return ErrorResponse(msg="用户不存在")

        # 检查当前状态
        if escort_user.hunter_status == EscortUser.HUNTER_PENDING:
            return ErrorResponse(msg="您已经在审核中，请耐心等待")
        if escort_user.hunter_status == EscortUser.HUNTER_APPROVED:
            return ErrorResponse(msg="您已经是陪玩达人了")

        # 获取参数
        real_name = request.data.get('real_name', '').strip()
        id_card = request.data.get('id_card', '').strip()
        id_card_front = request.data.get('id_card_front', '').strip()
        id_card_back = request.data.get('id_card_back', '').strip()
        phone = request.data.get('phone', '').strip()

        # 验证必填项
        if not real_name:
            return ErrorResponse(msg="请填写真实姓名")
        if not id_card:
            return ErrorResponse(msg="请填写身份证号")
        if len(id_card) < 15:
            return ErrorResponse(msg="身份证号格式不正确")
        if not id_card_front:
            return ErrorResponse(msg="请上传身份证正面照片")
        if not id_card_back:
            return ErrorResponse(msg="请上传身份证反面照片")

        # 更新用户信息
        from django.utils import timezone
        escort_user.real_name = real_name
        escort_user.id_card = id_card
        escort_user.id_card_front = id_card_front
        escort_user.id_card_back = id_card_back
        escort_user.hunter_status = EscortUser.HUNTER_PENDING
        escort_user.apply_time = timezone.now()
        # 拒绝原因清空
        escort_user.reject_reason = ''
        # 如果提交了手机号，也更新
        if phone:
            escort_user.phone = phone
        escort_user.save()

        return SuccessResponse(msg="申请已提交，请等待审核")


class FileUploadView(APIView):
    """文件上传接口"""
    permission_classes = [AllowAny]
    parser_classes = [MultiPartParser, FormParser]

    def post(self, request):
        """上传文件，返回文件URL"""
        file = request.FILES.get('file')
        if not file:
            return ErrorResponse(msg="请选择要上传的文件")

        # 检查文件大小（限制10MB）
        if file.size > 10 * 1024 * 1024:
            return ErrorResponse(msg="文件大小不能超过10MB")

        # 检查文件类型
        allowed_extensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp']
        import os
        ext = os.path.splitext(file.name)[1].lower()
        if ext not in allowed_extensions:
            return ErrorResponse(msg=f"不支持的文件格式，仅支持: {', '.join(allowed_extensions)}")

        # 生成唯一文件名
        timestamp = int(time.time() * 1000)
        unique_id = uuid.uuid4().hex[:8]
        new_filename = f"{timestamp}_{unique_id}{ext}"

        # 保存文件到 media/avatars 目录
        save_path = os.path.join('avatars', new_filename)
        full_path = default_storage.save(save_path, file)

        # 返回文件URL
        file_url = request.build_absolute_uri(default_storage.url(full_path))
        return SuccessResponse(data={'url': file_url, 'filename': new_filename}, msg="上传成功")