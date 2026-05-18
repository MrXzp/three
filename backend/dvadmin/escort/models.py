# -*- coding: utf-8 -*-
"""
@author: 三角洲行动陪玩平台
@contact: 
@Created on: 2026/4/2
@Remark: 陪玩平台数据模型
"""
from django.db import models
from django.utils.translation import gettext_lazy as _
from dvadmin.utils.models import CoreModel, table_prefix


class _EmptyRoleQuerySet:
    """模拟空的 Role QuerySet，让 .values_list() 总是返回空列表"""
    def values_list(self, *fields, flat=False):
        return []

    def values(self, *fields, **expressions):
        return []

    def all(self):
        return self

    def __bool__(self):
        return False

    def __iter__(self):
        return iter([])


class EscortUser(CoreModel):
    """陪玩平台用户模型"""

    # 打手状态常量
    HUNTER_NOT_APPLIED = 0      # 未申请
    HUNTER_PENDING = 1          # 审核中
    HUNTER_APPROVED = 2         # 已通过
    HUNTER_REJECTED = 3         # 已拒绝
    HUNTER_SUSPENDED = 4        # 已暂停

    HUNTER_STATUS_CHOICES = [
        (HUNTER_NOT_APPLIED, '未申请'),
        (HUNTER_PENDING, '审核中'),
        (HUNTER_APPROVED, '已通过'),
        (HUNTER_REJECTED, '已拒绝'),
        (HUNTER_SUSPENDED, '已暂停'),
    ]
    
    # 微信相关字段
    openid = models.CharField(max_length=128, unique=True, verbose_name='微信OpenID', help_text='微信用户唯一标识')
    unionid = models.CharField(max_length=128, blank=True, null=True, verbose_name='微信UnionID', help_text='微信UnionID')
    nickname = models.CharField(max_length=100, blank=True, null=True, verbose_name='微信昵称', help_text='微信昵称')
    avatar_url = models.URLField(max_length=500, blank=True, null=True, verbose_name='微信头像', help_text='微信头像URL')
    
    # 用户信息
    phone = models.CharField(max_length=20, blank=True, null=True, verbose_name='手机号', help_text='用户手机号')
    real_name = models.CharField(max_length=50, blank=True, null=True, verbose_name='真实姓名', help_text='用户真实姓名')
    id_card = models.CharField(max_length=18, blank=True, null=True, verbose_name='身份证号', help_text='身份证号码')
    id_card_front = models.CharField(max_length=500, blank=True, null=True, verbose_name='身份证正面', help_text='身份证正面照片URL')
    id_card_back = models.CharField(max_length=500, blank=True, null=True, verbose_name='身份证反面', help_text='身份证反面照片URL')
    
    # 打手相关字段
    hunter_status = models.IntegerField(
        default=HUNTER_NOT_APPLIED,
        choices=HUNTER_STATUS_CHOICES,
        verbose_name='打手状态',
        help_text='打手申请状态'
    )
    apply_time = models.DateTimeField(blank=True, null=True, verbose_name='申请时间', help_text='申请成为打手的时间')
    approve_time = models.DateTimeField(blank=True, null=True, verbose_name='审核时间', help_text='打手审核通过时间')
    reject_reason = models.TextField(blank=True, null=True, verbose_name='拒绝原因', help_text='打手申请被拒绝的原因')
    
    # 财务相关
    balance = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='余额', help_text='用户可用余额')
    total_income = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='总收入', help_text='累计总收入')
    total_withdrawal = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='总提现', help_text='累计提现金额')
    
    # 统计字段
    completed_orders = models.IntegerField(default=0, verbose_name='完成订单数', help_text='已完成的订单数量')
    avg_rating = models.FloatField(default=0, verbose_name='平均评分', help_text='平均评分（0-5分）')
    
    class Meta:
        db_table = table_prefix + "escort_user"
        verbose_name = '陪玩用户'
        verbose_name_plural = verbose_name
        ordering = ('-create_datetime',)
    
    def __str__(self):
        return f"{self.nickname or self.openid[:10]}..."

    @property
    def is_authenticated(self):
        """
        DRF IsAuthenticated 权限类需要此属性
        陪玩用户通过 JWT 认证后始终视为已认证
        """
        return True

    @property
    def is_anonymous(self):
        return False

    @property
    def is_active(self):
        """DRF / 后台系统兼容：陪玩用户始终视为活跃"""
        return True

    @property
    def is_superuser(self):
        """CustomPermission 检查 is_superuser，陪玩用户不是超级管理员"""
        return False

    @property
    def username(self):
        """
        中间件 save_login_log 访问 request.user.username
        陪玩用户没有 username 字段，用 openid 的后8位代替
        """
        return self.openid[-8:] if self.openid else str(self.id)

    @property
    def name(self):
        """
        序列化器 OrderSerializer 包含 creator（ForeignKey）字段
        DRF 序列化 creator 时会访问 .name，统一返回 nickname
        """
        return self.nickname or (self.openid[-8:] if self.openid else str(self.id))

    @property
    def avatar(self):
        """
        OrderSerializer 等处可能访问 creator.avatar
        """
        return self.avatar_url or ''

    @property
    def role(self):
        """
        user_info 视图和 viewset.py 字段权限检查会访问:
        - request.user.role.values_list('id', flat=True)
        - request.user.role.values('id', 'name', 'key')
        陪玩用户没有角色概念，返回模拟空 QuerySet 让调用链正常执行
        """
        return _EmptyRoleQuerySet()

    @property
    def mobile(self):
        """user_info 视图访问 user.mobile"""
        return self.phone or ''

    @property
    def user_type(self):
        """user_info 视图访问 user.user_type"""
        return 99  # 特殊类型，区分后台用户

    @property
    def gender(self):
        """user_info 视图访问 user.gender"""
        return 2  # 未知

    @property
    def email(self):
        """user_info 视图访问 user.email"""
        return ''

    @property
    def pwd_change_count(self):
        """user_info 视图访问 user.pwd_change_count"""
        return 0

    @property
    def dept_id(self):
        """中间件记录日志时访问 dept_id，陪玩用户没有部门概念"""
        return None


