# -*- coding: utf-8 -*-
import os, sys
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'application.settings')
import django
django.setup()

from dvadmin.escort.models import Order, OrderHunter, OrderReview

print('=== Order Cleanup ===\n')

# 统计要删除的内容
order_count = Order.objects.count()
order_hunter_count = OrderHunter.objects.count()
order_review_count = OrderReview.objects.count()

print(f'Orders to delete: {order_count}')
print(f'OrderHunter records to delete: {order_hunter_count}')
print(f'OrderReview records to delete: {order_review_count}')

if order_count == 0:
    print('\nNo orders to clean. Exiting.')
    sys.exit(0)

# 执行删除（按依赖顺序）
print('\nDeleting OrderReview records...')
review_deleted, _ = OrderReview.objects.all().delete()
print(f'Deleted: {review_deleted} OrderReview records')

print('Deleting OrderHunter records...')
hunter_deleted, _ = OrderHunter.objects.all().delete()
print(f'Deleted: {hunter_deleted} OrderHunter records')

print('Deleting Order records...')
order_deleted, _ = Order.objects.all().delete()
print(f'Deleted: {order_deleted} Order records')

print('\n=== Cleanup Complete ===')
