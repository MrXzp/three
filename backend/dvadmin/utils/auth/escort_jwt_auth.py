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

        # 如果 token 里没有任何 escort 专属字段，说明不是陪玩平台签发的 token
        # 静默跳过，让认证链继续（不会 401，也不会阻止后续认证器）
        if not openid:
            return None

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