class ServiceCategory(CoreModel):
    """服务分类"""
    name = models.CharField(max_length=50, verbose_name='分类名称', help_text='服务分类名称')
    description = models.TextField(blank=True, null=True, verbose_name='分类描述', help_text='分类描述')
    icon = models.CharField(max_length=100, blank=True, null=True, verbose_name='图标', help_text='分类图标（图标类名）')
    image = models.CharField(max_length=500, blank=True, null=True, verbose_name='分类图片', help_text='分类图片（存储图片URL相对路径）')
    sort = models.IntegerField(default=0, verbose_name='排序', help_text='分类排序')
    is_active = models.BooleanField(default=True, verbose_name='是否启用', help_text='是否启用该分类')
    
    class Meta:
        db_table = table_prefix + "escort_service_category"
        verbose_name = '服务分类'
        verbose_name_plural = verbose_name
        ordering = ('sort', 'create_datetime')
    
    def __str__(self):
        return self.name


class Service(CoreModel):
    """陪玩服务"""
    
    # 服务类型
    SERVICE_SINGLE = 1  # 单人服务
    SERVICE_MULTI = 2   # 多人服务
    
    SERVICE_TYPE_CHOICES = [
        (SERVICE_SINGLE, '单人服务'),
        (SERVICE_MULTI, '多人服务'),
    ]
    
    category = models.ForeignKey(ServiceCategory, on_delete=models.CASCADE, verbose_name='服务分类', help_text='所属分类')
    name = models.CharField(max_length=100, verbose_name='服务名称', help_text='服务名称')
    description = models.TextField(verbose_name='服务描述', help_text='服务详细描述')
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='价格', help_text='服务价格')
    service_type = models.IntegerField(choices=SERVICE_TYPE_CHOICES, default=SERVICE_SINGLE, verbose_name='服务类型', help_text='单人还是多人服务')
    required_hunters = models.IntegerField(default=1, verbose_name='所需打手数', help_text='需要多少打手')
    duration = models.IntegerField(verbose_name='服务时长(分钟)', help_text='服务时长，单位分钟')
    game_name = models.CharField(max_length=100, verbose_name='游戏名称', help_text='游戏名称')
    game_server = models.CharField(max_length=100, blank=True, null=True, verbose_name='游戏服务器', help_text='游戏服务器')
    game_mode = models.CharField(max_length=100, blank=True, null=True, verbose_name='游戏模式', help_text='游戏模式')
    
    # 服务状态
    is_active = models.BooleanField(default=True, verbose_name='是否上架', help_text='是否上架销售')
    sort = models.IntegerField(default=0, verbose_name='排序', help_text='服务排序')
    
    class Meta:
        db_table = table_prefix + "escort_service"
        verbose_name = '陪玩服务'
        verbose_name_plural = verbose_name
        ordering = ('sort', 'create_datetime')
    
    def __str__(self):
        return self.name


