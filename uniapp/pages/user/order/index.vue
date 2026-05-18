<template>
  <view class="page">
    <custom-navbar title="我的订单" />

    <view class="status-tabs" :style="{ top: '176rpx' }">
      <view
        v-for="(tab, idx) in statusTabs"
        :key="idx"
        class="status-tab"
        :class="{ active: currentStatus === tab.value }"
        @click="switchTab(tab.value)"
      >
        <text>{{ tab.label }}</text>
        <view v-if="currentStatus === tab.value" class="tab-line"></view>
      </view>
    </view>

    <scroll-view scroll-y class="content" :style="{ top: '264rpx', bottom: tabBarBottom + 'px' }" @scrolltolower="loadMore"
      refresher-enabled :refresher-triggered="refreshing" @refresherrefresh="onRefresh">
      <view v-if="loading && orders.length === 0" class="loading-wrap">
        <view class="loading-dot"></view>
        <text class="loading-text">加载中...</text>
      </view>
      <view v-else-if="orders.length === 0" class="empty-wrap">
        <text class="empty-icon">📋</text>
        <text class="empty-text">暂无相关订单</text>
      </view>
      <view v-else class="order-list">
        <view v-for="item in orders" :key="item.id" class="order-card" @click="goDetail(item.id)">
          <view class="order-header">
            <text class="order-no">#{{ item.order_no }}</text>
            <text class="order-status" :class="'status-' + item.status">{{ getStatusText(item) }}</text>
          </view>
          <view class="order-service-row">
            <image v-if="item.service && item.service.images && item.service.images.length > 0"
              :src="getImageUrl(item.service.images[0].image)"
              class="order-service-img" mode="aspectFill" />
            <view class="order-service-info">
              <text class="service-name">{{ item.service ? item.service_name : '服务' }}</text>
              <text class="service-cat">{{ item.service ? (item.service.category_name || '') : '' }}</text>
            </view>
            <text class="order-price">¥{{ item.total_amount }}</text>
          </view>
          <view class="order-game-row">
            <text class="game-info">🎮 {{ item.game_account || '-' }} · {{ item.game_server || '-' }}</text>
            <text class="order-time">{{ formatTime(item.create_datetime) }}</text>
          </view>
          <view v-if="item.status === 0 || item.status === 5 || item.status === 6" class="order-footer">
            <view v-if="item.status === 0 && getRemainingSeconds(item) > 0" class="countdown-tag">
              <text class="countdown-text">{{ formatCountdown(getRemainingSeconds(item)) }}</text>
            </view>
            <view class="order-actions">
              <text v-if="item.status === 0" class="action-btn pay-btn" @click.stop="goPay(item.id)">去支付</text>
              <text v-if="item.status === 5" class="action-btn confirm-btn" @click.stop="confirmOrder(item.id)">确认完成</text>
              <text v-if="item.status === 6" class="action-btn review-btn" @click.stop="goReview(item.id)">去评价</text>
            </view>
          </view>
        </view>
      </view>
      <view v-if="loading && orders.length > 0" class="load-more"><text class="load-more-text">加载中...</text></view>
      <view v-if="noMore && orders.length > 0" class="no-more"><text class="no-more-text">— 没有更多了 —</text></view>
      <view style="height: 40rpx;"></view>
    </scroll-view>

    <custom-tabbar ref="tabbar" @tabbarReady="onTabbarReady" />
  </view>
</template>

<script>
import customNavbar from '@/components/custom-navbar/custom-navbar.vue'
import customTabbar from '@/components/custom-tabbar/custom-tabbar.vue'
import { ORDER_API } from '@/config/api.js'
import { get } from '@/utils/request.js'
import { getImageUrl, formatTime } from '@/utils/common.js'

