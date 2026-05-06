<template>
  <view class="page">
    <custom-navbar title="订单详情" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabbarHeight + 'px' }"
      refresher-enabled :refresher-triggered="refreshing" @refresherrefresh="onRefresh">
      <view v-if="loading" class="loading-wrap"><view class="loading-dot"></view></view>
      <view v-else-if="order" class="detail-wrap">
        <view class="status-card">
          <text class="status-text" :class="'s-' + order.status">{{ getStatusText(order.status) }}</text>
          <text class="status-desc">{{ getStatusDesc(order.status) }}</text>
          <view v-if="order.status === 0 && remainingSeconds > 0" class="countdown-wrap">
            <text class="countdown-label">剩余支付时间</text>
            <text class="countdown-time">{{ countdownText }}</text>
          </view>
        </view>

        <view class="card">
          <text class="card-title">服务信息</text>
          <view class="service-row">
            <image v-if="order.service && order.service.images && order.service.images.length > 0"
              :src="getImageUrl(order.service.images[0].image)"
              class="service-img" mode="aspectFill" />
            <view class="service-info">
              <text class="service-name">{{ order.service ? order.service.name : '服务' }}</text>
              <text class="service-cat">{{ order.service ? (order.service.category_name || '') : '' }}</text>
              <text class="service-price">¥{{ order.total_amount }}</text>
            </view>
          </view>
        </view>

        <view class="card">
          <text class="card-title">游戏信息</text>
          <view class="info-row"><text class="info-label">游戏账号</text><text class="info-value">{{ order.game_account || '-' }}</text></view>
          <view class="info-row"><text class="info-label">服务器</text><text class="info-value">{{ order.game_server || '-' }}</text></view>
          <view v-if="order.game_mode" class="info-row"><text class="info-label">游戏模式</text><text class="info-value">{{ order.game_mode }}</text></view>
          <view v-if="order.special_requirements" class="info-row"><text class="info-label">特殊要求</text><text class="info-value">{{ order.special_requirements }}</text></view>
        </view>

        <view class="card">
          <text class="card-title">订单信息</text>
          <view class="info-row"><text class="info-label">订单编号</text><text class="info-value">{{ order.order_no }}</text></view>
          <view class="info-row"><text class="info-label">下单时间</text><text class="info-value">{{ formatTime(order.create_datetime) }}</text></view>
          <view v-if="order.pay_time" class="info-row"><text class="info-label">支付时间</text><text class="info-value">{{ formatTime(order.pay_time) }}</text></view>
        </view>

        <view class="action-area">
          <text v-if="order.status === 0" class="btn-cancel" @click="cancelOrder">取消订单</text>
          <text v-if="order.status === 0" class="btn-primary" @click="handlePay">立即支付 ¥{{ order.total_amount }}</text>
          <text v-if="order.status === 4" class="btn-primary" @click="confirmServiceDone">确认服务完成</text>
          <text v-if="order.status === 5" class="btn-primary" @click="confirmComplete">最终确认并结算</text>
          <text v-if="order.status === 6" class="btn-review" @click="goReview">去评价</text>
        </view>
      </view>
      <view style="height: 40rpx;"></view>
    </scroll-view>

    <custom-tabbar ref="tabbar" />
  </view>
</template>