class ServiceImage(CoreModel):
    """商品图片（一个商品最多5张）"""
    service = models.ForeignKey(Service, on_delete=models.CASCADE, related_name='images', verbose_name='商品', help_text='所属商品')
    image = models.CharField(max_length=500, verbose_name='图片路径', help_text='图片相对路径')
    sort = models.IntegerField(default=0, verbose_name='排序', help_text='图片排序，越小越靠前')

    class Meta:
        db_table = table_prefix + "escort_service_image"
        verbose_name = '商品图片'
        verbose_name_plural = verbose_name
        ordering = ('sort', 'create_datetime')

    def __str__(self):
        return f"{self.service.name} - {self.image}"


class Order(CoreModel):
    """订单模型"""
    
    # 订单状态常量
    STATUS_PENDING_PAYMENT = 0      # 待支付
    STATUS_PENDING_ACCEPT = 1       # 待接单
    STATUS_ACCEPTED = 2             # 已接单
    STATUS_WAITING_PARTNER = 3      # 等待搭子（多人订单）
    STATUS_IN_SERVICE = 4           # 服务中
    STATUS_PENDING_CONFIRM = 5      # 待确认
    STATUS_COMPLETED = 6            # 已完成
    STATUS_REVIEWED = 7             # 已评价
    STATUS_CANCELLED = 8            # 已取消
    STATUS_REFUNDING = 9            # 退款中
    STATUS_REFUNDED = 10            # 已退款

    STATUS_CHOICES = [
        (STATUS_PENDING_PAYMENT, '待支付'),
        (STATUS_PENDING_ACCEPT, '待接单'),
        (STATUS_ACCEPTED, '已接单'),
        (STATUS_WAITING_PARTNER, '等待搭子'),
        (STATUS_IN_SERVICE, '服务中'),
        (STATUS_PENDING_CONFIRM, '待确认'),
        (STATUS_COMPLETED, '已完成'),
        (STATUS_REVIEWED, '已评价'),
        (STATUS_CANCELLED, '已取消'),
        (STATUS_REFUNDING, '退款中'),
        (STATUS_REFUNDED, '已退款'),
    ]
    
    order_no = models.CharField(max_length=50, unique=True, verbose_name='订单编号', help_text='订单唯一编号')
    out_trade_no = models.CharField(max_length=100, blank=True, null=True, verbose_name='微信支付单号', help_text='微信支付统一下单返回的商户订单号（out_trade_no）', db_index=True)
    customer = models.ForeignKey(EscortUser, on_delete=models.CASCADE, related_name='customer_orders', verbose_name='客户', help_text='下单客户')
    service = models.ForeignKey(Service, on_delete=models.CASCADE, verbose_name='服务项目', help_text='购买的服务')
    
    # 订单信息
    status = models.IntegerField(choices=STATUS_CHOICES, default=STATUS_PENDING_PAYMENT, verbose_name='订单状态', help_text='订单当前状态')
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='订单总金额', help_text='订单总金额')
    platform_fee = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='平台抽成', help_text='平台抽成金额')
    hunter_share = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='打手分成', help_text='打手分成金额')
    
    # 游戏信息
    game_account = models.CharField(max_length=100, verbose_name='游戏账号', help_text='客户游戏账号')
    game_server = models.CharField(max_length=100, verbose_name='游戏服务器', help_text='游戏服务器')
    game_mode = models.CharField(max_length=100, blank=True, null=True, verbose_name='游戏模式', help_text='游戏模式')
    special_requirements = models.TextField(blank=True, null=True, verbose_name='特殊要求', help_text='客户的特殊要求')
    
    # 时间字段
    pay_time = models.DateTimeField(blank=True, null=True, verbose_name='支付时间', help_text='支付完成时间')
    accept_time = models.DateTimeField(blank=True, null=True, verbose_name='接单时间', help_text='打手接单时间')
    service_start_time = models.DateTimeField(blank=True, null=True, verbose_name='服务开始时间', help_text='服务开始时间')
    service_end_time = models.DateTimeField(blank=True, null=True, verbose_name='服务结束时间', help_text='服务结束时间')
    complete_time = models.DateTimeField(blank=True, null=True, verbose_name='完成时间', help_text='订单完成时间')
    cancel_time = models.DateTimeField(blank=True, null=True, verbose_name='取消时间', help_text='订单取消时间')
    cancel_reason = models.CharField(max_length=100, blank=True, null=True, verbose_name='取消原因', help_text='取消原因：user=用户取消, timeout=超时自动取消')
    
    class Meta:
        db_table = table_prefix + "escort_order"
        verbose_name = '陪玩订单'
        verbose_name_plural = verbose_name
        ordering = ('-create_datetime',)
    
    def __str__(self):
        return f"{self.order_no} - {self.get_status_display()}"


