# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact:
@Created on: 2026/5/12
@Remark: 退款申请管理API
"""
import hashlib
import random
import string
import time
import urllib.parse
import xml.etree.ElementTree as ET
from decimal import Decimal

from django.conf import settings
from django.utils import timezone
from rest_framework import serializers, status
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
from dvadmin.utils.json_response import ErrorResponse, DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet
from ..models import RefundRequest, Order


def _random_str(length=32):
    """生成随机字符串（数字+字母）"""
    chars = string.ascii_letters + string.digits
    return ''.join(random.choices(chars, k=length))


def _build_sign(params: dict, sign_type='MD5') -> str:
    """
    微信支付签名（APIv2 MD5）
    """
    sorted_keys = sorted(params.keys())
    pairs = []
    for k in sorted_keys:
        v = params[k]
        if v is None or v == '':
            continue
        if isinstance(v, (list, dict)):
            continue
        pairs.append(f"{k}={v}")
    sign_str = '&'.join(pairs)
    sign_str += f"&key={settings.WECHAT_API_KEY}"
    return hashlib.md5(sign_str.encode('utf-8')).hexdigest().upper()


def _dict_to_xml(params: dict) -> str:
    """字典转 XML"""
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


class RefundRequestSerializer(CustomModelSerializer):
    """退款申请序列化器"""
    order_no = serializers.CharField(source='order.order_no', read_only=True, label='订单编号')
    customer_nickname = serializers.CharField(source='customer.nickname', read_only=True, label='客户昵称')
    customer_phone = serializers.CharField(source='customer.phone', read_only=True, label='客户电话')
    total_amount = serializers.DecimalField(source='order.total_amount', read_only=True, max_digits=10, decimal_places=2, label='订单金额')
    service_name = serializers.CharField(source='order.service.name', read_only=True, label='服务项目')
    status_display = serializers.CharField(source='get_status_display', read_only=True, label='状态名称')
    reason_type_display = serializers.CharField(source='get_reason_type_display', read_only=True, label='原因类型名称')

    class Meta:
        model = RefundRequest
        read_only_fields = ["id"]
        fields = [
            'id', 'order', 'order_no', 'customer', 'customer_nickname', 'customer_phone',
            'total_amount', 'service_name', 'refund_amount', 'actual_refund_amount',
            'reason_type', 'reason_type_display', 'reason_detail',
            'status', 'status_display',
            'refund_no', 'refund_time',
            'reviewer_id', 'reviewer_name', 'review_notes', 'review_time',
            'create_datetime', 'update_datetime'
        ]


class RefundRequestViewSet(CustomModelViewSet):
    """退款申请管理接口"""
    permission_classes = []
    extra_filter_class = []

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]

    queryset = RefundRequest.objects.all().select_related('order', 'customer')
    serializer_class = RefundRequestSerializer
    filter_fields = ['status', 'customer', 'order']
    search_fields = ['order__order_no', 'customer__nickname', 'customer__phone']

    def get_queryset(self):
        queryset = super().get_queryset()
        status_filter = self.request.query_params.get('status', None)
        if status_filter is not None:
            queryset = queryset.filter(status=int(status_filter))
        return queryset

    @action(methods=['GET'], detail=False, permission_classes=[IsAuthenticated])
    def list_pending(self, request, *args, **kwargs):
        """获取待处理的退款申请列表"""
        queryset = self.get_queryset().filter(status__in=[
            RefundRequest.STATUS_PENDING,
            RefundRequest.STATUS_APPROVED,
            RefundRequest.STATUS_REFUNDING
        ])
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        serializer = self.get_serializer(queryset, many=True)
        return SuccessResponse(data=serializer.data)

    @action(methods=['POST'], detail=True, permission_classes=[IsAuthenticated])
    def approve(self, request, *args, **kwargs):
        """批准退款申请"""
        instance = self.get_object()

        if instance.status != RefundRequest.STATUS_PENDING:
            return ErrorResponse(msg='只能处理待审核的退款申请')

        review_notes = request.data.get('review_notes', '')
        # 实际退款金额（可选，默认等于申请金额）
        actual_amount = request.data.get('actual_refund_amount')
        if actual_amount is not None:
            try:
                actual_amount = Decimal(str(actual_amount))
                if actual_amount > instance.refund_amount:
                    return ErrorResponse(msg='实际退款金额不能超过申请金额')
            except Exception:
                return ErrorResponse(msg='退款金额格式错误')
        else:
            actual_amount = instance.refund_amount

        instance.status = RefundRequest.STATUS_APPROVED
        instance.actual_refund_amount = actual_amount
        instance.review_notes = review_notes
        instance.review_time = timezone.now()
        # 记录审核人信息
        instance.reviewer_id = request.user.id
        instance.reviewer_name = getattr(request.user, 'name', None) or getattr(request.user, 'username', str(request.user.id))
        instance.save()

        # 更新订单状态为退款中
        instance.order.status = Order.STATUS_REFUNDING
        instance.order.save(update_fields=['status', 'update_datetime'])

        return SuccessResponse(msg='退款申请已批准，请执行退款操作')

    @action(methods=['POST'], detail=True, permission_classes=[IsAuthenticated])
    def reject(self, request, *args, **kwargs):
        """拒绝退款申请"""
        instance = self.get_object()

        if instance.status != RefundRequest.STATUS_PENDING:
            return ErrorResponse(msg='只能拒绝待审核的退款申请')

        review_notes = request.data.get('review_notes', '')
        if not review_notes:
            return ErrorResponse(msg='请填写拒绝原因')

        instance.status = RefundRequest.STATUS_REJECTED
        instance.review_notes = review_notes
        instance.review_time = timezone.now()
        instance.reviewer_id = request.user.id
        instance.reviewer_name = getattr(request.user, 'name', None) or getattr(request.user, 'username', str(request.user.id))
        instance.save()

        return SuccessResponse(msg='退款申请已拒绝')

    @action(methods=['POST'], detail=True, permission_classes=[IsAuthenticated])
    def execute_refund(self, request, *args, **kwargs):
        """
        执行微信退款
        """
        instance = self.get_object()

        if instance.status not in [RefundRequest.STATUS_APPROVED, RefundRequest.STATUS_REFUNDING]:
            return ErrorResponse(msg='只能对已批准的退款申请执行退款')

        order = instance.order

        if not order.out_trade_no:
            return ErrorResponse(msg='订单没有微信支付单号，无法退款')

        # 退款金额（以分为单位）
        refund_fee = int(float(instance.actual_refund_amount) * 100)
        total_fee = int(float(order.total_amount) * 100)

        if refund_fee > total_fee:
            return ErrorResponse(msg='退款金额不能超过订单支付金额')

        # 生成退款单号
        refund_no = f"REF{order.order_no}{int(time.time() * 1000)}"

        # 构造微信退款参数
        nonce_str = _random_str(32)
        params = {
            'appid': settings.WECHAT_MINI_APPID,
            'mch_id': settings.WECHAT_MCHID,
            'nonce_str': nonce_str,
            'transaction_id': order.out_trade_no,  # 微信订单号
            'out_refund_no': refund_no,            # 商户退款单号
            'total_fee': total_fee,                 # 订单总金额（分）
            'refund_fee': refund_fee,               # 退款金额（分）
            'refund_desc': f'订单{order.order_no}退款',  # 退款原因
        }
        params['sign'] = _build_sign(params)

        # 调用微信退款接口（使用SSL证书）
        wx_url = "https://api.mch.weixin.qq.com/secapi/pay/refund"
        try:
            import urllib.request
            import ssl

            xml_data = _dict_to_xml(params)

            # 检查证书文件是否存在
            cert_file = settings.WECHAT_SSL_CERT_FILE
            key_file = settings.WECHAT_SSL_KEY_FILE

            import os
            if not os.path.exists(cert_file) or not os.path.exists(key_file):
                logger.warning(f"[REFUND] 证书文件不存在，使用模拟模式: cert={cert_file}, key={key_file}")
                # 模拟退款成功
                instance.status = RefundRequest.STATUS_COMPLETED
                instance.refund_no = refund_no
                instance.refund_time = timezone.now()
                instance.save()
                order.status = Order.STATUS_REFUNDED
                order.save(update_fields=['status', 'update_datetime'])
                return SuccessResponse(msg='退款成功（模拟-证书未配置）', data={
                    'refund_no': refund_no,
                    'refund_amount': float(refund_fee) / 100,
                })

            # 创建SSL上下文，加载证书
            ssl_context = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
            ssl_context.load_cert_chain(certfile=cert_file, keyfile=key_file)

            # 创建请求
            req = urllib.request.Request(
                wx_url,
                data=xml_data.encode('utf-8'),
                headers={'Content-Type': 'application/xml'}
            )

            # 使用证书发起请求
            opener = urllib.request.HTTPSHandler(context=ssl_context)
            with opener.open(req, timeout=30) as resp:
                result_xml = resp.read().decode('utf-8')

            logger.info(f"[REFUND] 微信退款返回: {result_xml}")

            result = _xml_to_dict(result_xml)

            # 解析退款结果
            if result.get('return_code') == 'SUCCESS':
                if result.get('result_code') == 'SUCCESS':
                    # 退款成功
                    instance.status = RefundRequest.STATUS_COMPLETED
                    instance.refund_no = refund_no
                    instance.refund_time = timezone.now()
                    instance.save()

                    order.status = Order.STATUS_REFUNDED
                    order.save(update_fields=['status', 'update_datetime'])

                    return SuccessResponse(msg='退款成功', data={
                        'refund_no': refund_no,
                        'refund_amount': float(refund_fee) / 100,
                    })
                else:
                    # 退款失败
                    err_code = result.get('err_code', '')
                    err_code_des = result.get('err_code_des', '')
                    instance.status = RefundRequest.STATUS_FAILED
                    instance.save()
                    return ErrorResponse(msg=f'退款失败: {err_code_des or err_code}')
            else:
                # 通信失败
                return_msg = result.get('return_msg', '')
                instance.status = RefundRequest.STATUS_FAILED
                instance.save()
                return ErrorResponse(msg=f'退款请求失败: {return_msg}')

        except urllib.error.URLError as e:
            logger.error(f"[REFUND] 退款网络错误: {e}")
            instance.status = RefundRequest.STATUS_FAILED
            instance.save()
            return ErrorResponse(msg=f'退款网络错误: {e}')
        except Exception as e:
            import logging
            logger = logging.getLogger('django')
            logger.error(f"[REFUND] 退款执行异常: {e}")

            instance.status = RefundRequest.STATUS_FAILED
            instance.save()

            return ErrorResponse(msg=f'退款执行失败: {e}')

    @action(methods=['GET'], detail=True, permission_classes=[IsAuthenticated])
    def query_refund_status(self, request, *args, **kwargs):
        """查询微信退款状态"""
        instance = self.get_object()

        if not instance.refund_no:
            return ErrorResponse(msg='没有退款单号')

        # 查询微信退款状态（简化实现）
        # 实际应该调用微信退款查询接口

        return SuccessResponse(data={
            'refund_no': instance.refund_no,
            'status': instance.status,
            'status_display': instance.get_status_display(),
            'refund_amount': float(instance.actual_refund_amount),
            'refund_time': instance.refund_time,
        })

    @action(methods=['GET'], detail=False, permission_classes=[IsAuthenticated])
    def statistics(self, request, *args, **kwargs):
        """退款统计"""
        from django.db.models import Count, Sum

        total_count = self.queryset.count()
        total_refund_amount = self.queryset.aggregate(
            total=Sum('actual_refund_amount')
        )['total'] or 0

        # 按状态统计
        status_stats = self.queryset.values('status').annotate(
            count=Count('id'),
            amount=Sum('actual_refund_amount')
        ).order_by('status')

        return SuccessResponse(data={
            'total_count': total_count,
            'total_refund_amount': float(total_refund_amount),
            'status_stats': list(status_stats),
        })

    # ==================== 用户端接口 ====================

    @action(methods=['POST'], detail=False, permission_classes=[IsAuthenticated])
    def apply(self, request, *args, **kwargs):
        """
        用户提交退款申请
        - 仅已支付且未完成的订单可申请退款
        - 仅可申请一次退款
        """
        order_id = request.data.get('order_id')
        reason_type = request.data.get('reason_type', 'user_cancel')
        reason_detail = request.data.get('reason_detail', '')

        if not order_id:
            return ErrorResponse(msg='订单ID不能为空')

        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id

        # 查询订单
        try:
            order = Order.objects.select_related('customer').get(id=order_id)
        except Order.DoesNotExist:
            return ErrorResponse(msg='订单不存在')

        # 验证是否为本人订单
        if order.customer_id != user_id:
            return ErrorResponse(msg='无权操作此订单')

        # 验证订单状态：已支付但未完成（待接单、已接单、服务中、待确认）
        refundable_statuses = [
            Order.STATUS_PENDING_ACCEPT,
            Order.STATUS_ACCEPTED,
            Order.STATUS_WAITING_PARTNER,
            Order.STATUS_IN_SERVICE,
            Order.STATUS_PENDING_CONFIRM,
        ]
        if order.status not in refundable_statuses:
            return ErrorResponse(msg='当前订单状态不允许申请退款')

        # 检查是否已有退款申请
        if RefundRequest.objects.filter(order=order).exists():
            return ErrorResponse(msg='该订单已有退款申请，请勿重复提交')

        # 验证退款原因
        valid_reasons = ['user_cancel', 'service_issue', 'other']
        if reason_type not in valid_reasons:
            return ErrorResponse(msg='无效的退款原因类型')

        # 创建退款申请
        refund_request = RefundRequest.objects.create(
            order=order,
            customer=order.customer,
            refund_amount=order.total_amount,  # 默认申请全额退款
            reason_type=reason_type,
            reason_detail=reason_detail,
            status=RefundRequest.STATUS_PENDING,
        )

        return SuccessResponse(msg='退款申请已提交，请等待审核', data={
            'refund_id': refund_request.id,
            'refund_amount': float(refund_request.refund_amount),
        })

    @action(methods=['GET'], detail=False, permission_classes=[IsAuthenticated])
    def my(self, request, *args, **kwargs):
        """
        用户查询自己的退款记录
        """
        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id
        status_filter = request.query_params.get('status')

        queryset = RefundRequest.objects.filter(customer_id=user_id).select_related('order', 'customer').order_by('-create_datetime')

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

    @action(methods=['GET'], detail=True, permission_classes=[IsAuthenticated])
    def check(self, request, *args, **kwargs):
        """
        用户查询指定订单的退款状态
        """
        instance = self.get_object()
        user_id = request.auth.get('user_id') if hasattr(request, 'auth') and request.auth else request.user.id

        if instance.customer_id != user_id:
            return ErrorResponse(msg='无权查看此退款记录')

        return SuccessResponse(data={
            'id': instance.id,
            'order_no': instance.order.order_no,
            'refund_amount': float(instance.refund_amount),
            'actual_refund_amount': float(instance.actual_refund_amount) if instance.actual_refund_amount else None,
            'reason_type': instance.reason_type,
            'reason_type_display': instance.get_reason_type_display(),
            'reason_detail': instance.reason_detail,
            'status': instance.status,
            'status_display': instance.get_status_display(),
            'review_notes': instance.review_notes,
            'refund_no': instance.refund_no,
            'refund_time': instance.refund_time,
            'create_datetime': instance.create_datetime,
        })
