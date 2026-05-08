# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact: 
@Created on: 2026/4/2
@Remark: 订单评价视图
"""
from rest_framework import serializers
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticated
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
from dvadmin.utils.json_response import ErrorResponse, DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet
from ..models import OrderReview, Order, EscortUser


class OrderReviewSerializer(CustomModelSerializer):
    """订单评价序列化器"""
    order_no = serializers.CharField(source='order.order_no', read_only=True, label='订单编号')
    order_status = serializers.IntegerField(source='order.status', read_only=True, label='订单状态')
    order_total_amount = serializers.DecimalField(source='order.total_amount', read_only=True, max_digits=10, decimal_places=2, label='订单金额')

    customer_nickname = serializers.CharField(source='customer.nickname', read_only=True, label='评价人昵称')
    customer_avatar = serializers.CharField(source='customer.avatar_url', read_only=True, label='评价人头像')

    order_hunters = serializers.SerializerMethodField(label='接单打手')

    class Meta:
        model = OrderReview
        read_only_fields = ["id"]
        fields = ['id', 'order', 'order_no', 'order_status', 'order_total_amount', 'customer', 'customer_nickname', 'customer_avatar', 'rating', 'content', 'is_anonymous', 'reply_content', 'reply_time', 'create_datetime', 'update_datetime', 'creator', 'modifier']
        extra_kwargs = {
            "create_datetime": {"required": False},
            "update_datetime": {"required": False},
            "reply_time": {"required": False},
        }
    
    def get_order_hunters(self, obj):
        """获取订单的打手信息"""
        hunters = obj.order.hunters.all()
        hunter_list = []
        for hunter in hunters:
            hunter_list.append({
                'id': hunter.hunter.id,
                'nickname': hunter.hunter.nickname,
                'avatar': hunter.hunter.avatar_url,
                'is_primary': hunter.is_primary,
                'share_amount': hunter.share_amount
            })
        return hunter_list


class OrderReviewViewSet(CustomModelViewSet):
    permission_classes = []  # 禁用所有权限类，由 action 单独控制
    extra_filter_class = []  # 禁用数据级权限过滤，EscortUser 没有 manage_dept 等字段
    """
    订单评价管理
    """

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]

    queryset = OrderReview.objects.all().select_related('order', 'customer')
    serializer_class = OrderReviewSerializer
    filter_fields = ['order', 'customer', 'rating']
    search_fields = ['order__order_no', 'customer__nickname', 'content']
    permission_classes = []
    
    def get_queryset(self):
        queryset = super().get_queryset()
        # 根据评分筛选
        min_rating = self.request.query_params.get('min_rating', None)
        max_rating = self.request.query_params.get('max_rating', None)
        
        if min_rating is not None:
            queryset = queryset.filter(rating__gte=min_rating)
        if max_rating is not None:
            queryset = queryset.filter(rating__lte=max_rating)
        
        # 是否已回复
        has_reply = self.request.query_params.get('has_reply', None)
        if has_reply is not None:
            if has_reply.lower() == 'true':
                queryset = queryset.exclude(reply_content__isnull=True).exclude(reply_content='')
            else:
                queryset = queryset.filter(reply_content__isnull=True) | queryset.filter(reply_content='')
        
        return queryset
    
    @action(methods=['POST'], detail=True)
    def reply(self, request, *args, **kwargs):
        """回复评价"""
        instance = self.get_object()
        
        reply_content = request.data.get('reply_content', '')
        if not reply_content:
            return Response({'msg': '请填写回复内容', 'code': 400}, status=400)
        
        from django.utils import timezone
        
        instance.reply_content = reply_content
        instance.reply_time = timezone.now()
        instance.save()
        
        return Response({'msg': '回复成功', 'code': 200})
    
    @action(methods=['POST'], detail=True)
    def delete_reply(self, request, *args, **kwargs):
        """删除回复"""
        instance = self.get_object()
        
        instance.reply_content = ''
        instance.reply_time = None
        instance.save()
        
        return Response({'msg': '回复已删除', 'code': 200})
    
    @action(methods=['GET'], detail=False)
    def stats(self, request):
        """评价统计"""
        from django.db.models import Avg, Count
        
        # 总体统计
        total_reviews = OrderReview.objects.count()
        avg_rating = OrderReview.objects.aggregate(avg=Avg('rating'))['avg'] or 0
        replied_count = OrderReview.objects.exclude(reply_content__isnull=True).exclude(reply_content='').count()
        
        # 评分分布
        rating_distribution = OrderReview.objects.values('rating').annotate(
            count=Count('id')
        ).order_by('rating')
        
        # 最近评价
        recent_reviews = OrderReview.objects.select_related('order', 'customer').order_by('-create_datetime')[:10]
        recent_data = OrderReviewSerializer(recent_reviews, many=True).data
        
        return Response({
            'total_reviews': total_reviews,
            'avg_rating': round(avg_rating, 2),
            'replied_count': replied_count,
            'reply_rate': round(replied_count / total_reviews * 100, 2) if total_reviews > 0 else 0,
            'rating_distribution': list(rating_distribution),
            'recent_reviews': recent_data,
            'code': 200
        })
    
    @action(methods=['GET'], detail=False)
    def hunter_reviews(self, request):
        """获取打手的评价"""
        hunter_id = request.query_params.get('hunter_id')
        if not hunter_id:
            return Response({'msg': '请提供hunter_id参数', 'code': 400}, status=400)
        
        try:
            hunter = EscortUser.objects.get(id=hunter_id)
        except EscortUser.DoesNotExist:
            return Response({'msg': '打手不存在', 'code': 404}, status=404)
        
        # 获取该打手参与的所有订单的评价
        orders = Order.objects.filter(hunters__hunter=hunter)
        reviews = OrderReview.objects.filter(order__in=orders).select_related('order', 'customer')
        
        # 统计
        total = reviews.count()
        avg_rating = reviews.aggregate(avg=Avg('rating'))['avg'] or 0
        
        # 评分分布
        rating_dist = reviews.values('rating').annotate(count=Count('id')).order_by('rating')
        
        return Response({
            'hunter_id': hunter.id,
            'hunter_nickname': hunter.nickname,
            'total_reviews': total,
            'avg_rating': round(avg_rating, 2),
            'rating_distribution': list(rating_dist),
            'reviews': OrderReviewSerializer(reviews, many=True).data,
            'code': 200
        })