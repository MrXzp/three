# -*- coding: utf-8 -*-
"""
自定义认证类
解决 EscortUser 与 system.Users 表分离的问题：
- wx_login 签发的 JWT 里包含 escort user 的 id 和 openid
- SimpleJWT 默认用 user_id 查 system.Users，找不到就 401
- 本类直接查 EscortUser 表，返回正确的用户对象
"""
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.exceptions import InvalidToken, AuthenticationFailed
from django.utils.translation import gettext_lazy as _
from rest_framework.permissions import BasePermission


class EscortUserAuthentication(JWTAuthentication):
    """
    陪玩平台专用 JWT 认证
    优先从 EscortUser 表中查找用户（通过 token 中的 user_id）
    """

    def get_user(self, validated_token):
        """
        重写 get_user：
        - 从 token payload 拿到 escort user 的 id 或 openid
        - 直接查 EscortUser 表，不再走 Users 表
        - 如果 token 里没有 escort 专属字段，静默跳过（返回 None）
          让认证链继续尝试下一个认证器（如后台 admin 的 JWTAuthentication）
        """
        from dvadmin.escort.models import EscortUser

        user_id = validated_token.get('user_id')
        openid = validated_token.get('openid')

        # 如果 token 里没有任何 escort 专属字段，静默跳过，让认证链继续
        if not openid and not user_id:
            return None

        # 有 openid → 一定是陪玩平台 token，按 openid 或 user_id 查找
        if openid:
            try:
                if user_id:
                    user = EscortUser.objects.get(pk=user_id)
                else:
                    user = EscortUser.objects.get(openid=openid)
            except EscortUser.DoesNotExist:
                raise AuthenticationFailed(
                    detail={'detail': 'User not found', 'code': 'user_not_found'},
                    code='user_not_found'
                )
            return user

        # 只有 user_id，没有 openid → 可能是 admin 后台登录
        # 尝试查 EscortUser，找不到则静默跳过，让后续的 admin JWTAuthentication 处理
        try:
            return EscortUser.objects.get(pk=user_id)
        except EscortUser.DoesNotExist:
            return None


class EscortUserPermission(BasePermission):
    """
    陪玩平台专用权限类
    只要用户通过 EscortUserAuthentication 认证（request.user 是 EscortUser）即可
    不依赖 role、is_superuser 等 admin 用户才有的字段
    """

    def has_permission(self, request, view):
        from dvadmin.escort.models import EscortUser
        from django.contrib.auth.models import AnonymousUser
        import logging
        logger = logging.getLogger('escort')
        logger.warning(f"[EscortUserPermission] user={request.user}, type={type(request.user)}, is_EscortUser={isinstance(request.user, EscortUser)}, is_Anonymous={isinstance(request.user, AnonymousUser)}")
        return isinstance(request.user, EscortUser)


class EscortAdminPermission(BasePermission):
    """
    陪玩平台 Web 后台管理权限
    只要 request.user 不是 AnonymousUser 即可（Admin JWT 认证成功即为通过）
    不依赖 EscortUser 相关字段
    """

    def has_permission(self, request, view):
        from django.contrib.auth.models import AnonymousUser
        import logging
        logger = logging.getLogger('escort')
        logger.warning(f"[EscortAdminPermission] user={request.user}, type={type(request.user)}, AnonymousUser={isinstance(request.user, AnonymousUser)}")
        result = not isinstance(request.user, AnonymousUser)
        logger.warning(f"[EscortAdminPermission] result={result}")
        return result
