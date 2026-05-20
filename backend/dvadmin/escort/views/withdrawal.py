# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact: 
@Created on: 2026/4/2
@Remark: 提现申请视图
"""
from decimal import Decimal
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
from .wxpay import wxpay_authorize_and_transfer, verify_wx_notify, _request_wx_authorization


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
        小程序端：引导用户完成微信免确认收款授权
        https://pay.weixin.qq.com/doc/v3/merchant/4012716434

        流程：
        1. 后端调用「发起免确认收款授权」接口，获取 package_info
        2. 返回 package_info，前端用 wx.navigateToMiniProgram 拉起微信授权页
        3. 用户授权后，前端回调通知后端，后端标记 wx_auth_authorized=True
        """
        user = request.user
        if not user.openid:
            return ErrorResponse(msg='用户未绑定微信 openid')

        # 调用微信授权接口获取 package_info
        auth_result = _request_wx_authorization(user.openid)

        if auth_result.get('code') == 'FAIL':
            return ErrorResponse(
                msg=f'授权请求失败：{auth_result.get("error_message", "未知错误")}',
                data={'error_code': auth_result.get('error_code')}
            )

        package_info = auth_result.get('package_info', '')
        authorization_id = auth_result.get('authorization_id', '')

        return SuccessResponse(msg='请在微信中完成授权', data={
            'authorization_id': authorization_id,
            'package_info': package_info,
        })

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
        完成提现（真实微信企业付款）
        状态机：processing -> success / failed
        只有微信 API 返回 SUCCESS 才更新数据库，否则保持 processing 状态
        """
        instance = self.get_object()

        if instance.status != Withdrawal.STATUS_PROCESSING:
            return ErrorResponse(msg='只能处理处理中的提现')

        if not instance.user.openid:
            return ErrorResponse(msg='该用户没有 openid，无法发起微信付款')

        # 先生成批次单号，但暂不写入数据库（等 API 成功后再落库）
        out_batch_no = f"WIT{int(time.time() * 1000)}{instance.id}"

        # 调用微信商家转账到零钱 V3 接口（免确认模式，金额单位：分）
        try:
            wx_result = wxpay_authorize_and_transfer(
                out_bill_no=out_batch_no,
                openid=instance.user.openid,
                amount=int(float(instance.amount) * 100),
                desc='陪玩平台提现',
            )
        except Exception as e:
            return ErrorResponse(msg=f'提现请求异常：{str(e)}')

        if wx_result.get('code') == 'SUCCESS':
            # 微信直接打款成功（免确认模式，钱已到账）
            instance.payment_no = wx_result.get('transfer_bill_no', out_batch_no)
            instance.status = Withdrawal.STATUS_SUCCESS
            instance.save(update_fields=['payment_no', 'status'])
            return SuccessResponse(msg='提现成功，微信已打款到用户零钱')

        elif wx_result.get('code') == 'NEED_AUTH':
            # 用户尚未授权，引导用户先去授权
            instance.review_notes = '用户尚未授权微信免确认收款'
            instance.review_time = timezone.now()
            instance.save(update_fields=['review_notes', 'review_time'])
            return ErrorResponse(
                msg='用户尚未授权微信免确认收款，请引导用户先完成授权',
                data={'need_auth': True}
            )

        else:
            err_code = wx_result.get('error_code', 'UNKNOWN')
            err_msg = wx_result.get('error_message', '微信付款失败')
            instance.review_notes = f'微信付款失败 [{err_code}] {err_msg}'
            instance.review_time = timezone.now()
            instance.save(update_fields=['review_notes', 'review_time'])
            return ErrorResponse(msg=f'提现失败：{err_msg}')

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
        微信处理完成后会 POST 本接口通知结果（JSON + AES 加密）
        """
        try:
            ok, decrypted = verify_wx_notify(request)
        except Exception:
            return Response({'code': 'FAIL', 'message': '解析失败'}, status=400)

        if not ok:
            return Response({'code': 'FAIL', 'message': '签名验证失败'}, status=403)

        # out_batch_no 对应存入 payment_no 的值
        out_batch_no = decrypted.get('out_batch_no', '')
        if not out_batch_no:
            return Response({'code': 'FAIL', 'message': '缺少 out_batch_no'}, status=400)

        try:
            instance = Withdrawal.objects.select_related('user').get(payment_no=out_batch_no)
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