export default {
  components: { customNavbar, customTabbar },
  data() {
    return {
      tabBarBottom: 0,
      currentStatus: null,
      orders: [],
      loading: false,
      refreshing: false,
      page: 1,
      noMore: false,
      PAGE_SIZE: 10,
      refreshTimer: null,
      statusTabs: [
        { label: '全部', value: null },
        { label: '待支付', value: 0 },
        { label: '待接单', value: 1 },
        { label: '服务中', value: 4 },
        { label: '待确认', value: 5 },
        { label: '已完成', value: 6 },
      ],
    }
  },

  onLoad() {
    this.fetchOrders(true)
    this.startRefreshTimer()
  },

  onShow() {
    this.fetchOrders(true)
  },

  onUnload() {
    this.clearRefreshTimer()
  },

  methods: {
    getImageUrl,
    formatTime,

    onTabbarReady(bottomHeight) {
      this.tabBarBottom = bottomHeight
    },

    startRefreshTimer() {
      this.clearRefreshTimer()
      // 每30秒自动刷新待支付订单
      this.refreshTimer = setInterval(() => {
        if (this.currentStatus === 0 || this.currentStatus === null) {
          this.fetchOrders(true)
        }
      }, 30000)
    },

    clearRefreshTimer() {
      if (this.refreshTimer) {
        clearInterval(this.refreshTimer)
        this.refreshTimer = null
      }
    },

    async onRefresh() {
      this.refreshing = true
      await this.fetchOrders(true)
      this.refreshing = false
    },

    switchTab(val) {
      this.currentStatus = this.currentStatus === val ? null : val
      this.orders = []
      this.page = 1
      this.noMore = false
      this.fetchOrders(true)
    },

    async fetchOrders(reset) {
      if (this.loading) return
      if (reset) { this.page = 1; this.noMore = false }
      this.loading = true
      try {
        const params = { page: this.page, page_size: this.PAGE_SIZE }
        if (this.currentStatus !== null) params.status = this.currentStatus
        const res = await get(ORDER_API.customerOrders, params)
        // 后端返回格式: {code: 2000, data: [...], page: 1, total: 100}
        let results = Array.isArray(res) ? res : (res && res.data) || []
        if (!reset) results = this.orders.concat(results)
        this.orders = results
        if (reset) this.page++
        // is_next 为 true 表示还有下一页
        this.noMore = !res || !res.is_next
      } finally {
        this.loading = false
      }
    },

    loadMore() {
      if (!this.noMore && !this.loading) { this.page++; this.fetchOrders(false) }
    },

    goDetail(id) {
      uni.navigateTo({ url: `/pages/user/order/detail?id=${id}` })
    },

    goPay(id) { this.goDetail(id) },
    confirmOrder(id) { this.goDetail(id) },
    goReview(id) { uni.navigateTo({ url: `/pages/user/order/review?id=${id}` }) },

    getStatusText(item) {
      const status = typeof item === 'number' ? item : item.status
      const cancelReason = typeof item === 'object' ? item.cancel_reason : null
      const map = {
        0: '待支付',
        1: '待接单',
        2: '已接单',
        3: '等待搭子',
        4: '服务中',
        5: '待确认',
        6: '已完成',
        7: '已评价',
        8: '已取消',
        9: '退款中',
        10: '已退款'
      }
      if (status === 8 && cancelReason === 'timeout') {
        return '超时取消'
      }
      return map[status] || '未知'
    },

    getRemainingSeconds(item) {
      if (item.status !== 0) return 0
      return item.remaining_seconds || 0
    },

    formatCountdown(seconds) {
      if (seconds <= 0) return '已超时'
      const m = Math.floor(seconds / 60)
      const s = seconds % 60
      return `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`
    },

    formatTime(time) {
      if (!time) return ''
      return time.slice(0, 16).replace('T', ' ')
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; width: 100%; background: #F5F5F5; box-sizing: border-box; }

.status-tabs {
  position: fixed; left: 0; right: 0; height: 88rpx;
  background: #FFFFFF;
  display: flex; align-items: center; z-index: 99;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.08);
}
.status-tab {
  flex: 1; display: flex; flex-direction: column; align-items: center;
  justify-content: center; height: 100%; position: relative;
}
.status-tab text { font-size: 26rpx; color: #666666; }
.status-tab.active text { color: #00B4D8; font-weight: 600; }
.tab-line {
  position: absolute; bottom: 4rpx; left: 50%; transform: translateX(-50%);
  width: 32rpx; height: 3rpx; border-radius: 2rpx; background: #00B4D8;
}

.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.order-list { padding: 20rpx 24rpx; display: flex; flex-direction: column; gap: 20rpx; }
.order-card { border-radius: 20rpx; padding: 24rpx; background: #FFFFFF; border: 1rpx solid #E8E8E8; box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05); width: 100%; box-sizing: border-box; }
.order-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20rpx; }
.order-no { font-size: 24rpx; color: #999999; }
.order-status { font-size: 24rpx; font-weight: 600; padding: 4rpx 16rpx; border-radius: 12rpx; }
.status-0 { color: #FF9800; background: rgba(255, 152, 0, 0.1); }
.status-1 { color: #00B4D8; background: rgba(0, 180, 216, 0.1); }
.status-2 { color: #9C27B0; background: rgba(156, 39, 176, 0.1); }
.status-3 { color: #FF9800; background: rgba(255, 152, 0, 0.1); }
.status-4 { color: #9D4EDD; background: rgba(157, 78, 221, 0.1); }
.status-5 { color: #E91E63; background: rgba(233, 30, 99, 0.1); }
.status-6 { color: #00C853; background: rgba(0, 200, 83, 0.1); }
.status-8 { color: #999999; background: rgba(153, 153, 153, 0.1); }
.status-9 { color: #FF5722; background: rgba(255, 87, 34, 0.1); }
.status-10 { color: #607D8B; background: rgba(96, 125, 139, 0.1); }

.order-service-row { display: flex; gap: 16rpx; margin-bottom: 16rpx; align-items: center; }
.order-service-img { width: 120rpx; height: 120rpx; border-radius: 12rpx; background: #F0F0F0; flex-shrink: 0; }
.order-service-info { flex: 1; display: flex; flex-direction: column; gap: 6rpx; }
.service-name { font-size: 28rpx; font-weight: 600; color: #1A1A1A; }
.service-cat { font-size: 22rpx; color: #999999; }
.order-price { font-size: 36rpx; font-weight: 700; color: #FF3366; }

.order-game-row { display: flex; justify-content: space-between; align-items: center; padding: 16rpx 0; border-top: 1rpx dashed #F0F0F0; border-bottom: 1rpx dashed #F0F0F0; margin-bottom: 16rpx; }
.game-info { font-size: 24rpx; color: #666666; }
.order-time { font-size: 22rpx; color: #999999; }

.order-footer { display: flex; justify-content: flex-end; align-items: center; gap: 12rpx; }
.order-actions { display: flex; gap: 12rpx; }
.countdown-tag { background: linear-gradient(135deg, rgba(255, 152, 0, 0.15), rgba(255, 87, 34, 0.15)); border-radius: 8rpx; padding: 6rpx 16rpx; }
.countdown-text { font-size: 22rpx; color: #FF5722; font-weight: 600; font-family: monospace; }
.action-btn { font-size: 24rpx; padding: 8rpx 24rpx; border-radius: 24rpx; font-weight: 600; }
.pay-btn { background: linear-gradient(135deg, #FF3366, #FF9800); color: #fff; }
.confirm-btn { background: linear-gradient(135deg, #00B4D8, #00C853); color: #fff; }
.review-btn { background: rgba(0, 180, 216, 0.1); color: #00B4D8; border: 1rpx solid rgba(0, 180, 216, 0.3); }

.loading-wrap, .empty-wrap { display: flex; flex-direction: column; align-items: center; padding: 160rpx 0; gap: 16rpx; }
.loading-dot { width: 40rpx; height: 40rpx; border: 4rpx solid rgba(0, 180, 216, 0.2); border-top-color: #00B4D8; border-radius: 50%; animation: spin 0.8s linear infinite; }
@keyframes spin { to { transform: rotate(360deg); } }
.loading-text, .empty-text { font-size: 26rpx; color: #999999; }
.empty-icon { font-size: 80rpx; }
.load-more, .no-more { text-align: center; padding: 30rpx; }
.load-more-text, .no-more-text { font-size: 24rpx; color: #999999; }
</style>