class OrderHunter(CoreModel):
    """订单打手关联表"""
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='hunters', verbose_name='订单', help_text='所属订单')
    hunter = models.ForeignKey(EscortUser, on_delete=models.CASCADE, verbose_name='打手', help_text='接单打手')
    is_primary = models.BooleanField(default=False, verbose_name='是否抢单人', help_text='是否是抢单人')
    share_percentage = models.FloatField(default=0, verbose_name='分成比例', help_text='打手分成比例（百分比）')
    share_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='分成金额', help_text='打手分成金额')
    
    class Meta:
        db_table = table_prefix + "escort_order_hunter"
        verbose_name = '订单打手'
        verbose_name_plural = verbose_name
        unique_together = ('order', 'hunter')
    
    def __str__(self):
        return f"{self.hunter.nickname} - {self.order.order_no}"


class Withdrawal(CoreModel):
    """提现申请"""
    
    # 提现状态
    STATUS_PENDING = 0      # 申请中
    STATUS_PROCESSING = 1   # 处理中
    STATUS_SUCCESS = 2      # 成功
    STATUS_FAILED = 3       # 失败
    
    STATUS_CHOICES = [
        (STATUS_PENDING, '申请中'),
        (STATUS_PROCESSING, '处理中'),
        (STATUS_SUCCESS, '成功'),
        (STATUS_FAILED, '失败'),
    ]
    
    user = models.ForeignKey(EscortUser, on_delete=models.CASCADE, verbose_name='用户', help_text='申请提现的用户')
    amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='提现金额', help_text='申请提现的金额')
    tax_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='个税金额', help_text='个人所得税金额')
    actual_amount = models.DecimalField(max_digits=10, decimal_places=2, default=0, verbose_name='实际到账', help_text='实际到账金额')
    status = models.IntegerField(choices=STATUS_CHOICES, default=STATUS_PENDING, verbose_name='提现状态', help_text='提现申请状态')
    
    # 微信支付相关
    payment_no = models.CharField(max_length=100, blank=True, null=True, verbose_name='支付单号', help_text='微信支付单号')
    payment_time = models.DateTimeField(blank=True, null=True, verbose_name='支付时间', help_text='微信支付时间')
    
    # 审核信息
    review_notes = models.TextField(blank=True, null=True, verbose_name='审核备注', help_text='审核备注信息')
    review_time = models.DateTimeField(blank=True, null=True, verbose_name='审核时间', help_text='审核时间')
    
    class Meta:
        db_table = table_prefix + "escort_withdrawal"
        verbose_name = '提现申请'
        verbose_name_plural = verbose_name
        ordering = ('-create_datetime',)
    
    def __str__(self):
        return f"{self.user.nickname} - ¥{self.amount} - {self.get_status_display()}"


