<template>
  <view class="page">
    <custom-navbar title="退款记录" :showBack="true" />

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
      <view v-if="loading && refundList.length === 0" class="loading-wrap">
        <view class="loading-dot"></view>
        <text class="loading-text">加载中...</text>
      </view>
      <view v-else-if="refundList.length === 0" class="empty-wrap">
        <text class="empty-icon">💰</text>
        <text class="empty-text">暂无退款记录</text>
      </view>
      <view v-else class="refund-list">
        <view v-for="item in refundList" :key="item.id" class="refund-card">
          <view class="refund-header">
            <text class="order-no">#{{ item.order_no }}</text>
            <text class="refund-status" :class="'status-' + item.status">{{ item.status_display }}</text>
          </view>

          <view class="service-row">
            <text class="service-name">{{ item.service_name || '服务' }}</text>
          </view>

          <view class="amount-row">
            <text class="amount-label">退款金额</text>
            <text class="amount-value">¥{{ item.actual_refund_amount || item.refund_amount }}</text>
          </view>

          <view class="refund-info-row">
            <text class="info-label">退款原因</text>
            <text class="info-value">{{ item.reason_type_display }}</text>
          </view>

          <view v-if="item.reason_detail" class="refund-info-row">
            <text class="info-label">详细说明</text>
            <text class="info-value">{{ item.reason_detail }}</text>
          </view>

          <view v-if="item.refund_no" class="refund-info-row">
            <text class="info-label">退款单号</text>
            <text class="info-value">{{ item.refund_no }}</text>
          </view>

          <view v-if="item.review_notes" class="refund-info-row">
            <text class="info-label">审核备注</text>
            <text class="info-value">{{ item.review_notes }}</text>
          </view>

          <view class="time-row">
            <text class="time-label">申请时间</text>
            <text class="time-value">{{ formatTime(item.create_datetime) }}</text>
          </view>

          <!-- 退款进度提示 -->
          <view v-if="item.status === 0" class="progress-tip pending">
            <text>等待客服审核中...</text>
          </view>
          <view v-if="item.status === 1" class="progress-tip approved">
            <text>已通过审核，即将退款...</text>
          </view>
          <view v-if="item.status === 3" class="progress-tip refunding">
            <text>退款处理中，请耐心等待...</text>
          </view>
          <view v-if="item.status === 4" class="progress-tip completed">
            <text>退款已完成</text>
          </view>
          <view v-if="item.status === 2" class="progress-tip rejected">
            <text>退款申请被拒绝：{{ item.review_notes || '未知原因' }}</text>
          </view>
          <view v-if="item.status === 5" class="progress-tip failed">
            <text>退款失败，请联系客服</text>
          </view>
        </view>
      </view>
      <view v-if="loading && refundList.length > 0" class="load-more"><text class="load-more-text">加载中...</text></view>
      <view v-if="!loading && hasMore" class="load-more" @click="loadMore"><text class="load-more-text">加载更多</text></view>
    </scroll-view>

    <custom-tabbar ref="tabbar" />
  </view>
</template>

<script>
import { REFUND_API } from '@/config/api.js'
import { get } from '@/utils/request.js'
import { formatTime } from '@/utils/common.js'

