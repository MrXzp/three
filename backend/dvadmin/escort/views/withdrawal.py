# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact: 
@Created on: 2026/4/2
@Remark: 提现申请视图
"""
from rest_framework import serializers
from rest_framework.decorators import action
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
from dvadmin.utils.json_response import ErrorResponse, DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet
from ..models import Withdrawal, EscortUser


class WithdrawalSerializer(CustomModelSerializer):
    """提现申请序列化器"""
    user_nickname = serializers.CharField(source='user.nickname', read_only=True, label='用户昵称')
    user_phone = serializers.CharField(source='user.phone', read_only=True, label='用户手机号')
    user_balance = serializers.DecimalField(source='user.balance', read_only=True, max_digits=10, decimal_places=2, label='用户余额')
    
    class Meta:
        model = Withdrawal
        read_only_fields = ["id"]
        fields = ['id', 'user', 'user_nickname', 'user_phone', 'user_balance', 'amount', 'tax_amount', 'actual_amount', 'status', 'payment_no', 'payment_time', 'review_notes', 'review_time', 'create_datetime', 'update_datetime', 'creator', 'modifier']
        extra_kwargs = {
            "create_datetime": {"required": False},
            "update_datetime": {"required": False},
        }


class WithdrawalViewSet(CustomModelViewSet):
    permission_classes = []  # 禁用所有权限类，由 action 单独控制
    extra_filter_class = []  # 禁用数据级权限过滤，EscortUser 没有 manage_dept 等字段
    """
    提现申请管理
    """

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]

    queryset = Withdrawal.objects.all().select_related('user')
    serializer_class = WithdrawalSerializer
    filter_fields = ['user', 'status']
    search_fields = ['user__nickname', 'user__phone', 'payment_no']
    
    def get_queryset(self):
        queryset = super().get_queryset()
        # 根据状态筛选
        status = self.request.query_params.get('status', None)
        if status is not None:
            queryset = queryset.filter(status=status)
        return queryset

    @action(methods=['POST'], detail=False)
    def apply(self, request):
        """用户提交提现申请（含余额校验）"""
        from decimal import Decimal
        amount = request.data.get('amount')
        if amount is None:
            return ErrorResponse(msg='请填写提现金额')
        try:
            amount = Decimal(str(amount))
        except Exception:
            return ErrorResponse(msg='提现金额格式错误')
        if amount < Decimal('10'):
            return ErrorResponse(msg='提现金额最低 ¥10')
        if amount > Decimal('5000'):
            return ErrorResponse(msg='单笔提现最高 ¥5000')
        user = request.user
        if amount > user.balance:
            return ErrorResponse(msg='提现金额不能超过可提现余额（¥' + str(user.balance) + '）')
        # 个税计算
        tax_threshold = Decimal('800')
        tax_rate = Decimal('0.20')
        tax = Decimal('0')
        if amount > tax_threshold:
            tax = (amount - tax_threshold) * tax_rate
        actual = amount - tax
        Withdrawal.objects.create(
            creator=user,
            modifier=user,
            user=user,
            amount=amount,
            tax_amount=tax,
            actual_amount=actual,
            status=Withdrawal.STATUS_PENDING,
        )
        return SuccessResponse(msg='提现申请已提交')

    @action(methods=['POST'], detail=True)
    def approve(self, request, *args, **kwargs):
        """批准提现申请"""
        from django.utils import timezone
        instance = self.get_object()
        
        if instance.status != Withdrawal.STATUS_PENDING:
            return ErrorResponse(msg='只能处理申请中的提现')
        
        # 检查用户余额是否足够
        if instance.user.balance < instance.amount:
            return ErrorResponse(msg='用户余额不足')
        
        # 更新状态为处理中
        instance.status = Withdrawal.STATUS_PROCESSING
        instance.review_notes = request.data.get('review_notes', '')
        instance.review_time = timezone.now()
        instance.save()
        
        # 扣除用户余额（实际支付时再扣除）
        # instance.user.balance -= instance.amount
        # instance.user.save()
        
        return SuccessResponse(msg='提现申请已批准，进入处理中状态')
    
    @action(methods=['POST'], detail=True)
    def complete(self, request, *args, **kwargs):
        """完成提现（模拟支付成功）"""
        import time
        from django.utils import timezone
        instance = self.get_object()
        
        if instance.status != Withdrawal.STATUS_PROCESSING:
            return ErrorResponse(msg='只能处理处理中的提现')
        
        # 模拟支付成功
        
        # 扣除用户余额
        instance.user.balance -= instance.amount
        instance.user.total_withdrawal += instance.amount
        instance.user.save()
        
        # 更新提现记录
        instance.status = Withdrawal.STATUS_SUCCESS
        instance.payment_no = f'WXPAY{int(time.time() * 1000)}'
        instance.payment_time = timezone.now()
        instance.save()
        
        return SuccessResponse(msg='提现成功，已模拟支付完成')
    
    @action(methods=['POST'], detail=True)
    def reject(self, request, *args, **kwargs):
        """拒绝提现申请"""
        from django.utils import timezone
        instance = self.get_object()
        
        if instance.status != Withdrawal.STATUS_PENDING:
            return ErrorResponse(msg='只能拒绝申请中的提现')
        
        review_notes = request.data.get('review_notes', '')
        if not review_notes:
            return ErrorResponse(msg='请填写拒绝原因')
        
        instance.status = Withdrawal.STATUS_FAILED
        instance.review_notes = review_notes
        instance.review_time = timezone.now()
        instance.save()
        
        return SuccessResponse(msg='提现申请已拒绝')