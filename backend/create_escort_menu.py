#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
创建陪玩平台菜单
"""
import os
import sys
import django

# 设置Django环境
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'application.settings')
django.setup()

from dvadmin.system.models import Menu
from django.contrib.auth import get_user_model

def create_escort_menu():
    """创建陪玩平台菜单"""
    
    # 获取超级用户
    User = get_user_model()
    superuser = User.objects.filter(is_superuser=True).first()
    if not superuser:
        print("错误：没有找到超级用户")
        return
    
    print("开始创建陪玩平台菜单...")
    
    # 1. 创建根菜单：护航管理
    root_menu, created = Menu.objects.get_or_create(
        name='护航管理',
        defaults={
            'icon': 'ele-Ship',
            'sort': 100,
            'is_link': False,
            'is_catalog': True,
            'web_path': '/escort',
            'component': 'layout/routerView/parent',
            'creator': superuser,
        }
    )
    
    if created:
        print(f"[OK] 创建根菜单: {root_menu.name}")
    else:
        print(f"[EXIST] 根菜单已存在: {root_menu.name}")
    
    # 2. 创建子菜单
    sub_menus = [
        {
            'name': '小程序用户管理',
            'icon': 'ele-User',
            'sort': 1,
            'web_path': '/escort/user',
            'component': 'escort/user/index',
        },
        {
            'name': '打手管理',
            'icon': 'ele-Suitcase',
            'sort': 2,
            'web_path': '/escort/hunter',
            'component': 'escort/hunter/index',
        },
        {
            'name': '游戏管理',
            'icon': 'ele-GameController',
            'sort': 3,
            'web_path': '/escort/service_category',
            'component': 'escort/service_category/index',
        },
        {
            'name': '商品管理',
            'icon': 'ele-ShoppingCart',
            'sort': 4,
            'web_path': '/escort/service',
            'component': 'escort/service/index',
        },
        {
            'name': '订单管理',
            'icon': 'ele-Document',
            'sort': 5,
            'web_path': '/escort/order',
            'component': 'escort/order/index',
        },
        {
            'name': '提现审核',
            'icon': 'ele-Money',
            'sort': 6,
            'web_path': '/escort/withdrawal',
            'component': 'escort/withdrawal/index',
        },
        {
            'name': '搭子管理',
            'icon': 'ele-Connection',
            'sort': 7,
            'web_path': '/escort/buddy',
            'component': 'escort/buddy/index',
        },
        {
            'name': '评价管理',
            'icon': 'ele-Star',
            'sort': 8,
            'web_path': '/escort/review',
            'component': 'escort/review/index',
        },
    ]
    
    created_count = 0
    for menu_data in sub_menus:
        menu, created = Menu.objects.get_or_create(
            name=menu_data['name'],
            parent=root_menu,
            defaults={
                'icon': menu_data['icon'],
                'sort': menu_data['sort'],
                'is_link': False,
                'is_catalog': False,
                'web_path': menu_data['web_path'],
                'component': menu_data['component'],
                'creator': superuser,
            }
        )
        
        if created:
            print(f"  [OK] 创建子菜单: {menu.name}")
            created_count += 1
        else:
            print(f"  [EXIST] 子菜单已存在: {menu.name}")
    
    print(f"\n[DONE] 菜单创建完成！共创建/更新 {created_count} 个子菜单")
    print(f"[PATH] 前端访问路径: {root_menu.web_path}")
    print(f"[API] API前缀: /api/escort/")

if __name__ == '__main__':
    create_escort_menu()