export default {
  data() {
    return {
      tabBarBottom: 180,
      currentStatus: -1, // -1 表示全部
      statusTabs: [
        { label: '全部', value: -1 },
        { label: '待审核', value: 0 },
        { label: '退款中', value: 3 },
        { label: '已完成', value: 4 },
      ],
      refundList: [],
      page: 1,
      pageSize: 10,
      hasMore: false,
      loading: false,
      refreshing: false,
    }
  },

  onLoad() {
    this.loadRefundList()
  },

  onShow() {
    if (this.$refs.tabbar) {
      const query = uni.createSelectorQuery().in(this).select('.page')
      if (query) {
        query.boundingClientRect((rect) => {
          if (rect) this.tabBarBottom = 180
        }).exec()
      }
    }
  },

  methods: {
    formatTime(t) {
      if (!t) return '-'
      return t.slice(0, 16).replace('T', ' ')
    },

    switchTab(status) {
      this.currentStatus = status
      this.page = 1
      this.refundList = []
      this.loadRefundList()
    },

    async onRefresh() {
      this.refreshing = true
      this.page = 1
      await this.loadRefundList()
      this.refreshing = false
    },

    async loadRefundList() {
      if (this.loading) return
      this.loading = true
      try {
        const params = {
          page: this.page,
          page_size: this.pageSize,
        }
        if (this.currentStatus !== -1) {
          params.status = this.currentStatus
        }
        const res = await get(REFUND_API.my, params)
        const list = res.results || res.data || []
        if (this.page === 1) {
          this.refundList = list
        } else {
          this.refundList = [...this.refundList, ...list]
        }
        this.hasMore = list.length >= this.pageSize
      } catch (e) {
        console.error('加载退款记录失败:', e)
      } finally {
        this.loading = false
      }
    },

    loadMore() {
      if (!this.hasMore || this.loading) return
      this.page++
      this.loadRefundList()
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; width: 100%; background: #F5F5F5; box-sizing: border-box; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.loading-wrap { display: flex; flex-direction: column; align-items: center; padding: 200rpx 0; gap: 16rpx; }
.loading-dot { width: 48rpx; height: 48rpx; border: 4rpx solid rgba(0, 180, 216, 0.2); border-top-color: #00B4D8; border-radius: 50%; animation: spin 0.8s linear infinite; }
@keyframes spin { to { transform: rotate(360deg); } }
.loading-text { font-size: 26rpx; color: #999999; }

.empty-wrap { display: flex; flex-direction: column; align-items: center; padding: 200rpx 0; gap: 24rpx; }
.empty-icon { font-size: 120rpx; }
.empty-text { font-size: 28rpx; color: #999999; }

.status-tabs {
  position: fixed; left: 0; right: 0; z-index: 99;
  background: #FFFFFF; display: flex;
  border-bottom: 1rpx solid #F0F0F0;
}
.status-tab { flex: 1; display: flex; flex-direction: column; align-items: center; padding: 24rpx 0; position: relative; }
.status-tab text { font-size: 28rpx; color: #999999; font-weight: 500; transition: all 0.2s; }
.status-tab.active text { color: #FF4D4F; font-weight: 700; }
.tab-line { position: absolute; bottom: 0; width: 48rpx; height: 6rpx; background: #FF4D4F; border-radius: 3rpx; }

.refund-list { padding: 20rpx 24rpx; display: flex; flex-direction: column; gap: 20rpx; }
.refund-card {
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; padding: 24rpx;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05);
}

.refund-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20rpx; }
.order-no { font-size: 26rpx; color: #666666; }
.refund-status { font-size: 26rpx; font-weight: 700; padding: 4rpx 16rpx; border-radius: 20rpx; }
.status-0 { color: #FA8C16; background: #FFF9E6; }
.status-1 { color: #1890FF; background: #E6F4FF; }
.status-2 { color: #FF4D4F; background: #FFF1F0; }
.status-3 { color: #FA8C16; background: #FFF9E6; }
.status-4 { color: #52C41A; background: #F6FFED; }
.status-5 { color: #FF4D4F; background: #FFF1F0; }

.service-row { margin-bottom: 16rpx; }
.service-name { font-size: 30rpx; font-weight: 700; color: #1A1A1A; }

.amount-row { display: flex; justify-content: space-between; align-items: center; padding: 16rpx 0; border-top: 1rpx solid #F0F0F0; border-bottom: 1rpx solid #F0F0F0; margin-bottom: 16rpx; }
.amount-label { font-size: 26rpx; color: #666666; }
.amount-value { font-size: 40rpx; font-weight: 700; color: #FF4D4F; }

.refund-info-row { display: flex; justify-content: space-between; padding: 8rpx 0; }
.info-label { font-size: 24rpx; color: #999999; flex-shrink: 0; }
.info-value { font-size: 24rpx; color: #1A1A1A; text-align: right; flex: 1; margin-left: 16rpx; }

.time-row { display: flex; justify-content: space-between; padding: 12rpx 0 0; margin-top: 12rpx; border-top: 1rpx solid #F0F0F0; }
.time-label { font-size: 24rpx; color: #999999; }
.time-value { font-size: 24rpx; color: #666666; }

.progress-tip {
  margin-top: 16rpx; padding: 16rpx 20rpx; border-radius: 12rpx;
  font-size: 24rpx; text-align: center;
}
.progress-tip.pending { background: #FFF9E6; color: #FA8C16; }
.progress-tip.approved { background: #E6F4FF; color: #1890FF; }
.progress-tip.refunding { background: #FFF9E6; color: #FA8C16; }
.progress-tip.completed { background: #F6FFED; color: #52C41A; }
.progress-tip.rejected { background: #FFF1F0; color: #FF4D4F; }
.progress-tip.failed { background: #FFF1F0; color: #FF4D4F; }

.load-more { display: flex; justify-content: center; padding: 32rpx 0; }
.load-more-text { font-size: 26rpx; color: #999999; }
</style>
