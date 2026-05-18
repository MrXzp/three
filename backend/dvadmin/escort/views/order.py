# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact:
@Created on: 2026/4/2
@Remark: 订单管理API
"""
import hashlib
import random
import string
import time
import urllib.parse
import xml.etree.ElementTree as ET
from decimal import Decimal
from django.db import models

from django.conf import settings
from django.utils import timezone
from rest_framework import serializers, status
from rest_framework.decorators import action
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication, EscortUserPermission
from rest_framework.views import APIView
from dvadmin.utils.json_response import ErrorResponse, DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet
from ..models import Order, OrderHunter


def _random_str(length=32):
    """生成随机字符串（数字+字母）"""
    chars = string.ascii_letters + string.digits
    return ''.join(random.choices(chars, k=length))


def _build_sign(params: dict, sign_type='MD5') -> str:
    """
    微信支付签名（APIv2 MD5）
    params: 所有参与签名的参数（不含 sign）
    """
    # 1. 按字典键 ASCII 升序排列
    sorted_keys = sorted(params.keys())
    # 2. URL-encode 并用 & 连接
    pairs = []
    for k in sorted_keys:
        v = params[k]
        if v is None or v == '':
            continue
        # 多层嵌套 dict/list 暂不处理，只处理顶层 string 值
        if isinstance(v, (list, dict)):
            continue
        pairs.append(f"{k}={v}")
    sign_str = '&'.join(pairs)
    # 3. 末尾拼接 key
    sign_str += f"&key={settings.WECHAT_API_KEY}"
    # 4. MD5 后转大写
    return hashlib.md5(sign_str.encode('utf-8')).hexdigest().upper()


def _dict_to_xml(params: dict) -> str:
    """字典转 XML，保留空值"""
    root = ET.Element('xml')
    for k, v in params.items():
        child = ET.SubElement(root, k)
        if isinstance(v, str):
            child.text = v
        elif v is not None:
            child.text = str(v)
        else:
            child.text = ''
    return ET.tostring(root, encoding='utf-8', xml_declaration=False).decode('utf-8')


def _xml_to_dict(xml_str: str) -> dict:
    """XML 转字典"""
    root = ET.fromstring(xml_str)
    return {child.tag: child.text or '' for child in root}


class OrderHunterSerializer(CustomModelSerializer):
    """订单打手-序列化器"""
    
    hunter_nickname = serializers.CharField(source='hunter.nickname', read_only=True)
    
    class Meta:
        model = OrderHunter
        read_only_fields = ["id"]
        fields = ['id', 'order', 'hunter', 'hunter_nickname', 'is_primary', 'share_percentage', 'share_amount', 'create_datetime', 'update_datetime', 'creator', 'modifier']


class OrderSerializer(CustomModelSerializer):
    """订单管理-序列化器"""

    customer_nickname = serializers.CharField(source='customer.nickname', read_only=True)
    service_name = serializers.CharField(source='service.name', read_only=True)
    required_hunters = serializers.IntegerField(source='service.required_hunters', read_only=True)
    service_type = serializers.IntegerField(source='service.service_type', read_only=True)
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    hunters = OrderHunterSerializer(many=True, read_only=True, source='hunters.all')
    remaining_seconds = serializers.SerializerMethodField(help_text="待支付订单剩余支付秒数（-1表示非待支付状态）")
    is_expired = serializers.SerializerMethodField(help_text="订单是否已超时")

    # 超时时间配置（秒），默认30分钟
    PAYMENT_TIMEOUT_SECONDS = 30 * 60

    def get_remaining_seconds(self, obj):
        """计算待支付订单剩余支付秒数"""
        if obj.status != Order.STATUS_PENDING_PAYMENT:
            return -1
        elapsed = (timezone.now() - obj.create_datetime).total_seconds()
        remaining = self.PAYMENT_TIMEOUT_SECONDS - elapsed
        return max(0, int(remaining))

    def get_is_expired(self, obj):
        """检查订单是否已超时"""
        if obj.status != Order.STATUS_PENDING_PAYMENT:
            return False
        elapsed = (timezone.now() - obj.create_datetime).total_seconds()
        return elapsed >= self.PAYMENT_TIMEOUT_SECONDS

    class Meta:
        model = Order
        read_only_fields = ["id"]
        fields = ['id', 'order_no', 'customer', 'customer_nickname', 'service', 'service_name', 'required_hunters', 'service_type', 'status', 'status_display', 'total_amount', 'platform_fee', 'hunter_share', 'game_account', 'game_server', 'game_mode', 'special_requirements', 'pay_time', 'accept_time', 'service_start_time', 'service_end_time', 'complete_time', 'cancel_time', 'cancel_reason', 'hunters', 'remaining_seconds', 'is_expired', 'create_datetime', 'update_datetime', 'creator', 'modifier']


class OrderCreateUpdateSerializer(CustomModelSerializer):
    """订单管理-创建/更新序列化器"""

    order_no = serializers.CharField(read_only=True)  # 创建时自动生成，只读返回

    def create(self, validated_data):
        """自动生成唯一订单号，并计算分账金额"""
        import datetime
        import time

        # 使用时间戳(微秒) + 用户ID + 随机字符
        prefix = 'EP'
        timestamp = str(time.time()).replace('.', '')  # 微秒级时间戳
        user_id = validated_data.get('creator') or validated_data.get('customer') or 0
        import random
        random_str = ''.join(random.choices('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', k=3))
        order_no = "%s%s%d%s" % (prefix, timestamp, user_id, random_str)

        validated_data['order_no'] = order_no

        # 自动计算分账金额（微信通道费0.6%由打手承担）
        total = validated_data.get('total_amount', 0)
        if total and total > 0:
            from decimal import Decimal
            # 打手实际收益 = 订单金额 × 84.4%（扣除平台15%服务费和微信0.6%通道费）
            # 平台服务费 = 订单金额 × 15%
            validated_data['hunter_share'] = (Decimal(str(total)) * Decimal('0.844')).quantize(Decimal('0.01'))
            validated_data['platform_fee'] = (Decimal(str(total)) * Decimal('0.15')).quantize(Decimal('0.01'))
        else:
            validated_data['hunter_share'] = Decimal('0')
            validated_data['platform_fee'] = Decimal('0')

        return super().create(validated_data)

    class Meta:
        model = Order
        fields = ['id', 'order_no', 'service', 'total_amount', 'game_account', 'game_server', 'game_mode', 'special_requirements']
        read_only_fields = ['id', 'order_no']


class OrderViewSet(CustomModelViewSet):
    permission_classes = []  # 禁用所有权限类，由 action 单独控制
    extra_filter_class = []  # 禁用数据级权限过滤，EscortUser 没有 manage_dept 等字段
    """订单管理接口"""

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]
    
    queryset = Order.objects.all().order_by('-create_datetime')
    serializer_class = OrderSerializer
    create_serializer_class = OrderCreateUpdateSerializer
    update_serializer_class = OrderCreateUpdateSerializer
    filter_fields = ['status', ]
    search_fields = ['order_no', 'customer__nickname', 'service__name', 'game_account']

    def get_serializer_context(self):
        """给序列化器传递当前登录用户ID"""
        ctx = super().get_serializer_context()
        user_id = None
        if hasattr(self.request, 'auth') and self.request.auth:
            user_id = self.request.auth.get('user_id')
        if not user_id:
            try:
                user_id = self.request.user.id
            except Exception:
                pass
        ctx['user_id'] = user_id
        return ctx

    def _check_and_cancel_expired_order(self, order):
        """检查并取消超时订单，返回是否已取消"""
        if order.status != Order.STATUS_PENDING_PAYMENT:
            return False
        elapsed = (timezone.now() - order.create_datetime).total_seconds()
        if elapsed >= OrderSerializer.PAYMENT_TIMEOUT_SECONDS:
            order.status = Order.STATUS_CANCELLED
            order.cancel_time = timezone.now()
            order.cancel_reason = 'timeout'
            order.save(update_fields=['status', 'cancel_time', 'cancel_reason', 'update_datetime'])
            return True
        return False

    def list(self, request, *args, **kwargs):
        """获取订单列表，实时检查超时订单"""
        response = super().list(request, *args, **kwargs)
        return response

    def retrieve(self, request, *args, **kwargs):
        """获取订单详情，实时检查超时订单"""
        instance = self.get_object()
        self._check_and_cancel_expired_order(instance)
        serializer = self.get_serializer(instance)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        """重写create方法，确保订单号唯一"""
        import uuid
        from django.db import IntegrityError
        
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        
        user_id = None
        if hasattr(request, 'auth') and request.auth:
            user_id = request.auth.get('user_id')
        if not user_id:
            try:
                user_id = request.user.id
            except Exception:
                pass
        
        max_retries = 5
        for attempt in range(max_retries):
            prefix = 'EP'
            unique_id = uuid.uuid4().hex[:12].upper()
            order_no = f"{prefix}{unique_id}"
            
            if Order.objects.filter(order_no=order_no).exists():
                continue
            
            try:
                from decimal import Decimal
                total = serializer.validated_data.get('total_amount', 0)
                if total and float(total) > 0:
                    hunter_share = (Decimal(str(total)) * Decimal('0.844')).quantize(Decimal('0.01'))
                    platform_fee = (Decimal(str(total)) * Decimal('0.15')).quantize(Decimal('0.01'))
                else:
                    hunter_share = Decimal('0')
                    platform_fee = Decimal('0')
                order = Order.objects.create(
                    order_no=order_no,
                    customer_id=user_id,
                    hunter_share=hunter_share,
                    platform_fee=platform_fee,
                    **serializer.validated_data
                )
                # 返回订单信息
                return Response({
                    'id': order.id,
                    'order_no': order.order_no,
                    'msg': '订单创建成功'
                }, status=status.HTTP_201_CREATED)
            except IntegrityError:
                continue
        
        return ErrorResponse(msg="订单创建失败，请重试")
    
    @action(methods=["POST"], detail=True, permission_classes=[EscortUserPermission])
    def confirm_payment(self, request, *args, **kwargs):
        """确认支付"""
        instance = self.get_object()
        if instance.status != Order.STATUS_PENDING_PAYMENT:
            return ErrorResponse(msg="只有待支付的订单才能确认支付")
        
        instance.status = Order.STATUS_PENDING_ACCEPT
        instance.pay_time = timezone.now()
        instance.save()
        return SuccessResponse(msg="支付已确认")
    
    @action(methods=["POST"], detail=True, permission_classes=[EscortUserPermission])
    def cancel(self, request, *args, **kwargs):
        """取消订单"""
        instance = self.get_object()
        openid = None
        if hasattr(request, 'auth') and request.auth:
            openid = request.auth.get('openid')
        
        # 验证订单所有者
        if instance.customer.openid != openid:
            return ErrorResponse(msg="无权取消此订单")
        
        # 待支付状态可以取消
        if instance.status == Order.STATUS_PENDING_PAYMENT:
            instance.status = Order.STATUS_CANCELLED
            instance.cancel_time = timezone.now()
            instance.cancel_reason = 'user'
            instance.save()
            return SuccessResponse(msg="订单已取消")
        
        # 待接单状态可以取消（但需要退款逻辑，这里先简单处理）
        if instance.status == Order.STATUS_PENDING_ACCEPT:
            instance.status = Order.STATUS_CANCELLED
            instance.cancel_time = timezone.now()
            instance.cancel_reason = 'user'
            instance.save()
            return SuccessResponse(msg="订单已取消")
        
        return ErrorResponse(msg="当前状态无法取消订单")
    
    @action(methods=["POST"], detail=True, permission_classes=[EscortUserPermission])
    def force_complete(self, request, *args, **kwargs):
        """强制完成订单"""
        instance = self.get_object()
        if instance.status not in [Order.STATUS_IN_SERVICE, Order.STATUS_PENDING_CONFIRM]:
            return ErrorResponse(msg="只有服务中或待确认的订单才能强制完成")
        
        instance.status = Order.STATUS_COMPLETED
        instance.complete_time = timezone.now()
        instance.save()
        return SuccessResponse(msg="订单已强制完成")
    
    @action(methods=["GET"], detail=False, permission_classes=[EscortUserPermission])
    def statistics(self, request, *args, **kwargs):
        """订单统计"""
        from django.db.models import Count, Sum
        
        total_orders = self.queryset.count()
        total_amount = self.queryset.aggregate(total=Sum('total_amount'))['total'] or 0
        platform_fee_total = self.queryset.aggregate(total=Sum('platform_fee'))['total'] or 0
        
        # 按状态统计
        status_stats = self.queryset.values('status').annotate(
            count=Count('id'),
            amount=Sum('total_amount')
        ).order_by('status')
        
        return SuccessResponse(data={
            'total_orders': total_orders,
            'total_amount': float(total_amount),
            'platform_fee_total': float(platform_fee_total),
            'status_stats': list(status_stats)
        })

    @action(methods=["POST"], detail=False, permission_classes=[EscortUserPermission])
    def wx_pay(self, request, *args, **kwargs):
        """
        微信支付 - 统一下单接口
        ---
        前端调用 uni.requestPayment({ provider: 'wxpay', ... }) 拉起微信支付
        1. 根据 order_no 查到待支付订单
        2. 统一下单 POST 到微信
        3. 返回调起支付所需的参数（timeStamp/nonceStr/package/signType/paySign）
        """
        order_no = request.data.get('order_no', '').strip()
        if not order_no:
            return ErrorResponse(msg="order_no 不能为空")

        # 获取当前登录用户（通过 JWT token 中的 openid）
        openid = None
        if hasattr(request, 'auth') and request.auth:
            openid = request.auth.get('openid')
        if not openid:
            return ErrorResponse(msg="未登录")

        # 查询订单
        try:
            order = Order.objects.select_related('customer', 'service').get(order_no=order_no)
        except Order.DoesNotExist:
            return ErrorResponse(msg="订单不存在")
        if order.customer.openid != openid:
            return ErrorResponse(msg="无权操作此订单")
        if order.status != Order.STATUS_PENDING_PAYMENT:
            return ErrorResponse(msg="订单状态不是待支付")

        # 金额：微信支付以分为单位
        total_fee = int(float(order.total_amount) * 100)
        if total_fee <= 0:
            return ErrorResponse(msg="订单金额异常")

        # 构造统一下单参数
        nonce_str = _random_str(32)
        out_trade_no = f"{order_no}{int(time.time())}"   # 微信要求唯一性，加时间戳
        now = time.strftime('%Y%m%d%H%M%S')

        params = {
            'appid': settings.WECHAT_MINI_APPID,
            'mch_id': settings.WECHAT_MCHID,
            'nonce_str': nonce_str,
            'body': order.service.name,                            # 商品描述
            'out_trade_no': out_trade_no,                          # 商户订单号
            'total_fee': total_fee,                                 # 订单金额（分）
            'spbill_create_ip': _get_client_ip(request),           # 客户端IP
            'notify_url': settings.WECHAT_NOTIFY_URL,              # 支付结果回调
            'trade_type': 'JSAPI',
            'openid': order.customer.openid,                        # 用户 openid
        }
        params['sign'] = _build_sign(params)

        # 调微信统一下单接口
        wx_url = "https://api.mch.weixin.qq.com/pay/unifiedorder"
        try:
            import urllib.request
            xml_data = _dict_to_xml(params)
            req = urllib.request.Request(
                wx_url,
                data=xml_data.encode('utf-8'),
                headers={'Content-Type': 'application/xml'}
            )
            with urllib.request.urlopen(req, timeout=15) as resp:
                result_xml = resp.read().decode('utf-8')
        except Exception as e:
            return ErrorResponse(msg=f"微信支付服务异常: {e}")

        result = _xml_to_dict(result_xml)
        if result.get('return_code') != 'SUCCESS' or result.get('result_code') != 'SUCCESS':
            return ErrorResponse(msg=f"微信支付下单失败: {result.get('return_msg', '')} {result.get('err_code_des', '')}")

        # 保存微信支付单号到订单
        order.out_trade_no = out_trade_no
        order.save(update_fields=['out_trade_no'])

        # ========== 返回调起支付所需参数 ==========
        # 小程序 JSAPI 调起支付需要: timeStamp / nonceStr / package / signType / paySign
        pay_timestamp = str(int(time.time()))
        pay_nonce_str = _random_str(32)
        prepay_id = result.get('prepay_id', '')
        # 确保 package 格式正确：prepay_id=xxx
        package_value = f"prepay_id={prepay_id}" if not prepay_id.startswith('prepay_id=') else prepay_id

        pay_params = {
            'appId': settings.WECHAT_MINI_APPID,
            'timeStamp': pay_timestamp,
            'nonceStr': pay_nonce_str,
            'package': package_value,
            'signType': 'MD5',
        }
        pay_params['paySign'] = _build_sign(pay_params)

        return SuccessResponse(data={
            'order_no': order_no,
            'out_trade_no': out_trade_no,
            'payParams': pay_params,       # 前端直接传给 uni.requestPayment
        })

    @action(methods=["POST"], detail=False, permission_classes=[])
    def wx_notify(self, request, *args, **kwargs):
        """
        微信支付结果回调通知
        ---
        微信支付成功后，微信服务器 POST 本接口，通知支付结果。
        收到通知后返回 SUCCESS，订单状态改为待接单。
        """
        try:
            xml_data = request.body.decode('utf-8')
            notify_data = _xml_to_dict(xml_data)
        except Exception:
            return DetailResponse(data={'return_code': 'FAIL', 'return_msg': '解析失败'})

        sign = notify_data.get('sign', '')
        # 验证签名（先把 sign 字段去掉再算）
        calc_sign = _build_sign({k: v for k, v in notify_data.items() if k != 'sign'})
        if calc_sign != sign:
            return DetailResponse(data={'return_code': 'FAIL', 'return_msg': '签名错误'})

        if notify_data.get('return_code') != 'SUCCESS':
            return DetailResponse(data={'return_code': 'FAIL', 'return_msg': '微信返回失败'})

        # 根据 out_trade_no 精确定位订单
        out_trade_no = notify_data.get('out_trade_no', '')
        transaction_id = notify_data.get('transaction_id', '')
        if not out_trade_no:
            return DetailResponse(data={'return_code': 'FAIL', 'return_msg': '缺少 out_trade_no'})

        try:
            order = Order.objects.get(out_trade_no=out_trade_no)
        except Order.DoesNotExist:
            return DetailResponse(data={'return_code': 'FAIL', 'return_msg': '订单不存在'})

        if order.status == Order.STATUS_PENDING_PAYMENT:
            order.status = Order.STATUS_PENDING_ACCEPT
            order.pay_time = timezone.now()
            order.save(update_fields=['status', 'pay_time'])

        return DetailResponse(data={'return_code': 'SUCCESS', 'return_msg': 'OK'})

    @action(methods=["POST"], detail=True, permission_classes=[EscortUserPermission])
    def accept(self, request, *args, **kwargs):
        """
        打手接单
        - 单人订单：打手直接接单，订单变为"服务中"
        - 多人订单：打手接单后成为抢单人，订单变为"等待搭子"
        """
        instance = self.get_object()
        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id

        # 验证订单状态必须是"待接单"
        if instance.status != Order.STATUS_PENDING_ACCEPT:
            return ErrorResponse(msg="该订单不在可接单状态")

        # 检查打手是否已通过认证
        from ..models import EscortUser
        try:
            hunter = EscortUser.objects.get(id=user_id)
        except EscortUser.DoesNotExist:
            return ErrorResponse(msg="用户不存在")

        if hunter.hunter_status != EscortUser.HUNTER_APPROVED:
            return ErrorResponse(msg="您还未通过打手认证，无法接单")

        # 检查是否已接过此单
        if OrderHunter.objects.filter(order=instance, hunter=hunter).exists():
            return ErrorResponse(msg="您已接过此订单")

        # 单人订单 vs 多人订单
        service_type = getattr(instance.service, 'service_type', 1)
        required_hunters = getattr(instance.service, 'required_hunters', 1)

        if service_type == 1 or required_hunters == 1:
            # 单人订单：直接接单，服务中
            OrderHunter.objects.create(
                order=instance,
                hunter=hunter,
                is_primary=True,
                share_percentage=100.0,
                share_amount=instance.hunter_share or instance.total_amount,
            )
            instance.status = Order.STATUS_IN_SERVICE
            instance.accept_time = timezone.now()
            instance.service_start_time = timezone.now()
            instance.save(update_fields=['status', 'accept_time', 'service_start_time', 'update_datetime'])
            return SuccessResponse(msg="接单成功，订单已开始服务")
        else:
            # 多人订单：成为抢单人，等待搭子
            OrderHunter.objects.create(
                order=instance,
                hunter=hunter,
                is_primary=True,
                share_percentage=100.0 / required_hunters,
                share_amount=0,
            )
            instance.status = Order.STATUS_WAITING_PARTNER
            instance.accept_time = timezone.now()
            instance.save(update_fields=['status', 'accept_time', 'update_datetime'])
            return SuccessResponse(msg="接单成功，您是抢单人，请邀请搭子加入", data={
                'order_id': instance.id,
                'required_hunters': required_hunters,
                'current_hunters': 1,
                'status': instance.status,
                'status_display': instance.get_status_display(),
            })

    @action(methods=["POST"], detail=True, permission_classes=[EscortUserPermission])
    def hunter_complete(self, request, *args, **kwargs):
        """
        打手完成服务
        - 只有抢单人可以点击"确定上号打单"
        - 点击后所有参与打手进入"服务中"或"待确认"状态
        """
        instance = self.get_object()
        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id

        from ..models import EscortUser
        try:
            hunter = EscortUser.objects.get(id=user_id)
        except EscortUser.DoesNotExist:
            return ErrorResponse(msg="用户不存在")

        # 必须是已接单或等待搭子状态
        if instance.status not in [Order.STATUS_ACCEPTED, Order.STATUS_WAITING_PARTNER]:
            return ErrorResponse(msg="当前状态无法开始服务")

        # 查找该打手在订单中的记录
        try:
            order_hunter = OrderHunter.objects.get(order=instance, hunter=hunter)
        except OrderHunter.DoesNotExist:
            return ErrorResponse(msg="您未参与此订单")

        # 多人订单：必须由抢单人发起
        if instance.status == Order.STATUS_WAITING_PARTNER:
            required_hunters = getattr(instance.service, 'required_hunters', 1)
            current_count = instance.hunters.count()
            if current_count < required_hunters:
                return ErrorResponse(msg=f"还需要 {required_hunters - current_count} 名搭子才能开始服务")

            if not order_hunter.is_primary:
                return ErrorResponse(msg="只有抢单人可以开始服务")

            # 计算每人的分成金额
            hunter_share_per = (float(instance.hunter_share) / required_hunters) if instance.hunter_share else (float(instance.total_amount) * 0.85 / required_hunters)
            for oh in instance.hunters.all():
                oh.share_amount = Decimal(str(round(hunter_share_per, 2)))
                oh.save(update_fields=['share_amount', 'update_datetime'])

            instance.status = Order.STATUS_IN_SERVICE
            instance.service_start_time = timezone.now()
            instance.save(update_fields=['status', 'service_start_time', 'update_datetime'])
            return SuccessResponse(msg="服务已开始，祝您游戏愉快！")

        # 单人订单：直接开始服务
        instance.status = Order.STATUS_IN_SERVICE
        instance.service_start_time = timezone.now()
        instance.save(update_fields=['status', 'service_start_time', 'update_datetime'])
        return SuccessResponse(msg="服务已开始，祝您游戏愉快！")

    @action(methods=["POST"], detail=True, permission_classes=[EscortUserPermission])
    def invite_buddy(self, request, *args, **kwargs):
        """
        邀请搭子加入订单（仅限多人订单）
        前端传 buddy_id，后端从搭子关系中查找并绑定
        """
        instance = self.get_object()
        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id

        buddy_id = request.data.get('buddy_id')
        if not buddy_id:
            return ErrorResponse(msg="请选择要邀请的搭子")

        if instance.status != Order.STATUS_WAITING_PARTNER:
            return ErrorResponse(msg="当前订单状态不允许邀请搭子")

        from ..models import EscortUser, BuddyRelation
        try:
            hunter = EscortUser.objects.get(id=user_id)
            buddy = EscortUser.objects.get(id=buddy_id)
        except EscortUser.DoesNotExist as e:
            return ErrorResponse(msg="用户不存在")

        # 验证是搭子关系
        is_buddy = BuddyRelation.objects.filter(
            models.Q(user_a=hunter, user_b=buddy) | models.Q(user_a=buddy, user_b=hunter),
            status=BuddyRelation.BUDDY_ACTIVE
        ).exists()
        if not is_buddy:
            return ErrorResponse(msg="该用户不是您的搭子，无法邀请")

        # 检查是否已在订单中
        if OrderHunter.objects.filter(order=instance, hunter=buddy).exists():
            return ErrorResponse(msg="该搭子已在订单中")

        required_hunters = getattr(instance.service, 'required_hunters', 1)
        current_count = instance.hunters.count()
        if current_count >= required_hunters:
            return ErrorResponse(msg="订单已满，无需再邀请搭子")

        # 计算分成比例
        new_share_pct = 100.0 / (current_count + 1)
        OrderHunter.objects.create(
            order=instance,
            hunter=buddy,
            is_primary=False,
            share_percentage=new_share_pct,
            share_amount=0,
        )

        # 更新所有打手分成比例
        for oh in instance.hunters.all():
            oh.share_percentage = new_share_pct
            oh.save(update_fields=['share_percentage', 'update_datetime'])

        new_count = instance.hunters.count()

        # 如果人数够了，自动进入服务中
        if new_count >= required_hunters:
            instance.status = Order.STATUS_IN_SERVICE
            instance.service_start_time = timezone.now()
            instance.save(update_fields=['status', 'service_start_time', 'update_datetime'])
            msg = f"搭子已加入，人数已满，服务开始！"
        else:
            msg = f"搭子已加入，还需 {required_hunters - new_count} 人"

        return SuccessResponse(msg=msg, data={
            'order_id': instance.id,
            'required_hunters': required_hunters,
            'current_hunters': new_count,
            'status': instance.status,
            'status_display': instance.get_status_display(),
        })

    @action(methods=["POST"], detail=True, permission_classes=[EscortUserPermission])
    def confirm_service_done(self, request, *args, **kwargs):
        """
        客户确认服务完成
        """
        instance = self.get_object()
        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id

        if instance.customer_id != user_id:
            return ErrorResponse(msg="只有下单客户可以确认服务完成")

        if instance.status != Order.STATUS_IN_SERVICE:
            return ErrorResponse(msg="当前状态无法确认服务完成")

        instance.status = Order.STATUS_PENDING_CONFIRM
        instance.service_end_time = timezone.now()
        instance.save(update_fields=['status', 'service_end_time', 'update_datetime'])
        return SuccessResponse(msg="已确认服务完成，等待您最终确认并完成支付结算")

    @action(methods=["POST"], detail=True, permission_classes=[EscortUserPermission])
    def confirm_complete(self, request, *args, **kwargs):
        """
        客户最终确认订单完成，分配收益给打手
        """
        instance = self.get_object()
        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id

        if instance.customer_id != user_id:
            return ErrorResponse(msg="只有下单客户可以确认完成")

        if instance.status != Order.STATUS_PENDING_CONFIRM:
            return ErrorResponse(msg="当前状态无法确认完成")

        # 计算并分配收益
        from ..models import EscortUser
        order_hunters = instance.hunters.all()
        total_share = float(instance.hunter_share) if instance.hunter_share else float(instance.total_amount) * 0.85
        share_per = total_share / order_hunters.count() if order_hunters.count() > 0 else 0

        for oh in order_hunters:
            oh.share_amount = Decimal(str(round(share_per, 2)))
            oh.save(update_fields=['share_amount', 'update_datetime'])
            # 更新打手余额和总收入
            EscortUser.objects.filter(id=oh.hunter_id).update(
                balance=models.F('balance') + oh.share_amount,
                total_income=models.F('total_income') + oh.share_amount,
            )

        instance.status = Order.STATUS_COMPLETED
        instance.complete_time = timezone.now()
        instance.save(update_fields=['status', 'complete_time', 'update_datetime'])

        return SuccessResponse(msg="订单已完成，收益已打入打手账户")

    @action(methods=["GET"], detail=False, permission_classes=[EscortUserPermission])
    def my(self, request, *args, **kwargs):
        """
        打手获取自己已接的订单列表
        """
        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id
        status_filter = request.query_params.get('status')

        queryset = Order.objects.filter(hunters__hunter_id=user_id).distinct().order_by('-create_datetime')

        if status_filter is not None:
            try:
                queryset = queryset.filter(status=int(status_filter))
            except ValueError:
                pass

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return SuccessResponse(data=serializer.data)

    @action(methods=["GET"], detail=False, permission_classes=[EscortUserPermission])
    def customer_orders(self, request, *args, **kwargs):
        """
        客户获取自己下过的订单列表
        """
        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id
        status_filter = request.query_params.get('status')

        queryset = Order.objects.filter(customer_id=user_id).order_by('-create_datetime')

        if status_filter is not None:
            try:
                queryset = queryset.filter(status=int(status_filter))
            except ValueError:
                pass

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return SuccessResponse(data=serializer.data)

    @action(methods=["GET"], detail=False, permission_classes=[EscortUserPermission])
    def query_payment_status(self, request, *args, **kwargs):
        """
        查询订单支付状态 - 主动查询微信确认是否已支付
        前端在用户完成支付后调用此接口查询真实支付状态
        """
        order_no = request.query_params.get('order_no', '').strip()
        if not order_no:
            return ErrorResponse(msg="order_no 不能为空")

        # 获取当前登录用户
        openid = None
        if hasattr(request, 'auth') and request.auth:
            openid = request.auth.get('openid')
        if not openid:
            return ErrorResponse(msg="未登录")

        # 查询订单
        try:
            order = Order.objects.select_related('customer').get(order_no=order_no)
        except Order.DoesNotExist:
            return ErrorResponse(msg="订单不存在")

        if order.customer.openid != openid:
            return ErrorResponse(msg="无权操作此订单")

        # 如果已经是已支付状态，直接返回
        if order.status != Order.STATUS_PENDING_PAYMENT:
            return SuccessResponse(data={
                'order_no': order_no,
                'status': order.status,
                'status_display': order.get_status_display(),
                'pay_time': order.pay_time,
                'is_paid': order.status >= Order.STATUS_PENDING_ACCEPT,
            })

        # 如果没有 out_trade_no，说明还没调起过支付
        if not order.out_trade_no:
            return SuccessResponse(data={
                'order_no': order_no,
                'status': order.status,
                'status_display': order.get_status_display(),
                'is_paid': False,
            })

        # 调用微信查询订单接口
        import logging
        logger = logging.getLogger('django')

        nonce_str = _random_str(32)
        params = {
            'appid': settings.WECHAT_MINI_APPID,
            'mch_id': settings.WECHAT_MCHID,
            'out_trade_no': order.out_trade_no,
            'nonce_str': nonce_str,
        }
        params['sign'] = _build_sign(params)

        wx_url = "https://api.mch.weixin.qq.com/pay/orderquery"
        try:
            xml_data = _dict_to_xml(params)
            req = urllib.request.Request(
                wx_url,
                data=xml_data.encode('utf-8'),
                headers={'Content-Type': 'application/xml'}
            )
            with urllib.request.urlopen(req, timeout=15) as resp:
                result_xml = resp.read().decode('utf-8')
        except Exception as e:
            logger.error(f"[QUERY_PAYMENT] 查询支付状态失败: {e}")
            return ErrorResponse(msg=f"查询支付状态失败: {e}")

        result = _xml_to_dict(result_xml)
        logger.info(f"[QUERY_PAYMENT] 微信返回: {result}")

        # 解析支付状态
        trade_state = result.get('trade_state', '')
        is_paid = trade_state == 'SUCCESS'
        trade_state_desc = result.get('trade_state_desc', '')

        # 如果微信确认已支付，更新订单状态
        if is_paid:
            order.status = Order.STATUS_PENDING_ACCEPT
            order.pay_time = timezone.now()
            order.save(update_fields=['status', 'pay_time'])
            logger.info(f"[QUERY_PAYMENT] 订单 {order_no} 状态已更新为已支付")
        else:
            logger.info(f"[QUERY_PAYMENT] 订单 {order_no} 尚未支付, 状态: {trade_state_desc}")

        return SuccessResponse(data={
            'order_no': order_no,
            'status': order.status,
            'status_display': order.get_status_display(),
            'is_paid': is_paid,
            'trade_state': trade_state,
            'trade_state_desc': trade_state_desc,
            'pay_time': order.pay_time,
        })


def _get_client_ip(request) -> str:
    """获取客户端真实 IP"""
    x_forwarded = request.META.get('HTTP_X_FORWARDED_FOR', '')
    if x_forwarded:
        return x_forwarded.split(',')[0].strip()
    return request.META.get('REMOTE_ADDR', '127.0.0.1')