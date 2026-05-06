# -*- coding: utf-8 -*-
"""
测试视图
"""
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from dvadmin.utils.auth.escort_jwt_auth import EscortUserAuthentication


class TestView(APIView):
    permission_classes = [IsAuthenticated]

    def get_authenticators(self):
        return [EscortUserAuthentication()]
    
    def get(self, request):
        return Response({
            'code': 2000,
            'msg': '测试成功',
            'data': {
                'user': str(request.user),
                'is_authenticated': request.user.is_authenticated
            }
        })