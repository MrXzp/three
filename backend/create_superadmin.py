import os
import sys
os.chdir(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
os.environ['DJANGO_SETTINGS_MODULE'] = 'application.settings'

import django
django.setup()

from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
from dvadmin.system.models import Users
from django.contrib.auth.hashers import make_password

# 删除可能存在的旧用户
Users.objects.filter(username='superadmin').delete()

# 创建超级管理员（is_superuser=True 拥有所有权限）
user = Users.objects.create(
    id=1,
    username='superadmin',
    password=make_password('admin123456'),
    is_superuser=True,  # 超级管理员
    is_staff=True,      # 可以访问admin后台
    is_active=True,
    email='974614985@qq.com',
    mobile='18296642121',
    name='超级管理员'
)

# 获取所有权限并分配给用户
all_permissions = Permission.objects.all()
user.user_permissions.set(all_permissions)

print('=' * 50)
print('超级管理员创建成功!')
print('=' * 50)
print(f'用户名: superadmin')
print(f'密码: admin123456')
print(f'拥有权限数: {all_permissions.count()}')
print('=' * 50)
print('此账号拥有所有权限，且权限不可修改')
