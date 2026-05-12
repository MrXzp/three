# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact:
@Created on: 2026/5/8
@Remark: 订单聊天消息API
"""
from rest_framework import serializers
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework_simplejwt.authentication import JWTAuthentication
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
from dvadmin.utils.json_response import DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet
from ..models import ChatMessage, Order, OrderHunter, EscortUser


class ChatMessageSerializer(CustomModelSerializer):
    """聊天消息序列化器"""
    sender_nickname = serializers.CharField(source='sender.nickname', read_only=True)
    sender_avatar = serializers.URLField(source='sender.avatar_url', read_only=True)

    class Meta:
        model = ChatMessage
        fields = [
            'id', 'order', 'sender', 'sender_type', 'sender_nickname',
            'sender_avatar', 'message_type', 'content', 'image_url',
            'create_datetime',
        ]
        read_only_fields = ['id', 'create_datetime']


class ChatMessageViewSet(CustomModelViewSet):
    """
    订单聊天消息接口
    list:   GET  /api/order/{order_id}/messages/          拉取消息列表（游标分页）
    send:   POST /api/order/{order_id}/messages/send/     发送消息
    read:   POST /api/order/{order_id}/messages/read/     标记已读
    """
    serializer_class = ChatMessageSerializer
    authentication_classes = [EscortUserAuthentication]
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return ChatMessage.objects.filter(
            order_id=self.kwargs['order_id']
        ).order_by('create_datetime')

    def list(self, request, order_id=None):
        """
        拉取消息列表
        Query params:
          - after_id: int  只返回 id > after_id 的新消息（游标轮询）
          - limit:    int  最多返回多少条，默认 50
        """
        after_id = request.query_params.get('after_id')
        limit = int(request.query_params.get('limit', 50))

        qs = self.get_queryset()
        if after_id:
            qs = qs.filter(id__gt=int(after_id))

        # 最多取 limit 条
        messages = list(qs.order_by('create_datetime')[:limit])

        # 补充未读数（当前用户收到但未读的对方消息数）
        user = request.user
        unread = 0
        if messages:
            max_id = max(m.id for m in messages)
            sender_type = 'customer' if _is_customer(user, order_id) else 'hunter'
            unread = ChatMessage.objects.filter(
                order_id=order_id,
                sender_type__in=[('hunter' if sender_type == 'customer' else 'customer')],
            ).exclude(sender=user).count()

        serializer = self.get_serializer(messages, many=True)
        return DetailResponse(data={
            'messages': serializer.data,
            'unread': unread,
        })

    @action(detail=False, methods=['post'])
    def send(self, request, order_id=None):
        """
        发送消息
        Body: { "content": "消息内容", "message_type": 1 }
        """
        content = request.data.get('content', '').strip()
        message_type = int(request.data.get('message_type', 1))

        if not content and message_type != 3:
            return DetailResponse(code=400, msg='消息内容不能为空', status=400)

        # 权限校验：只有订单的客户或打手可以发消息
        try:
            order = Order.objects.get(id=order_id)
        except Order.DoesNotExist:
            return DetailResponse(code=404, msg='订单不存在', status=404)

        user = request.user
        sender_type = _get_sender_type(user, order)
        if not sender_type:
            return DetailResponse(code=403, msg='您不是此订单的参与者', status=403)

        msg = ChatMessage(
            order_id=order_id,
            sender=user,
            sender_type=sender_type,
            message_type=message_type,
            content=content,
            description='',
            modifier='',
            dept_belong_id='',
        )
        msg.save(force_insert=True)
        serializer = self.get_serializer(msg)
        return DetailResponse(data=serializer.data, msg='发送成功')

    @action(detail=False, methods=['post'])
    def read(self, request, order_id=None):
        """标记消息已读（暂不需要，轮询拉取即可）"""
        return SuccessResponse(msg='ok')


def _get_sender_type(user, order):
    """判断当前用户是客户还是打手"""
    if order.customer_id == user.id:
        return 'customer'
    if order.hunters.filter(hunter_id=user.id).exists():
        return 'hunter'
    return None


def _is_customer(user, order_id):
    try:
        order = Order.objects.get(id=order_id)
        return order.customer_id == user.id
    except Order.DoesNotExist:
        return False


class WebAdminChatMessageViewSet(APIView):
    """
    Web 后台管理员查看订单聊天记录
    独立于 App 端接口，支持 Admin JWT 认证，直接返回消息列表（不分页）
    """
    authentication_classes = [JWTAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request, order_id):
        """GET /web/order/{order_id}/messages/"""
        try:
            Order.objects.get(id=order_id)
        except Order.DoesNotExist:
            return DetailResponse(code=404, msg='订单不存在', status=404)

        messages = ChatMessage.objects.filter(
            order_id=order_id
        ).select_related('sender').order_by('create_datetime')

        data = [
            {
                'id': m.id,
                'sender': m.sender_id,
                'sender_type': m.sender_type,
                'sender_nickname': m.sender.nickname if m.sender else '',
                'sender_avatar': m.sender.avatar_url if m.sender else '',
                'message_type': m.message_type,
                'content': m.content,
                'image_url': m.image_url or '',
                'create_datetime': m.create_datetime.strftime('%Y-%m-%dT%H:%M:%S') if m.create_datetime else '',
            }
            for m in messages
        ]
        return DetailResponse(data={'messages': data, 'total': len(data)})

    def post(self, request, order_id):
        """POST /web/order/{order_id}/messages/  管理员代发消息"""
        content = request.data.get('content', '').strip()
        if not content:
            return DetailResponse(code=400, msg='消息内容不能为空', status=400)

        try:
            order = Order.objects.get(id=order_id)
        except Order.DoesNotExist:
            return DetailResponse(code=404, msg='订单不存在', status=404)

        from ..models import EscortUser
        system_user = EscortUser.objects.filter(openid='SYSTEM_PLATFORM_ADMIN').first()
        if not system_user:
            return DetailResponse(code=500, msg='系统账号未初始化，请联系管理员', status=500)

        # 绕过 CoreModelManager.create() 的 request 注入逻辑，直接 save
        msg = ChatMessage(
            order_id=order_id,
            sender=system_user,
            sender_type='system',
            message_type=1,
            content=content,
            description='',
            modifier='',
            dept_belong_id='',
        )
        msg.save(force_insert=True)
        return DetailResponse(data={
            'id': msg.id,
            'sender_type': msg.sender_type,
            'content': msg.content,
            'create_datetime': msg.create_datetime.strftime('%Y-%m-%dT%H:%M:%S'),
        }, msg='发送成功')

