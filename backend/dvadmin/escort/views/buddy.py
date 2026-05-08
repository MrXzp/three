# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact:
@Created on: 2026/4/2
@Remark: 搭子关系视图
"""
import uuid
from rest_framework import serializers
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
from dvadmin.utils.json_response import ErrorResponse, DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet
from ..models import BuddyRelation, EscortUser


class BuddyRelationSerializer(CustomModelSerializer):
    """搭子关系序列化器"""
    user_a_nickname = serializers.CharField(source='user_a.nickname', read_only=True, label='用户A昵称')
    user_a_avatar = serializers.CharField(source='user_a.avatar_url', read_only=True, label='用户A头像')
    user_a_hunter_status = serializers.IntegerField(source='user_a.hunter_status', read_only=True, label='用户A打手状态')

    user_b_nickname = serializers.CharField(source='user_b.nickname', read_only=True, label='用户B昵称')
    user_b_avatar = serializers.CharField(source='user_b.avatar_url', read_only=True, label='用户B头像')
    user_b_hunter_status = serializers.IntegerField(source='user_b.hunter_status', read_only=True, label='用户B打手状态')

    class Meta:
        model = BuddyRelation
        read_only_fields = ["id"]
        fields = ['id', 'user_a', 'user_b', 'status',
                 'user_a_nickname', 'user_a_avatar', 'user_a_hunter_status',
                 'user_b_nickname', 'user_b_avatar', 'user_b_hunter_status',
                 'create_datetime', 'update_datetime']
        extra_kwargs = {
            "create_datetime": {"required": False},
            "update_datetime": {"required": False},
        }


class BuddyRelationViewSet(CustomModelViewSet):
    permission_classes = []  # 禁用所有权限类，由 action 单独控制
    extra_filter_class = []  # 禁用数据级权限过滤，EscortUser 没有 manage_dept 等字段
    """
    搭子关系管理
    """

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]

    queryset = BuddyRelation.objects.all().select_related('user_a', 'user_b')
    serializer_class = BuddyRelationSerializer
    filter_fields = ['user_a', 'user_b', 'status']
    search_fields = ['user_a__nickname', 'user_b__nickname', 'user_a__phone', 'user_b__phone']
    permission_classes = []

    def get_queryset(self):
        queryset = super().get_queryset()
        # 默认只查活跃搭子
        if self.action in ['my', 'list']:
            queryset = queryset.filter(status=BuddyRelation.BUDDY_ACTIVE)
        # 根据用户筛选
        user_id = self.request.query_params.get('user_id', None)
        if user_id is not None:
            queryset = queryset.filter(user_a_id=user_id) | queryset.filter(user_b_id=user_id)
        return queryset

    @action(methods=['GET'], detail=False)
    def my(self, request):
        """获取当前认证用户的搭子列表"""
        user = request.user
        buddies = BuddyRelation.objects.filter(
            status=BuddyRelation.BUDDY_ACTIVE
        ).filter(
            user_a=user
        ) | BuddyRelation.objects.filter(
            status=BuddyRelation.BUDDY_ACTIVE
        ).filter(
            user_b=user
        )

        buddy_list = []
        for buddy in buddies:
            if buddy.user_a == user:
                other_user = buddy.user_b
            else:
                other_user = buddy.user_a

            buddy_list.append({
                'id': buddy.id,
                'buddy': {
                    'id': other_user.id,
                    'nickname': other_user.nickname,
                    'avatar_url': other_user.avatar_url,
                    'hunter_status': other_user.hunter_status,
                },
                'status': buddy.status,
                'create_datetime': buddy.create_datetime
            })

        return DetailResponse(data=buddy_list)

    @action(methods=['POST'], detail=False)
    def generate_code(self, request):
        """生成搭子邀请码"""
        user = request.user
        if user.hunter_status != EscortUser.HUNTER_APPROVED:
            return ErrorResponse(msg='只有认证打手才能生成邀请码')

        code = uuid.uuid4().hex[:12].upper()
        return SuccessResponse(data={
            'code': code,
            'qrcode_url': f'/api/escort/app/buddy/qrcode/?code={code}'
        })

    @action(methods=['GET'], detail=False)
    def qrcode(self, request):
        """生成邀请二维码（返回临时 URL，实际由前端生成）"""
        code = request.query_params.get('code', '')
        return SuccessResponse(data={'code': code})

    @action(methods=['POST'], detail=False)
    def bind(self, request):
        """扫码绑定搭子"""
        user = request.user
        code = request.data.get('code', '').strip()

        if not code:
            return ErrorResponse(msg='邀请码不能为空')

        if user.hunter_status != EscortUser.HUNTER_APPROVED:
            return ErrorResponse(msg='只有认证打手才能绑定搭子')

        # 根据邀请码找人（简化：邀请码即对方用户ID的hash）
        # 实际项目中邀请码应存入数据库，此处用手机号后4位做简化匹配
        buddy_phone_last4 = code[-4:]
        if not buddy_phone_last4.isdigit():
            return ErrorResponse(msg='邀请码格式无效')

        try:
            buddy = EscortUser.objects.get(phone__endswith=buddy_phone_last4, hunter_status=EscortUser.HUNTER_APPROVED)
        except EscortUser.DoesNotExist:
            return ErrorResponse(msg='未找到该搭子，请确认对方是认证打手')
        except EscortUser.MultipleObjectsReturned:
            return ErrorResponse(msg='邀请码不唯一，请使用完整邀请码')

        if buddy.id == user.id:
            return ErrorResponse(msg='不能添加自己为搭子')

        # 检查是否已是搭子
        existing = BuddyRelation.objects.filter(status=BuddyRelation.BUDDY_ACTIVE).filter(
            user_a=user, user_b=buddy
        ) | BuddyRelation.objects.filter(status=BuddyRelation.BUDDY_ACTIVE).filter(
            user_a=buddy, user_b=user
        )
        if existing.exists():
            return ErrorResponse(msg='已经是搭子了')

        buddy_relation = BuddyRelation.objects.create(
            user_a=user,
            user_b=buddy,
            status=BuddyRelation.BUDDY_ACTIVE
        )
        return SuccessResponse(data=BuddyRelationSerializer(buddy_relation).data, msg='绑定成功')

    @action(methods=['POST'], detail=True)
    def remove_buddy(self, request, *args, **kwargs):
        """删除搭子关系（软删除）"""
        instance = self.get_object()
        instance.status = BuddyRelation.BUDDY_DELETED
        instance.save()
        return SuccessResponse(msg='搭子关系已解除')