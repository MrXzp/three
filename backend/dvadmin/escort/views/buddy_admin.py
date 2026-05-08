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
            'real_name', 'id_card', 'id_card_front', 'id_card_back',
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
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]

    # 注意：此处展示所有状态的打手（含待审核），以便管理员进行审批操作
    queryset = EscortUser.objects.filter(
        hunter_status__in=[
            EscortUser.HUNTER_PENDING,
            EscortUser.HUNTER_APPROVED,
            EscortUser.HUNTER_SUSPENDED,
            EscortUser.HUNTER_NOT_APPLIED,
        ]
    ).order_by('-apply_time', '-create_datetime')
    serializer_class = BuddySerializer
    create_serializer_class = BuddyCreateUpdateSerializer
    update_serializer_class = BuddyCreateUpdateSerializer
    filter_fields = ['hunter_status']
    search_fields = ['nickname', 'openid', 'phone']
    permission_classes = []

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]

    @action(methods=["GET"], detail=False, permission_classes=[])
    def statistics(self, request, *args, **kwargs):
        """打手统计（包含所有状态）"""
        from django.db.models import Q
        queryset = EscortUser.objects.filter(
            Q(hunter_status__in=[
                EscortUser.HUNTER_PENDING,
                EscortUser.HUNTER_APPROVED,
                EscortUser.HUNTER_SUSPENDED,
                EscortUser.HUNTER_REJECTED,
            ])
        )
        total = queryset.count()
        pending = queryset.filter(hunter_status=EscortUser.HUNTER_PENDING).count()
        active = queryset.filter(hunter_status=EscortUser.HUNTER_APPROVED).count()
        suspended = queryset.filter(hunter_status=EscortUser.HUNTER_SUSPENDED).count()
        total_income = queryset.aggregate(total=Sum('total_income'))['total'] or 0
        total_balance = queryset.aggregate(total=Sum('balance'))['total'] or 0

        return SuccessResponse(data={
            'total_hunters': total,
            'pending_hunters': pending,
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

    # ========== Web 端管理员专用接口 ==========

    @action(methods=["POST"], detail=True, permission_classes=[])
    def approve_hunter(self, request, *args, **kwargs):
        """批准打手申请（Web 端管理员专用）"""
        instance = self.get_object()
        if instance.hunter_status != EscortUser.HUNTER_PENDING:
            return ErrorResponse(msg="只有审核中的申请才能批准")
        instance.hunter_status = EscortUser.HUNTER_APPROVED
        instance.approve_time = timezone.now()
        instance.save()
        return SuccessResponse(msg="打手申请已批准")

    @action(methods=["POST"], detail=True, permission_classes=[])
    def reject_hunter(self, request, *args, **kwargs):
        """拒绝打手申请（Web 端管理员专用）"""
        instance = self.get_object()
        if instance.hunter_status != EscortUser.HUNTER_PENDING:
            return ErrorResponse(msg="只有审核中的申请才能拒绝")
        reject_reason = request.data.get('reject_reason', '资料审核不通过，请重新提交')
        instance.hunter_status = EscortUser.HUNTER_REJECTED
        instance.reject_reason = reject_reason
        instance.save()
        return SuccessResponse(msg="打手申请已拒绝")