class BuddyRelation(CoreModel):
    """搭子关系"""
    BUDDY_ACTIVE = 1
    BUDDY_DELETED = 2

    STATUS_CHOICES = [
        (BUDDY_ACTIVE, '活跃'),
        (BUDDY_DELETED, '已删除'),
    ]

    user_a = models.ForeignKey(EscortUser, on_delete=models.CASCADE, related_name='buddy_relations_a', verbose_name='用户A', help_text='搭子关系中的用户A')
    user_b = models.ForeignKey(EscortUser, on_delete=models.CASCADE, related_name='buddy_relations_b', verbose_name='用户B', help_text='搭子关系中的用户B')
    status = models.IntegerField(choices=STATUS_CHOICES, default=BUDDY_ACTIVE, verbose_name='状态', help_text='搭子关系状态')
    
    class Meta:
        db_table = table_prefix + "escort_buddy_relation"
        verbose_name = '搭子关系'
        verbose_name_plural = verbose_name
        unique_together = ('user_a', 'user_b')
    
    def __str__(self):
        return f"{self.user_a.nickname} ↔ {self.user_b.nickname}"


class ChatMessage(CoreModel):
    """订单聊天消息"""

    # 消息类型
    TYPE_TEXT = 1
    TYPE_SYSTEM = 2
    TYPE_IMAGE = 3

    TYPE_CHOICES = [
        (TYPE_TEXT, '文本消息'),
        (TYPE_SYSTEM, '系统消息'),
        (TYPE_IMAGE, '图片消息'),
    ]

    order = models.ForeignKey(
        Order, on_delete=models.CASCADE,
        related_name='chat_messages',
        verbose_name='订单',
        help_text='所属订单'
    )
    sender = models.ForeignKey(
        EscortUser, on_delete=models.CASCADE,
        verbose_name='发送者',
        help_text='消息发送者'
    )
    sender_type = models.CharField(
        max_length=20,
        verbose_name='发送者身份',
        help_text='customer=客户, hunter=打手, system=系统'
    )
    message_type = models.IntegerField(
        choices=TYPE_CHOICES, default=TYPE_TEXT,
        verbose_name='消息类型',
        help_text='文本/系统/图片'
    )
    content = models.TextField(verbose_name='消息内容', help_text='消息内容')
    image_url = models.CharField(max_length=500, blank=True, null=True, verbose_name='图片URL', help_text='图片消息URL')

    class Meta:
        db_table = table_prefix + "escort_chat_message"
        verbose_name = '订单聊天消息'
        verbose_name_plural = verbose_name
        ordering = ('create_datetime',)

    def __str__(self):
        return f"{self.order.order_no} - {self.sender_type}:{self.content[:20]}"


class OrderReview(CoreModel):
    """订单评价"""
    order = models.OneToOneField(Order, on_delete=models.CASCADE, verbose_name='订单', help_text='被评价的订单')
    customer = models.ForeignKey(EscortUser, on_delete=models.CASCADE, related_name='given_reviews', verbose_name='评价人', help_text='发表评价的客户')

    # 评价内容
    rating = models.IntegerField(verbose_name='评分', help_text='评分（1-5分）')
    content = models.TextField(verbose_name='评价内容', help_text='评价详细内容')
    is_anonymous = models.BooleanField(default=False, verbose_name='是否匿名', help_text='是否匿名评价')

    # 回复
    reply_content = models.TextField(blank=True, null=True, verbose_name='商家回复', help_text='商家回复内容')
    reply_time = models.DateTimeField(blank=True, null=True, verbose_name='回复时间', help_text='回复时间')

    class Meta:
        db_table = table_prefix + "escort_order_review"
        verbose_name = '订单评价'
        verbose_name_plural = verbose_name

    def __str__(self):
        return f"{self.order.order_no} - {self.rating}分"


