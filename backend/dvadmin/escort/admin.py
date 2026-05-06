# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact: 
@Created on: 2026/4/2
@Remark: 陪玩平台管理后台
"""
from django.contrib import admin
from django.utils.html import format_html
from .models import (
    EscortUser, ServiceCategory, Service, Order, 
    OrderHunter, Withdrawal, BuddyRelation, OrderReview
)


@admin.register(EscortUser)
class EscortUserAdmin(admin.ModelAdmin):
    """陪玩用户管理"""
    list_display = ['nickname', 'openid_short', 'phone', 'hunter_status_display', 'balance', 'completed_orders', 'avg_rating']
    list_filter = ['hunter_status', 'is_deleted']
    search_fields = ['nickname', 'openid', 'phone', 'real_name']
    readonly_fields = ['openid', 'unionid', 'create_datetime', 'update_datetime']
    fieldsets = (
        ('微信信息', {
            'fields': ('openid', 'unionid', 'nickname', 'avatar_url')
        }),
        ('用户信息', {
            'fields': ('phone', 'real_name', 'id_card')
        }),
        ('打手信息', {
            'fields': ('hunter_status', 'apply_time', 'approve_time', 'reject_reason')
        }),
        ('财务信息', {
            'fields': ('balance', 'total_income', 'total_withdrawal')
        }),
        ('统计信息', {
            'fields': ('completed_orders', 'avg_rating')
        }),
    )
    
    def openid_short(self, obj):
        """显示缩短的OpenID"""
        if obj.openid and len(obj.openid) > 10:
            return f"{obj.openid[:10]}..."
        return obj.openid
    openid_short.short_description = 'OpenID'
    
    def hunter_status_display(self, obj):
        """显示打手状态"""
        status_map = {
            0: '未申请',
            1: '审核中',
            2: '已通过',
            3: '已拒绝',
            4: '已暂停'
        }
        return status_map.get(obj.hunter_status, '未知')
    hunter_status_display.short_description = '打手状态'


@admin.register(ServiceCategory)
class ServiceCategoryAdmin(admin.ModelAdmin):
    """服务分类管理"""
    list_display = ['name', 'sort', 'is_active', 'create_datetime']
    list_filter = ['is_active', 'is_deleted']
    search_fields = ['name', 'description']
    list_editable = ['sort', 'is_active']


@admin.register(Service)
class ServiceAdmin(admin.ModelAdmin):
    """陪玩服务管理"""
    list_display = ['name', 'category', 'price', 'service_type_display', 'required_hunters', 'game_name', 'is_active']
    list_filter = ['category', 'service_type', 'is_active', 'is_deleted']
    search_fields = ['name', 'description', 'game_name']
    list_editable = ['price', 'is_active']
    readonly_fields = ['create_datetime', 'update_datetime']
    
    def service_type_display(self, obj):
        """显示服务类型"""
        return '多人服务' if obj.service_type == 2 else '单人服务'
    service_type_display.short_description = '服务类型'


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    """订单管理"""
    list_display = ['order_no', 'customer_nickname', 'service_name', 'status_display', 'total_amount', 'create_datetime']
    list_filter = ['status', 'is_deleted']
    search_fields = ['order_no', 'customer__nickname', 'service__name']
    readonly_fields = ['order_no', 'create_datetime', 'update_datetime']
    fieldsets = (
        ('订单信息', {
            'fields': ('order_no', 'customer', 'service', 'status', 'total_amount', 'platform_fee', 'hunter_share')
        }),
        ('游戏信息', {
            'fields': ('game_account', 'game_server', 'game_mode', 'special_requirements')
        }),
        ('时间信息', {
            'fields': ('pay_time', 'accept_time', 'service_start_time', 'service_end_time', 'complete_time')
        }),
    )
    
    def customer_nickname(self, obj):
        """显示客户昵称"""
        return obj.customer.nickname if obj.customer.nickname else obj.customer.openid[:10] + '...'
    customer_nickname.short_description = '客户'
    
    def service_name(self, obj):
        """显示服务名称"""
        return obj.service.name
    service_name.short_description = '服务'
    
    def status_display(self, obj):
        """显示订单状态"""
        status_map = {
            0: '待支付',
            1: '待接单',
            2: '已接单',
            3: '等待搭子',
            4: '服务中',
            5: '待确认',
            6: '已完成',
            7: '已评价',
            8: '已取消'
        }
        return status_map.get(obj.status, '未知')
    status_display.short_description = '状态'


@admin.register(OrderHunter)
class OrderHunterAdmin(admin.ModelAdmin):
    """订单打手管理"""
    list_display = ['order_no', 'hunter_nickname', 'is_primary', 'share_amount', 'create_datetime']
    list_filter = ['is_primary', 'is_deleted']
    search_fields = ['order__order_no', 'hunter__nickname']
    
    def order_no(self, obj):
        return obj.order.order_no
    order_no.short_description = '订单号'
    
    def hunter_nickname(self, obj):
        return obj.hunter.nickname if obj.hunter.nickname else obj.hunter.openid[:10] + '...'
    hunter_nickname.short_description = '打手'


@admin.register(Withdrawal)
class WithdrawalAdmin(admin.ModelAdmin):
    """提现申请管理"""
    list_display = ['user_nickname', 'amount', 'tax_amount', 'actual_amount', 'status_display', 'create_datetime']
    list_filter = ['status', 'is_deleted']
    search_fields = ['user__nickname', 'payment_no']
    readonly_fields = ['create_datetime', 'update_datetime']
    actions = ['approve_withdrawals', 'reject_withdrawals']
    
    def user_nickname(self, obj):
        return obj.user.nickname if obj.user.nickname else obj.user.openid[:10] + '...'
    user_nickname.short_description = '用户'
    
    def status_display(self, obj):
        status_map = {
            0: '申请中',
            1: '处理中',
            2: '成功',
            3: '失败'
        }
        return status_map.get(obj.status, '未知')
    status_display.short_description = '状态'
    
    def approve_withdrawals(self, request, queryset):
        """批量批准提现"""
        updated = queryset.update(status=Withdrawal.STATUS_PROCESSING)
        self.message_user(request, f"已批准 {updated} 个提现申请")
    approve_withdrawals.short_description = "批准选中的提现申请"
    
    def reject_withdrawals(self, request, queryset):
        """批量拒绝提现"""
        updated = queryset.update(status=Withdrawal.STATUS_FAILED)
        self.message_user(request, f"已拒绝 {updated} 个提现申请")
    reject_withdrawals.short_description = "拒绝选中的提现申请"


@admin.register(BuddyRelation)
class BuddyRelationAdmin(admin.ModelAdmin):
    """搭子关系管理"""
    list_display = ['user_a_nickname', 'user_b_nickname', 'create_datetime']
    search_fields = ['user_a__nickname', 'user_b__nickname']
    
    def user_a_nickname(self, obj):
        return obj.user_a.nickname if obj.user_a.nickname else obj.user_a.openid[:10] + '...'
    user_a_nickname.short_description = '用户A'
    
    def user_b_nickname(self, obj):
        return obj.user_b.nickname if obj.user_b.nickname else obj.user_b.openid[:10] + '...'
    user_b_nickname.short_description = '用户B'


@admin.register(OrderReview)
class OrderReviewAdmin(admin.ModelAdmin):
    """订单评价管理"""
    list_display = ['order_no', 'customer_nickname', 'rating', 'is_anonymous', 'create_datetime']
    list_filter = ['rating', 'is_anonymous', 'is_deleted']
    search_fields = ['order__order_no', 'customer__nickname', 'content']
    
    def order_no(self, obj):
        return obj.order.order_no
    order_no.short_description = '订单号'
    
    def customer_nickname(self, obj):
        return obj.customer.nickname if obj.customer.nickname else obj.customer.openid[:10] + '...'
    customer_nickname.short_description = '评价人'