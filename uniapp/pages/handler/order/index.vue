<template>
  <view class="page">
    <custom-navbar title="我的接单" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabbarHeight + 'px' }" @scrolltolower="loadMore">
      <view v-if="loading && orders.length === 0" class="loading-wrap"><view class="loading-dot"></view><text class="loading-text">加载中...</text></view>
      <view v-else-if="orders.length === 0" class="empty-wrap"><text class="empty-icon">📋</text><text class="empty-text">暂无已接订单</text></view>
      <view v-else class="order-list">
        <view v-for="item in orders" :key="item.id" class="order-card" @click="goDetail(item.id)">
          <view class="order-header">
            <text class="order-no">#{{ item.order_no }}</text>
            <text class="order-status" :class="'s-' + item.status">{{ getStatusText(item) }}</text>
          </view>
          <view class="order-info">
            <text class="service-name">{{ item.service ? item.service.name : '服务' }}</text>
            <text class="order-time">{{ formatTime(item.create_datetime) }}</text>
          </view>
          <view class="order-footer">
            <text class="order-share">分成 ¥{{ item.hunter_share || '0.00' }}</text>
            <text v-if="item.status === 4" class="complete-btn" @click.stop="completeOrder(item.id)">完成服务</text>
          </view>
        </view>
      </view>
      <view v-if="noMore && orders.length > 0" class="no-more"><text class="no-more-text">— 没有更多了 —</text></view>
      <view style="height: 40rpx;"></view>
    </scroll-view>

    <custom-tabbar ref="tabbar" />
  </view>
</template>

<script>
import { ORDER_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { showToast } from '@/utils/common.js'

export default {
  data() {
    return {
      tabbarHeight: 180,
      orders: [], loading: false, page: 1, noMore: false, PAGE_SIZE: 10,
    }
  },

  onLoad() {
    this.fetchOrders(true)
  },

  methods: {
    async fetchOrders(reset) {
      if (this.loading) return
      if (reset) { this.page = 1; this.noMore = false }
      this.loading = true
      try {
        const res = await get(ORDER_API.my, { page: this.page, page_size: this.PAGE_SIZE })
        const results = Array.isArray(res) ? res : (res && res.results) || []
        this.orders = reset ? results : this.orders.concat(results)
        if (!reset && results.length > 0) this.page++
        this.noMore = !res || !res.next
      } finally { this.loading = false }
    },

    loadMore() { if (!this.noMore && !this.loading) { this.page++; this.fetchOrders(false) } },

    goDetail(id) { uni.navigateTo({ url: `/pages/handler/order/detail?id=${id}` }) },

    completeOrder(id) {
      uni.showModal({ title: '确认', content: '确认服务已完成？', success: async (m) => {
        if (!m.confirm) return
        try {
          await post(ORDER_API.hunterComplete(id))
          showToast('操作成功', 'success')
          this.fetchOrders(true)
        } catch (e) { showToast('操作失败') }
      }})
    },

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
        8: '已取消'
      }
      if (status === 8 && cancelReason === 'timeout') {
        return '超时取消'
      }
      return map[status] || '未知'
    },
    formatTime(t) { return t ? t.slice(0, 16).replace('T', ' ') : '' },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; background: #F5F5F5; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }
.order-list { padding: 20rpx 24rpx; display: flex; flex-direction: column; gap: 20rpx; }
.order-card { background: #FFFFFF; border: 1rpx solid #E8E8E8; border-radius: 20rpx; padding: 24rpx; box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05); }
.order-header { display: flex; justify-content: space-between; margin-bottom: 12rpx; }
.order-no { font-size: 24rpx; color: #999999; }
.order-status { font-size: 24rpx; padding: 4rpx 16rpx; border-radius: 12rpx; }
.s-2 { color: #00B4D8; background: rgba(0,180,216,0.1); }
.s-4 { color: #9D4EDD; background: rgba(157,92,246,0.1); }
.s-6 { color: #00C853; background: rgba(0,200,83,0.1); }
.order-info { display: flex; justify-content: space-between; margin-bottom: 12rpx; }
.service-name { font-size: 28rpx; font-weight: 600; color: #1A1A1A; }
.order-time { font-size: 22rpx; color: #999999; }
.order-footer { display: flex; justify-content: space-between; align-items: center; padding-top: 12rpx; border-top: 1rpx solid #F0F0F0; }
.order-share { font-size: 32rpx; font-weight: 700; color: #00B4D8; }
.complete-btn { font-size: 24rpx; padding: 8rpx 24rpx; border-radius: 20rpx; background: linear-gradient(135deg, #00B4D8, #00C853); color: #FFFFFF; font-weight: 600; }
.loading-wrap, .empty-wrap { display: flex; flex-direction: column; align-items: center; padding: 160rpx 0; gap: 16rpx; }
.loading-dot { width: 40rpx; height: 40rpx; border: 4rpx solid rgba(0,180,216,0.2); border-top-color: #00B4D8; border-radius: 50%; animation: spin 0.8s linear infinite; }
@keyframes spin { to { transform: rotate(360deg); } }
.loading-text, .empty-text { font-size: 26rpx; color: #999999; }
.empty-icon { font-size: 80rpx; }
.no-more { text-align: center; padding: 30rpx; }
.no-more-text { font-size: 24rpx; color: #999999; }
</style>
