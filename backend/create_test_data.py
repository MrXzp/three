#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
创建陪玩平台测试数据
"""
import os
import sys
import django
from django.utils import timezone
from datetime import timedelta

# 设置Django环境
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'application.settings')
django.setup()

from dvadmin.escort.models import (
    EscortUser, ServiceCategory, Service, Order, 
    OrderHunter, Withdrawal, BuddyRelation, OrderReview
)

def create_test_data():
    """创建测试数据"""
    
    print("开始创建陪玩平台测试数据...")
    
    # 1. 创建测试用户
    print("1. 创建测试用户...")
    users = []
    
    user_data = [
        {
            'openid': 'wx_test_user_001',
            'nickname': '游戏大神',
            'avatar_url': 'https://thirdwx.qlogo.cn/mmopen/vi_32/test1',
            'phone': '13800138001',
            'real_name': '张三',
            'hunter_status': EscortUser.HUNTER_APPROVED,
            'balance': '1500.00',
            'total_income': '5000.00',
            'completed_orders': 25,
            'avg_rating': 4.8
        },
        {
            'openid': 'wx_test_user_002',
            'nickname': '陪玩小仙女',
            'avatar_url': 'https://thirdwx.qlogo.cn/mmopen/vi_32/test2',
            'phone': '13900139002',
            'real_name': '李四',
            'hunter_status': EscortUser.HUNTER_PENDING,
            'balance': '800.00',
            'total_income': '1200.00',
            'completed_orders': 8,
            'avg_rating': 4.5
        },
        {
            'openid': 'wx_test_user_003',
            'nickname': '峡谷猎手',
            'phone': '13700137003',
            'real_name': '王五',
            'hunter_status': EscortUser.HUNTER_NOT_APPLIED,
            'balance': '0.00',
            'total_income': '0.00',
            'completed_orders': 0,
            'avg_rating': 0
        },
        {
            'openid': 'wx_test_user_004',
            'nickname': '电竞高手',
            'avatar_url': 'https://thirdwx.qlogo.cn/mmopen/vi_32/test4',
            'phone': '13600136004',
            'real_name': '赵六',
            'hunter_status': EscortUser.HUNTER_APPROVED,
            'balance': '3200.00',
            'total_income': '8500.00',
            'completed_orders': 42,
            'avg_rating': 4.9
        },
        {
            'openid': 'wx_test_user_005',
            'nickname': '萌新玩家',
            'phone': '13500135005',
            'real_name': '钱七',
            'hunter_status': EscortUser.HUNTER_REJECTED,
            'balance': '200.00',
            'total_income': '300.00',
            'completed_orders': 3,
            'avg_rating': 4.2,
            'reject_reason': '游戏水平未达到要求'
        }
    ]
    
    for data in user_data:
        user, created = EscortUser.objects.get_or_create(
            openid=data['openid'],
            defaults=data
        )
        users.append(user)
        if created:
            print(f"   [OK] 创建用户: {data['nickname']}")
        else:
            print(f"   [EXIST] 用户已存在: {data['nickname']}")
    
    # 2. 创建服务分类
    print("\n2. 创建服务分类...")
    categories = []
    
    category_data = [
        {'name': '英雄联盟', 'description': '英雄联盟相关陪玩服务', 'sort': 1},
        {'name': '王者荣耀', 'description': '王者荣耀相关陪玩服务', 'sort': 2},
        {'name': 'CS:GO', 'description': 'CS:GO射击游戏陪玩', 'sort': 3},
        {'name': '原神', 'description': '原神游戏陪玩', 'sort': 4},
        {'name': '其他游戏', 'description': '其他游戏陪玩服务', 'sort': 5}
    ]
    
    for data in category_data:
        category, created = ServiceCategory.objects.get_or_create(
            name=data['name'],
            defaults=data
        )
        categories.append(category)
        if created:
            print(f"   [OK] 创建分类: {data['name']}")
    
    # 3. 创建服务项目
    print("\n3. 创建服务项目...")
    services = []
    
    service_data = [
        {
            'category': categories[0],  # 英雄联盟
            'name': '排位赛上分',
            'description': '专业陪玩，带你上分，保证胜率',
            'price': '50.00',
            'service_type': Service.SERVICE_SINGLE,
            'required_hunters': 1,
            'duration': 60,
            'game_name': '英雄联盟',
            'game_server': '艾欧尼亚',
            'game_mode': '单双排',
            'is_active': True,
            'sort': 1
        },
        {
            'category': categories[0],  # 英雄联盟
            'name': '五排车队',
            'description': '五人车队，稳定上分，娱乐陪玩',
            'price': '200.00',
            'service_type': Service.SERVICE_MULTI,
            'required_hunters': 5,
            'duration': 120,
            'game_name': '英雄联盟',
            'game_server': '峡谷之巅',
            'game_mode': '灵活组排',
            'is_active': True,
            'sort': 2
        },
        {
            'category': categories[1],  # 王者荣耀
            'name': '星耀上王者',
            'description': '专业王者荣耀陪玩，快速上分',
            'price': '80.00',
            'service_type': Service.SERVICE_SINGLE,
            'required_hunters': 1,
            'duration': 90,
            'game_name': '王者荣耀',
            'game_server': '微信区',
            'game_mode': '单排/双排',
            'is_active': True,
            'sort': 3
        },
        {
            'category': categories[2],  # CS:GO
            'name': '竞技模式',
            'description': '专业CS:GO玩家，提升你的游戏水平',
            'price': '100.00',
            'service_type': Service.SERVICE_SINGLE,
            'required_hunters': 1,
            'duration': 90,
            'game_name': 'CS:GO',
            'game_server': '国服',
            'game_mode': '竞技模式',
            'is_active': False,
            'sort': 4
        }
    ]
    
    for data in service_data:
        service, created = Service.objects.get_or_create(
            name=data['name'],
            category=data['category'],
            defaults=data
        )
        services.append(service)
        if created:
            print(f"   [OK] 创建服务: {data['name']}")
    
    # 4. 创建订单
    print("\n4. 创建测试订单...")
    
    order_data = [
        {
            'order_no': 'ESC202604020001',
            'customer': users[0],  # 游戏大神
            'service': services[0],  # 排位赛上分
            'status': Order.STATUS_COMPLETED,
            'total_amount': '50.00',
            'platform_fee': '5.00',
            'hunter_share': '45.00',
            'game_account': 'game_master_001',
            'game_server': '艾欧尼亚',
            'pay_time': timezone.now() - timedelta(days=5),
            'accept_time': timezone.now() - timedelta(days=5, hours=1),
            'service_start_time': timezone.now() - timedelta(days=5, hours=2),
            'service_end_time': timezone.now() - timedelta(days=5, hours=3),
            'complete_time': timezone.now() - timedelta(days=5, hours=4)
        },
        {
            'order_no': 'ESC202604020002',
            'customer': users[1],  # 陪玩小仙女
            'service': services[1],  # 五排车队
            'status': Order.STATUS_IN_SERVICE,
            'total_amount': '200.00',
            'platform_fee': '20.00',
            'hunter_share': '180.00',
            'game_account': 'cute_gamer_002',
            'game_server': '峡谷之巅',
            'pay_time': timezone.now() - timedelta(hours=3),
            'accept_time': timezone.now() - timedelta(hours=2),
            'service_start_time': timezone.now() - timedelta(hours=1)
        },
        {
            'order_no': 'ESC202604020003',
            'customer': users[2],  # 峡谷猎手
            'service': services[2],  # 星耀上王者
            'status': Order.STATUS_PENDING_PAYMENT,
            'total_amount': '80.00',
            'platform_fee': '8.00',
            'hunter_share': '72.00',
            'game_account': 'canyon_hunter_003',
            'game_server': '微信区'
        },
        {
            'order_no': 'ESC202604020004',
            'customer': users[3],  # 电竞高手
            'service': services[0],  # 排位赛上分
            'status': Order.STATUS_ACCEPTED,
            'total_amount': '50.00',
            'platform_fee': '5.00',
            'hunter_share': '45.00',
            'game_account': 'esports_pro_004',
            'game_server': '艾欧尼亚',
            'pay_time': timezone.now() - timedelta(hours=2),
            'accept_time': timezone.now() - timedelta(hours=1)
        }
    ]
    
    for data in order_data:
        order, created = Order.objects.get_or_create(
            order_no=data['order_no'],
            defaults=data
        )
        if created:
            print(f"   [OK] 创建订单: {data['order_no']} - {order.get_status_display()}")
            
            # 为已接单和进行中的订单添加打手
            if order.status in [Order.STATUS_ACCEPTED, Order.STATUS_IN_SERVICE, Order.STATUS_COMPLETED]:
                # 随机选择一个打手用户
                hunter = users[0] if users[0].hunter_status == EscortUser.HUNTER_APPROVED else users[3]
                OrderHunter.objects.create(
                    order=order,
                    hunter=hunter,
                    is_primary=True,
                    share_percentage=90.0,
                    share_amount=order.hunter_share
                )
                print(f"      分配打手: {hunter.nickname}")
    
    # 5. 创建提现申请
    print("\n5. 创建提现申请...")
    
    withdrawal_data = [
        {
            'user': users[0],  # 游戏大神
            'amount': '500.00',
            'tax_amount': '50.00',
            'actual_amount': '450.00',
            'status': Withdrawal.STATUS_PENDING
        },
        {
            'user': users[3],  # 电竞高手
            'amount': '1000.00',
            'tax_amount': '100.00',
            'actual_amount': '900.00',
            'status': Withdrawal.STATUS_SUCCESS,
            'payment_no': 'WX202604020001',
            'payment_time': timezone.now() - timedelta(days=2)
        }
    ]
    
    for data in withdrawal_data:
        withdrawal, created = Withdrawal.objects.get_or_create(
            user=data['user'],
            amount=data['amount'],
            status=data['status'],
            defaults=data
        )
        if created:
            print(f"   [OK] 创建提现: {data['user'].nickname} - ¥{data['amount']}")
    
    # 6. 创建搭子关系
    print("\n6. 创建搭子关系...")
    
    # 用户0和用户3成为搭子
    buddy, created = BuddyRelation.objects.get_or_create(
        user_a=users[0],
        user_b=users[3]
    )
    if created:
        print(f"   [OK] 创建搭子关系: {users[0].nickname} ↔ {users[3].nickname}")
    
    print("\n[DONE] 测试数据创建完成！")
    print(f"[SUMMARY] 统计:")
    print(f"  用户: {EscortUser.objects.count()} 个")
    print(f"  服务分类: {ServiceCategory.objects.count()} 个")
    print(f"  服务项目: {Service.objects.count()} 个")
    print(f"  订单: {Order.objects.count()} 个")
    print(f"  提现申请: {Withdrawal.objects.count()} 个")
    print(f"  搭子关系: {BuddyRelation.objects.count()} 个")

if __name__ == '__main__':
    create_test_data()