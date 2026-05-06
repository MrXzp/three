# -*- coding: utf-8 -*-
"""
订单超时自动取消命令
用法: python manage.py cancel_expired_orders
可以配合 crontab 每分钟执行: * * * * * cd /path/to/project && python manage.py cancel_expired_orders
"""
import os
import sys
import django

# 设置 Django 环境
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'application.settings')
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))))
django.setup()

from django.core.management.base import BaseCommand
from django.utils import timezone
from datetime import timedelta
from dvadmin.escort.models import Order


class Command(BaseCommand):
    help = '自动取消超过30分钟未支付的订单'

    def add_arguments(self, parser):
        parser.add_argument(
            '--minutes',
            type=int,
            default=30,
            help='超过多少分钟未支付自动取消（默认30分钟）'
        )

    def handle(self, *args, **options):
        minutes = options['minutes']
        threshold_time = timezone.now() - timedelta(minutes=minutes)
        
        # 查询超时未支付的订单
        expired_orders = Order.objects.filter(
            status=Order.STATUS_PENDING_PAYMENT,
            create_datetime__lt=threshold_time
        )
        
        count = expired_orders.count()
        if count > 0:
            for order in expired_orders:
                order.status = Order.STATUS_CANCELLED
                order.cancel_time = timezone.now()
                order.cancel_reason = 'timeout'
                order.save()
            self.stdout.write(
                self.style.SUCCESS(f'成功取消 {count} 个超时未支付订单（超时 {minutes} 分钟）')
            )
        else:
            self.stdout.write('没有需要取消的订单')
