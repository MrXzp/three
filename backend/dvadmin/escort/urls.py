# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact: 
@Created on: 2026/4/2
@Remark: 陪玩平台API路由
"""
from django.urls import path
from rest_framework import routers
from .views.user import EscortUserViewSet, FileUploadView, ApplyHunterView
from .views.service import ServiceCategoryViewSet, ServiceViewSet, ServiceImageViewSet
from .views.order import OrderViewSet
from .views.withdrawal import WithdrawalViewSet
from .views.buddy import BuddyRelationViewSet
from .views.buddy_admin import BuddyViewSet
from .views.review import OrderReviewViewSet
from .views.test import TestView

escort_url = routers.SimpleRouter()
escort_url.register(r'escort_user', EscortUserViewSet)
escort_url.register(r'service_category', ServiceCategoryViewSet)
escort_url.register(r'service', ServiceViewSet)
escort_url.register(r'service_image', ServiceImageViewSet)
escort_url.register(r'order', OrderViewSet)
escort_url.register(r'withdrawal', WithdrawalViewSet)
escort_url.register(r'buddy', BuddyRelationViewSet)
escort_url.register(r'hunter', BuddyViewSet, basename='hunter')
escort_url.register(r'review', OrderReviewViewSet)

urlpatterns = [
    path('test/', TestView.as_view(), name='test'),
    path('upload/', FileUploadView.as_view(), name='upload'),
    path('apply_hunter/', ApplyHunterView.as_view(), name='apply_hunter'),
]

urlpatterns += escort_url.urls