class RefundRequest(CoreModel):
    """退款申请"""

    # 退款状态
    STATUS_PENDING = 0      # 待审核
    STATUS_APPROVED = 1     # 已通过（待退款）
    STATUS_REJECTED = 2     # 已拒绝
    STATUS_REFUNDING = 3    # 退款中
    STATUS_COMPLETED = 4    # 退款完成
    STATUS_FAILED = 5       # 退款失败

    STATUS_CHOICES = [
        (STATUS_PENDING, '待审核'),
        (STATUS_APPROVED, '已通过（待退款）'),
        (STATUS_REJECTED, '已拒绝'),
        (STATUS_REFUNDING, '退款中'),
        (STATUS_COMPLETED, '退款完成'),
        (STATUS_FAILED, '退款失败'),
    ]

    # 退款原因
    REASON_USER_CANCEL = 'user_cancel'       # 用户取消
    REASON_SERVICE_ISSUE = 'service_issue'  # 服务问题
    REASON_OTHER = 'other'                  # 其他原因

    REASON_CHOICES = [
        (REASON_USER_CANCEL, '用户取消'),
        (REASON_SERVICE_ISSUE, '服务问题'),
        (REASON_OTHER, '其他原因'),
    ]

    order = models.OneToOneField(
        Order, on_delete=models.CASCADE,
        related_name='refund_request',
        verbose_name='订单',
        help_text='关联的订单'
    )
    customer = models.ForeignKey(
        EscortUser, on_delete=models.CASCADE,
        related_name='refund_requests',
        verbose_name='申请人',
        help_text='申请退款的客户'
    )

    # 退款金额
    refund_amount = models.DecimalField(
        max_digits=10, decimal_places=2,
        verbose_name='申请退款金额',
        help_text='客户申请的退款金额'
    )
    actual_refund_amount = models.DecimalField(
        max_digits=10, decimal_places=2, default=0,
        verbose_name='实际退款金额',
        help_text='实际退款金额（可能与申请金额不同）'
    )

    # 退款原因
    reason_type = models.CharField(
        max_length=20, choices=REASON_CHOICES,
        default=REASON_USER_CANCEL,
        verbose_name='退款原因类型',
        help_text='退款原因类型'
    )
    reason_detail = models.TextField(
        blank=True, null=True,
        verbose_name='退款详细说明',
        help_text='客户填写的退款详细说明'
    )

    # 退款状态
    status = models.IntegerField(
        choices=STATUS_CHOICES, default=STATUS_PENDING,
        verbose_name='退款状态',
        help_text='退款申请状态'
    )

    # 申退前订单状态（用于拒绝时还原订单状态）
    previous_order_status = models.IntegerField(
        blank=True, null=True,
        verbose_name='申退前订单状态',
        help_text='申请退款前订单的状态值，用于拒绝退款时还原'
    )

    # 微信退款相关
    refund_no = models.CharField(
        max_length=100, blank=True, null=True,
        verbose_name='微信退款单号',
        help_text='微信退款单号'
    )
    refund_time = models.DateTimeField(
        blank=True, null=True,
        verbose_name='退款完成时间',
        help_text='微信退款完成时间'
    )

    # 审核信息
    reviewer_id = models.IntegerField(
        blank=True, null=True,
        verbose_name='审核人ID',
        help_text='审核退款的管理员ID'
    )
    reviewer_name = models.CharField(
        max_length=100, blank=True, null=True,
        verbose_name='审核人',
        help_text='审核退款的管理员名称'
    )
    review_notes = models.TextField(
        blank=True, null=True,
        verbose_name='审核备注',
        help_text='审核备注信息'
    )
    review_time = models.DateTimeField(
        blank=True, null=True,
        verbose_name='审核时间',
        help_text='审核时间'
    )

    class Meta:
        db_table = table_prefix + "escort_refund_request"
        verbose_name = '退款申请'
        verbose_name_plural = verbose_name
        ordering = ('-create_datetime',)

    def __str__(self):
        return f"{self.order.order_no} - ¥{self.refund_amount} - {self.get_status_display()}"