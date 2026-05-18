# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact: 
@Created on: 2026/4/2
@Remark: 服务管理API
"""
from rest_framework import serializers
from rest_framework.decorators import action
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication, EscortUserPermission, EscortAdminPermission
from dvadmin.utils.json_response import ErrorResponse, DetailResponse, SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet
from ..models import ServiceCategory, Service, ServiceImage


class ServiceCategorySerializer(CustomModelSerializer):
    """服务分类-序列化器"""

    image_url = serializers.SerializerMethodField(read_only=True, label='图片URL')

    class Meta:
        model = ServiceCategory
        read_only_fields = ["id"]
        fields = ['id', 'name', 'description', 'image', 'image_url', 'sort', 'is_active', 'create_datetime', 'update_datetime', 'creator', 'modifier', 'creator_name', 'modifier_name', 'dept_belong_id']

    def get_image_url(self, obj):
        """获取图片的完整URL（image 现在是 CharField，存的是相对路径）"""
        if obj.image:
            request = self.context.get('request')
            if request:
                return request.build_absolute_uri('/' + obj.image)
            return '/' + obj.image
        return None


class ServiceCategoryCreateUpdateSerializer(CustomModelSerializer):
    """服务分类-创建/更新序列化器"""
    # 前端通过文件上传接口存储图片，返回的是 media/xxx 相对路径
    # 前端表单提交时传的是这个相对路径字符串，后端直接存储到 image 字段

    class Meta:
        model = ServiceCategory
        fields = ['name', 'description', 'image', 'sort', 'is_active']


class ServiceCategoryViewSet(CustomModelViewSet):
    permission_classes = []  # 禁用所有权限类，由 action 单独控制
    extra_filter_class = []  # 禁用数据级权限过滤，EscortUser 没有 manage_dept 等字段
    """服务分类管理接口"""

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]

    queryset = ServiceCategory.objects.all().order_by('sort', '-create_datetime')
    serializer_class = ServiceCategorySerializer
    create_serializer_class = ServiceCategoryCreateUpdateSerializer
    update_serializer_class = ServiceCategoryCreateUpdateSerializer
    filter_fields = ['is_active', ]
    search_fields = ['name', 'description']
    
    def get_serializer_context(self):
        """添加上下文，用于构建完整的图片URL"""
        context = super().get_serializer_context()
        context['request'] = self.request
        return context


class ServiceSerializer(CustomModelSerializer):
    """服务项目-序列化器"""

    category_name = serializers.CharField(source='category.name', read_only=True)
    service_type_display = serializers.CharField(source='get_service_type_display', read_only=True)
    images = serializers.SerializerMethodField(read_only=True, label='商品图片')

    class Meta:
        model = Service
        read_only_fields = ["id"]
        fields = ['id', 'category', 'category_name', 'name', 'description', 'price', 'service_type', 'service_type_display', 'required_hunters', 'duration', 'game_name', 'game_server', 'game_mode', 'is_active', 'sort', 'images', 'create_datetime', 'update_datetime', 'creator', 'modifier', 'creator_name', 'modifier_name', 'dept_belong_id']

    def get_images(self, obj):
        images = obj.images.all().order_by('sort', 'create_datetime')
        return [{'id': img.id, 'image': img.image, 'sort': img.sort} for img in images]


class ServiceCreateUpdateSerializer(CustomModelSerializer):
    """服务项目-创建/更新序列化器"""
    # game_name、game_server 等字段从前端表单移除，这里也从 fields 中排除
    # 前端通过 category（所属游戏）来选择分类，游戏名称可从 category.name 推断

    class Meta:
        model = Service
        fields = ['id', 'category', 'name', 'description', 'price', 'service_type', 'required_hunters', 'duration', 'is_active', 'sort']


class ServiceImageSerializer(CustomModelSerializer):
    """商品图片序列化器"""

    image_url = serializers.SerializerMethodField(read_only=True, label='图片完整URL')

    class Meta:
        model = ServiceImage
        read_only_fields = ["id"]
        fields = ['id', 'service', 'image', 'image_url', 'sort', 'create_datetime', 'update_datetime', 'creator', 'modifier']

    def get_image_url(self, obj):
        if obj.image:
            request = self.context.get('request')
            if request:
                return request.build_absolute_uri('/' + obj.image)
            return '/' + obj.image
        return None


class ServiceImageViewSet(CustomModelViewSet):
    """商品图片管理接口"""
    extra_filter_class = []  # 禁用数据级权限过滤

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]

    queryset = ServiceImage.objects.all().order_by('sort', '-create_datetime')
    serializer_class = ServiceImageSerializer
    filter_fields = ['service']
    search_fields = []
    permission_classes = []

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context['request'] = self.request
        return context


class ServiceViewSet(CustomModelViewSet):
    permission_classes = []  # 禁用所有权限类，由 action 单独控制
    extra_filter_class = []  # 禁用数据级权限过滤，EscortUser 没有 manage_dept 等字段
    """服务项目管理接口"""

    def get_authenticators(self):
        from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication
        from rest_framework_simplejwt.authentication import JWTAuthentication
        return [EscortUserAuthentication(), JWTAuthentication()]

    queryset = Service.objects.all().order_by('sort', '-create_datetime')
    serializer_class = ServiceSerializer
    create_serializer_class = ServiceCreateUpdateSerializer
    update_serializer_class = ServiceCreateUpdateSerializer
    filter_fields = ['category', 'service_type', 'is_active', ]
    search_fields = ['name', 'description', 'game_name']
    
    @action(methods=["POST"], detail=True, permission_classes=[EscortAdminPermission])
    def toggle_status(self, request, *args, **kwargs):
        """切换服务状态（上架/下架）"""
        instance = self.get_object()
        instance.is_active = not instance.is_active
        instance.save()
        
        status_text = "上架" if instance.is_active else "下架"
        return SuccessResponse(msg=f"服务已{status_text}")
    
    @action(methods=["GET"], detail=False, permission_classes=[EscortUserPermission])
    def statistics(self, request, *args, **kwargs):
        """服务统计"""
        total_services = self.queryset.count()
        active_services = self.queryset.filter(is_active=True).count()
        single_services = self.queryset.filter(service_type=Service.SERVICE_SINGLE).count()
        multi_services = self.queryset.filter(service_type=Service.SERVICE_MULTI).count()

        return SuccessResponse(data={
            'total_services': total_services,
            'active_services': active_services,
            'single_services': single_services,
            'multi_services': multi_services
        })

    @action(methods=["POST"], detail=True, permission_classes=[])
    def save_images(self, request, *args, **kwargs):
        """保存商品图片（先删后插）"""
        instance = self.get_object()
        images = request.data.get('images', [])

        # 最多5张
        if len(images) > 5:
            return ErrorResponse(msg="商品图片最多5张")

        # 删除旧图片
        instance.images.all().delete()

        # 插入新图片
        for i, path in enumerate(images):
            ServiceImage.objects.create(
                service=instance,
                image=path,
                sort=i,
            )

        return SuccessResponse(msg="图片保存成功")