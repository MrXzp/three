# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact:
@Created on: 2026/4/2
@Remark: 陪玩平台API路由

路由规范：
  - web/ 开头：Web 端管理后台专用接口（admin JWT 认证）
  - app/ 开头：小程序用户专用接口（escort JWT 认证）
"""
from django.urls import path, include
from rest_framework import routers

from .views.user import (
    EscortUserViewSet,        # Web 端：用户列表（只读）
    AppUserViewSet,            # App 端：用户自身操作（current, update_info, quit_hunter）
    AppLoginView,              # App 端：微信登录
    ApplyHunterView,           # App 端：申请成为打手
    FileUploadView,            # 通用：文件上传
)
from .views.service import (
    ServiceCategoryViewSet,
    ServiceViewSet,
    ServiceImageViewSet,
)
from .views.order import OrderViewSet
from .views.withdrawal import WithdrawalViewSet
from .views.buddy import BuddyRelationViewSet
from .views.buddy_admin import BuddyViewSet   # Web 端：打手管理（审批/暂停/激活/撤销）
from .views.review import OrderReviewViewSet
from .views.refund import RefundRequestViewSet
from .views.chat import ChatMessageViewSet, WebAdminChatMessageViewSet


# ---------- Web 端路由（admin JWT） ----------
# 注意：同一 ViewSet 可以同时注册到 web 和 app 两个路由
web_router = routers.SimpleRouter()
web_router.register(r'escort_user', EscortUserViewSet, basename='web-escort-user')
web_router.register(r'hunter', BuddyViewSet, basename='web-hunter')
# Web 端也需要管理订单、服务、提现、搭子、评价
web_router.register(r'service_category', ServiceCategoryViewSet, basename='web-service-category')
web_router.register(r'service', ServiceViewSet, basename='web-service')
web_router.register(r'order', OrderViewSet, basename='web-order')
web_router.register(r'withdrawal', WithdrawalViewSet, basename='web-withdrawal')
web_router.register(r'buddy', BuddyRelationViewSet, basename='web-buddy')
web_router.register(r'review', OrderReviewViewSet, basename='web-review')
web_router.register(r'refund', RefundRequestViewSet, basename='web-refund')

web_urlpatterns = [
    path('web/', include(web_router.urls)),
    path('web/order/<int:order_id>/messages/', WebAdminChatMessageViewSet.as_view(), name='web-chat-messages'),
]

# ---------- App 端路由（escort JWT） ----------
app_router = routers.SimpleRouter()
app_router.register(r'user', AppUserViewSet, basename='app-user')
app_router.register(r'service_category', ServiceCategoryViewSet, basename='app-service-category')
app_router.register(r'service', ServiceViewSet, basename='app-service')
app_router.register(r'order', OrderViewSet, basename='app-order')
app_router.register(r'withdrawal', WithdrawalViewSet, basename='app-withdrawal')
app_router.register(r'buddy', BuddyRelationViewSet, basename='app-buddy')
app_router.register(r'review', OrderReviewViewSet, basename='app-review')
app_router.register(r'refund', RefundRequestViewSet, basename='app-refund')

app_urlpatterns = [
    path('app/login/', AppLoginView.as_view(), name='app-login'),
    path('app/apply_hunter/', ApplyHunterView.as_view(), name='app-apply-hunter'),
    path('app/upload/', FileUploadView.as_view(), name='app-upload'),
    path('app/order/<int:order_id>/messages/', ChatMessageViewSet.as_view({
        'get': 'list', 'post': 'send'
    }), name='app-chat-messages'),
    path('app/order/<int:order_id>/messages/send/', ChatMessageViewSet.as_view({'post': 'send'}), name='app-chat-send'),
    path('app/order/<int:order_id>/messages/read/', ChatMessageViewSet.as_view({'post': 'read'}), name='app-chat-read'),
    path('app/', include(app_router.urls)),
]

urlpatterns = (
    web_urlpatterns
    + app_urlpatterns
)
