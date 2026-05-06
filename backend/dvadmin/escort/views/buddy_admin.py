# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact:
@Created on: 2026/4/8
@Remark: 打手管理API（独立于普通用户管理）
"""
from django.utils import timezone
from django.db.models import Sum
from rest_framework import serializers
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
from dvadmin.utils.json_response import ErrorResponse, DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet
from ..models import EscortUser


class BuddySerializer(CustomModelSerializer):
    """打手管理-序列化器"""
    hunter_status_display = serializers.CharField(source='get_hunter_status_display', read_only=True)

    class Meta:
        model = EscortUser
        read_only_fields = ["id"]
        fields = [
            'id', 'openid', 'nickname', 'avatar_url', 'phone',
            'hunter_status', 'hunter_status_display',
            'apply_time', 'approve_time', 'reject_reason',
            'balance', 'total_income', 'total_withdrawal',
            'completed_orders', 'avg_rating',
            'create_datetime', 'update_datetime',
        ]


class BuddyCreateUpdateSerializer(CustomModelSerializer):
    """打手管理-创建/更新序列化器（仅允许修改手机号和余额）"""

    class Meta:
        model = EscortUser
        fields = ['phone', 'balance']


class BuddyViewSet(CustomModelViewSet):
    """打手管理接口 — 只展示打手身份的用户（hunter_status >= 2）"""
    extra_filter_class = []  # 禁用数据级权限过滤

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        return [EscortUserAuthentication()]

    queryset = EscortUser.objects.filter(
        hunter_status__in=[EscortUser.HUNTER_APPROVED, EscortUser.HUNTER_SUSPENDED]
    ).order_by('-approve_time', '-create_datetime')
    serializer_class = BuddySerializer
    create_serializer_class = BuddyCreateUpdateSerializer
    update_serializer_class = BuddyCreateUpdateSerializer
    filter_fields = ['hunter_status']
    search_fields = ['nickname', 'openid', 'phone']
    permission_classes = []

    @action(methods=["GET"], detail=False, permission_classes=[])
    def statistics(self, request, *args, **kwargs):
        """打手统计"""
        queryset = self.queryset
        total = queryset.count()
        active = queryset.filter(hunter_status=EscortUser.HUNTER_APPROVED).count()
        suspended = queryset.filter(hunter_status=EscortUser.HUNTER_SUSPENDED).count()
        total_income = queryset.aggregate(total=Sum('total_income'))['total'] or 0
        total_balance = queryset.aggregate(total=Sum('balance'))['total'] or 0

        return SuccessResponse(data={
            'total_hunters': total,
            'active_hunters': active,
            'suspended_hunters': suspended,
            'total_income': float(total_income),
            'total_balance': float(total_balance),
        })

    @action(methods=["POST"], detail=True, permission_classes=[])
    def revoke(self, request, *args, **kwargs):
        """撤销打手身份 — 将 hunter_status 重置为未申请，清空打手相关字段"""
        instance = self.get_object()
        instance.hunter_status = EscortUser.HUNTER_NOT_APPLIED
        instance.apply_time = None
        instance.approve_time = None
        instance.reject_reason = None
        instance.save()
        return SuccessResponse(msg="打手身份已撤销，用户仍保留在用户列表中")

    @action(methods=["POST"], detail=True, permission_classes=[])
    def suspend(self, request, *args, **kwargs):
        """暂停打手"""
        instance = self.get_object()
        if instance.hunter_status != EscortUser.HUNTER_APPROVED:
            return ErrorResponse(msg="只有已通过的打手才能暂停")
        instance.hunter_status = EscortUser.HUNTER_SUSPENDED
        instance.save()
        return SuccessResponse(msg="打手已暂停")

    @action(methods=["POST"], detail=True, permission_classes=[])
    def activate(self, request, *args, **kwargs):
        """激活打手"""
        instance = self.get_object()
        if instance.hunter_status != EscortUser.HUNTER_SUSPENDED:
            return ErrorResponse(msg="只有已暂停的打手才能激活")
        instance.hunter_status = EscortUser.HUNTER_APPROVED
        instance.save()
        return SuccessResponse(msg="打手已激活")