<script>
import { ORDER_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { showToast, getImageUrl, formatTime } from '@/utils/common.js'

export default {
  data() {
    return {
      tabbarHeight: 180,
      orderId: null, order: null, loading: false, refreshing: false,
      remainingSeconds: 0,
      countdownTimer: null,
    }
  },

  computed: {
    countdownText() {
      const s = this.remainingSeconds
      if (s <= 0) return '00:00'
      const m = Math.floor(s / 60)
      const sec = s % 60
      return `${String(m).padStart(2, '0')}:${String(sec).padStart(2, '0')}`
    }
  },

  onLoad(opts) {
    console.log('[ORDER] onLoad, opts:', opts)
    this.orderId = opts.id
    this.loadOrder()
  },

  onUnshow() {
    this.clearCountdown()
  },

  onUnload() {
    this.clearCountdown()
  },

  methods: {
    getImageUrl,
    formatTime,

    async onRefresh() {
      this.refreshing = true
      await this.loadOrder()
      this.refreshing = false
    },

    clearCountdown() {
      if (this.countdownTimer) {
        clearInterval(this.countdownTimer)
        this.countdownTimer = null
      }
    },

    startCountdown() {
      this.clearCountdown()
      if (!this.order || this.order.status !== 0) return
      this.remainingSeconds = this.order.remaining_seconds || 0
      this.countdownTimer = setInterval(() => {
        if (this.remainingSeconds > 0) {
          this.remainingSeconds--
          if (this.remainingSeconds <= 0) {
            this.clearCountdown()
            this.loadOrder()
          }
        }
      }, 1000)
    },

    async loadOrder() {
      console.log('[ORDER] loadOrder, orderId:', this.orderId)
      this.loading = true
      try {
        this.order = await get(ORDER_API.detail(this.orderId))
        console.log('[ORDER] 订单加载完成, status:', this.order?.status, 'order_no:', this.order?.order_no, 'remaining_seconds:', this.order?.remaining_seconds)
        if (this.order && this.order.status === 0) {
          this.startCountdown()
        }
      } finally { this.loading = false }
    },

    async handlePay() {
      console.log('[PAY] 开始支付流程, order_no:', this.order.order_no)
      uni.showLoading({ title: '正在调起支付...' })
      try {
        console.log('[PAY] 调用 wx_pay 接口...')
        const res = await post(ORDER_API.wxPay, { order_no: this.order.order_no })
        console.log('[PAY] wx_pay 返回:', res)
        if (!res.payParams) {
          console.log('[PAY] 错误: payParams 为空')
          uni.hideLoading()
          showToast('支付参数异常')
          return
        }
        
        console.log('[PAY] 调起微信支付, 参数:', res.payParams)
        await uni.requestPayment({
          provider: 'wxpay',
          ...res.payParams,
        })
        console.log('[PAY] uni.requestPayment 完成')
        
        // 支付完成后，主动查询微信确认支付状态
        uni.showLoading({ title: '确认支付结果...' })
        try {
          console.log('[PAY] 调用 query_payment_status 查询支付状态...')
          const queryRes = await get(ORDER_API.queryPaymentStatus(this.order.order_no))
          console.log('[PAY] query_payment_status 返回:', queryRes)
          if (queryRes.is_paid) {
            showToast('支付成功', 'success')
          } else {
            showToast('支付结果待确认，请稍后刷新页面查看')
          }
        } catch (queryErr) {
          console.error('[PAY] 查询支付状态失败:', queryErr)
          showToast('支付结果待确认，请稍后刷新页面查看')
        } finally {
          uni.hideLoading()
        }
        this.loadOrder()
        
      } catch (e) {
        console.error('[PAY] 支付异常:', e)
        showToast('支付失败: ' + (e.msg || e.message || '未知错误'))
      } finally {
        uni.hideLoading()
      }
    },

    cancelOrder() {
      uni.showModal({
        title: '确认取消', content: '确定要取消该订单吗？',
        success: async (res) => {
          if (!res.confirm) return
          try {
            await post(ORDER_API.cancel(this.orderId))
            showToast('已取消', 'success')
            this.loadOrder()
          } catch (e) { showToast('取消失败') }
        },
      })
    },

    confirmServiceDone() {
      uni.showModal({
        title: '确认服务完成', content: '陪玩已打完，请确认服务是否达标？',
        success: async (res) => {
          if (!res.confirm) return
          try {
            await post(ORDER_API.confirmServiceDone(this.orderId))
            showToast('已确认，请等待最终结算', 'success')
            this.loadOrder()
          } catch (e) { showToast(e.msg || '操作失败') }
        },
      })
    },

    confirmComplete() {
      uni.showModal({
        title: '最终确认', content: '确认后收益将直接打入打手账户，确定吗？',
        success: async (res) => {
          if (!res.confirm) return
          try {
            await post(ORDER_API.confirmComplete(this.orderId))
            showToast('订单完成，收益已结算', 'success')
            this.loadOrder()
          } catch (e) { showToast(e.msg || '操作失败') }
        },
      })
    },

    goReview() { uni.navigateTo({ url: `/pages/user/order/review?id=${this.orderId}` }) },

    getStatusText(s) {
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
      // 已取消订单，根据取消原因显示不同文案
      if (s === 8 && this.order && this.order.cancel_reason === 'timeout') {
        return '超时取消'
      }
      return map[s] || '未知'
    },
    getStatusDesc(s) {
      const map = {
        0: '请尽快完成支付',
        1: '等待陪玩达人接单，请耐心等候',
        5: '陪玩已完成，请确认服务是否达标',
        6: '服务已完成，欢迎评价',
      }
      // 待支付状态且已超时
      if (s === 0 && this.order && this.order.is_expired) {
        return '订单已超时，请刷新页面'
      }
      return map[s] || ''
    },
    formatTime(t) { return t ? t.slice(0, 16).replace('T', ' ') : '-' },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; width: 100%; background: #F5F5F5; box-sizing: border-box; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.loading-wrap { display: flex; justify-content: center; padding: 200rpx 0; }
.loading-dot { width: 48rpx; height: 48rpx; border: 4rpx solid rgba(0, 180, 216, 0.2); border-top-color: #00B4D8; border-radius: 50%; animation: spin 0.8s linear infinite; }
@keyframes spin { to { transform: rotate(360deg); } }

.detail-wrap { padding: 20rpx 24rpx; }
.status-card {
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; padding: 32rpx 24rpx; margin-bottom: 20rpx;
  display: flex; flex-direction: column; align-items: center; gap: 8rpx;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05); width: 100%; box-sizing: border-box;
}
.status-text { font-size: 40rpx; font-weight: 700; }
.s-0 { color: #FF9800; }
.s-1 { color: #00B4D8; }
.s-4, .s-5 { color: #9D4EDD; }
.s-6 { color: #00C853; }
.s-7 { color: #FF3366; }
.s-8 { color: #999999; }
.status-desc { font-size: 24rpx; color: #666666; text-align: center; }

.countdown-wrap { display: flex; flex-direction: column; align-items: center; margin-top: 12rpx; padding: 16rpx 32rpx; background: linear-gradient(135deg, rgba(255, 152, 0, 0.1), rgba(255, 87, 34, 0.1)); border-radius: 16rpx; }
.countdown-label { font-size: 22rpx; color: #FF9800; margin-bottom: 4rpx; }
.countdown-time { font-size: 48rpx; font-weight: 700; color: #FF5722; font-family: monospace; letter-spacing: 4rpx; }

.card {
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; padding: 24rpx; margin-bottom: 20rpx;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05); width: 100%; box-sizing: border-box;
}
.card-title { font-size: 28rpx; font-weight: 700; color: #00B4D8; margin-bottom: 20rpx; display: block; }
.service-row { display: flex; gap: 16rpx; }
.service-img { width: 120rpx; height: 120rpx; border-radius: 16rpx; background: #F0F0F0; flex-shrink: 0; }
.service-info { flex: 1; display: flex; flex-direction: column; gap: 8rpx; }
.service-name { font-size: 30rpx; font-weight: 700; color: #1A1A1A; }
.service-cat { font-size: 24rpx; color: #666666; }
.service-price { font-size: 36rpx; font-weight: 700; color: #FF3366; margin-top: auto; }

.info-row { display: flex; justify-content: space-between; padding: 14rpx 0; border-bottom: 1rpx solid #F0F0F0; }
.info-row:last-child { border-bottom: none; }
.info-label { font-size: 26rpx; color: #666666; }
.info-value { font-size: 26rpx; color: #1A1A1A; }

.action-area { display: flex; flex-direction: column; gap: 16rpx; margin-top: 20rpx; }
.btn-primary {
  height: 96rpx; line-height: 96rpx; text-align: center;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  border-radius: 48rpx; font-size: 32rpx; font-weight: 700; color: #FFFFFF;
  box-shadow: 0 4rpx 16rpx rgba(0, 180, 216, 0.3); width: 100%; box-sizing: border-box;
}
.btn-cancel {
  height: 80rpx; line-height: 80rpx; text-align: center;
  background: transparent; border: 1rpx solid rgba(255, 51, 102, 0.3);
  border-radius: 40rpx; font-size: 28rpx; color: #FF3366; width: 100%; box-sizing: border-box;
}
.btn-review {
  height: 80rpx; line-height: 80rpx; text-align: center;
  background: rgba(0, 180, 216, 0.1); border: 1rpx solid rgba(0, 180, 216, 0.3);
  border-radius: 40rpx; font-size: 28rpx; color: #00B4D8; width: 100%; box-sizing: border-box;
}
</style>
