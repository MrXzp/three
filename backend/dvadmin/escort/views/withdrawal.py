# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact: 
@Created on: 2026/4/2
@Remark: 提现申请视图
"""
from decimal import Decimal
import json
import time

from django.db import transaction
from django.db.models import F
from django.utils import timezone
from rest_framework import serializers
from rest_framework.decorators import action
from rest_framework.response import Response
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication, EscortUserPermission, EscortAdminPermission
from dvadmin.utils.json_response import ErrorResponse, DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet

from ..models import Withdrawal, EscortUser
from .wxpay import wxpay_transfer, wxpay_query_transfer, wxpay_cancel_transfer


class WithdrawalSerializer(CustomModelSerializer):
    """提现申请序列化器"""
    user_nickname = serializers.CharField(source='user.nickname', read_only=True, label='用户昵称')
    user_phone = serializers.CharField(source='user.phone', read_only=True, label='用户手机号')
    user_balance = serializers.DecimalField(source='user.balance', read_only=True, max_digits=10, decimal_places=2, label='用户余额')

    class Meta:
        model = Withdrawal
        read_only_fields = ["id"]
        fields = ['id', 'user', 'user_nickname', 'user_phone', 'user_balance',
                   'amount', 'tax_amount', 'actual_amount', 'status',
                   'payment_no', 'payment_time', 'review_notes', 'review_time',
                   'create_datetime', 'update_datetime', 'creator', 'modifier']
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
        status = self.request.query_params.get('status', None)
        if status is not None:
            queryset = queryset.filter(status=status)
        return queryset

    @action(methods=['POST'], detail=False, permission_classes=[EscortUserPermission])
    def apply(self, request):
        """用户提交提现申请（含余额校验 + 并发锁）"""
        amount = request.data.get('amount')
        if amount is None:
            return ErrorResponse(msg='请填写提现金额')
        try:
            amount = Decimal(str(amount))
        except Exception:
            return ErrorResponse(msg='提现金额格式错误')
        if amount < Decimal('0.1'):
            return ErrorResponse(msg='提现金额最低 ¥0.1')
        if amount > Decimal('5000'):
            return ErrorResponse(msg='单笔提现最高 ¥5000')

        user = request.user

        # 加行锁，防止并发申请导致余额超支
        with transaction.atomic():
            locked_user = EscortUser.objects.select_for_update().get(pk=user.pk)
            if amount > locked_user.balance:
                return ErrorResponse(msg='提现金额不能超过可提现余额（¥' + str(locked_user.balance) + '）')

            Withdrawal.objects.create(
                user=user,
                amount=amount,
                tax_amount=Decimal('0'),
                actual_amount=amount,
                status=Withdrawal.STATUS_PENDING,
            )
        return SuccessResponse(msg='提现申请已提交')

    @action(methods=['POST'], detail=False, permission_classes=[EscortUserPermission])
    def authorize_wx(self, request):
        """
        小程序端：发起微信转账申请，获取 package_info
        https://pay.weixin.qq.com/doc/v3/merchant/4012716434

        流程：
        1. 后端调用「发起转账」接口，获取 package_info
        2. 返回 package_info，前端用 wx.requestMerchantTransfer 拉起微信确认收款页
        3. 用户确认收款后，微信回调通知后端
        """
        user = request.user
        if not user.openid:
            return ErrorResponse(msg='用户未绑定微信 openid')

        # 获取提现金额（从前端传入）
        amount = request.data.get('amount')
        if not amount:
            return ErrorResponse(msg='请传入提现金额')
        
        try:
            amount = int(float(amount))
        except Exception:
            return ErrorResponse(msg='提现金额格式错误')

        if amount < 10:  # 最低 0.1 元 = 10 分
            return ErrorResponse(msg='提现金额最低 ¥0.1')

        # 生成商户单号
        out_bill_no = f"TX{int(time.time() * 1000)}{user.id}"

        # 调用微信转账接口
        wx_result = wxpay_transfer(
            out_bill_no=out_bill_no,
            openid=user.openid,
            amount=amount,
            desc='余额提现',
        )

        if wx_result.get('code') == 'SUCCESS':
            state = wx_result.get('state')
            if state == 'WAIT_USER_CONFIRM':
                # 需要用户确认
                return SuccessResponse(msg='请在微信中确认收款', data={
                    'out_bill_no': out_bill_no,
                    'state': state,
                    'package_info': wx_result.get('package_info'),
                    'transfer_bill_no': wx_result.get('transfer_bill_no'),
                })
            elif state == 'SUCCESS':
                # 直接成功（免确认模式）
                return SuccessResponse(msg='提现成功', data={
                    'out_bill_no': out_bill_no,
                    'state': state,
                })
            else:
                return ErrorResponse(msg=f'未知状态：{state}')
        else:
            return ErrorResponse(
                msg=f'提现请求失败：{wx_result.get("error_message", "未知错误")}',
                data={'error_code': wx_result.get('error_code')}
            )

    @action(methods=['POST'], detail=False, permission_classes=[EscortUserPermission])
    def confirm_authorization(self, request):
        """
        小程序端：用户授权完成后，回调此接口确认授权状态
        前端在 navigateToMiniProgram 的 fail/success 回调中调用此接口
        如果成功，标记用户已授权
        """
        user = request.user
        authorization_id = request.data.get('authorization_id', '')

        # TODO: 可以通过微信接口验证授权是否真的成功
        # 目前简单处理：前端说成功就算成功
        success = request.data.get('success', False)

        if success:
            EscortUser.objects.filter(pk=user.pk).update(wx_auth_authorized=True)
            return SuccessResponse(msg='授权成功', data={'authorized': True})
        else:
            return SuccessResponse(msg='授权未完成，可稍后重试', data={'authorized': False})

    @action(methods=['GET'], detail=False, permission_classes=[EscortUserPermission])
    def check_authorization(self, request):
        """查询当前用户是否已授权微信免确认收款"""
        user = request.user
        return SuccessResponse(data={
            'authorized': user.wx_auth_authorized,
        })

    @action(methods=['POST'], detail=True, permission_classes=[EscortAdminPermission])
    def approve(self, request, *args, **kwargs):
        """批准提现申请"""
        instance = self.get_object()

        if instance.status != Withdrawal.STATUS_PENDING:
            return ErrorResponse(msg='只能处理申请中的提现')

        with transaction.atomic():
            locked_user = EscortUser.objects.select_for_update().get(pk=instance.user_id)
            if locked_user.balance < instance.amount:
                return ErrorResponse(msg='用户余额不足')

            instance.status = Withdrawal.STATUS_PROCESSING
            instance.review_notes = request.data.get('review_notes', '')
            instance.review_time = timezone.now()
            instance.save()

        return SuccessResponse(msg='提现申请已批准，进入处理中状态')

    @action(methods=['POST'], detail=True, permission_classes=[EscortAdminPermission])
    def complete(self, request, *args, **kwargs):
        """
        完成提现（查询微信转账状态）
        状态机：processing -> success / failed
        """
        instance = self.get_object()

        if instance.status != Withdrawal.STATUS_PROCESSING:
            return ErrorResponse(msg='只能处理处理中的提现')

        if not instance.payment_no:
            return ErrorResponse(msg='该提现没有微信单号，无法查询状态')

        # 查询微信转账状态
        wx_result = wxpay_query_transfer(instance.payment_no)

        if wx_result.get('code') == 'SUCCESS':
            state = wx_result.get('state')
            if state == 'SUCCESS':
                instance.status = Withdrawal.STATUS_SUCCESS
                instance.save(update_fields=['status'])
                return SuccessResponse(msg='提现已成功')
            elif state == 'FAIL':
                instance.status = Withdrawal.STATUS_FAILED
                instance.review_notes = wx_result.get('fail_reason', '转账失败')
                instance.save(update_fields=['status', 'review_notes'])
                return ErrorResponse(msg=f'提现失败：{wx_result.get("fail_reason", "未知原因")}')
            elif state == 'WAIT_USER_CONFIRM':
                return SuccessResponse(msg='等待用户确认收款中', data={'state': state})
            else:
                return SuccessResponse(msg=f'当前状态：{state}', data={'state': state})
        else:
            return ErrorResponse(msg=f'查询失败：{wx_result.get("error_message", "未知错误")}')

    @action(methods=['POST'], detail=True, permission_classes=[EscortAdminPermission])
    def reject(self, request, *args, **kwargs):
        """拒绝提现申请"""
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

    @action(methods=['POST'], detail=False, permission_classes=[])
    def wx_notify(self, request, *args, **kwargs):
        """
        微信商家转账到零钱 V3 回调通知
        https://pay.weixin.qq.com/doc/v3/merchant/4012712115
        """
        import logging
        logger = logging.getLogger('django.request')
        
        try:
            body = json.loads(request.body)
        except Exception:
            body = {}
        
        logger.warning(f"[WXPAY] Callback received: {body}")
        
        out_bill_no = body.get('out_bill_no', '')
        state = body.get('state', '')
        
        if not out_bill_no:
            return Response({'code': 'FAIL', 'message': '缺少 out_bill_no'}, status=400)

        try:
            instance = Withdrawal.objects.select_related('user').get(payment_no=out_bill_no)
        except Withdrawal.DoesNotExist:
            return Response({'code': 'FAIL', 'message': '订单不存在'}, status=404)

        # 幂等：已成功不再处理
        if instance.status == Withdrawal.STATUS_SUCCESS:
            return Response({'code': 'SUCCESS', 'message': '已处理'})

        # 处理结果
        transfer_status = decrypted.get('transfer_batch', {}).get('status', '')
        if transfer_status == 'SUCCESS':
            with transaction.atomic():
                EscortUser.objects.filter(pk=instance.user_id).update(
                    balance=F('balance') - instance.amount,
                    total_withdrawal=F('total_withdrawal') + instance.amount,
                )
                instance.refresh_from_db()
                instance.status = Withdrawal.STATUS_SUCCESS
                instance.payment_time = timezone.now()
                instance.save()
            return Response({'code': 'SUCCESS', 'message': 'OK'})
        elif transfer_status == 'FAIL':
            fail_reason = decrypted.get('transfer_detail_list', [{}])[0].get('fail_reason', '转账失败')
            instance.status = Withdrawal.STATUS_FAILED
            instance.review_notes = f'微信转账失败：{fail_reason}'
            instance.review_time = timezone.now()
            instance.save()
            return Response({'code': 'SUCCESS', 'message': '已记录失败'})
        else:
            return Response({'code': 'SUCCESS', 'message': '已收到通知'})
