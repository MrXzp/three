<template>
  <view class="page">
    <custom-navbar title="申请退款" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx' }">
      <!-- 订单信息 -->
      <view class="card order-card">
        <text class="card-title">订单信息</text>
        <view class="order-info">
          <text class="order-label">订单金额</text>
          <text class="order-value price">¥{{ amount }}</text>
        </view>
        <view class="order-info">
          <text class="order-label">退款金额</text>
          <text class="order-value price">¥{{ amount }}</text>
        </view>
        <text class="notice">* 退款金额将原路返回至支付账户</text>
      </view>

      <!-- 退款原因 -->
      <view class="card">
        <text class="card-title">退款原因</text>
        <view class="reason-list">
          <view
            v-for="item in reasonOptions"
            :key="item.value"
            class="reason-item"
            :class="{ active: form.reason_type === item.value }"
            @click="form.reason_type = item.value"
          >
            <view class="radio" :class="{ checked: form.reason_type === item.value }">
              <view v-if="form.reason_type === item.value" class="radio-dot"></view>
            </view>
            <text class="reason-label">{{ item.label }}</text>
          </view>
        </view>
      </view>

      <!-- 详细说明 -->
      <view class="card">
        <text class="card-title">详细说明</text>
        <textarea
          class="detail-textarea"
          v-model="form.reason_detail"
          :maxlength="500"
          placeholder="请详细描述退款原因（选填）"
          placeholder-class="ph"
        />
        <text class="char-count">{{ form.reason_detail.length }}/500</text>
      </view>

      <!-- 注意事项 -->
      <view class="tips-card">
        <text class="tips-title">退款说明</text>
        <view class="tips-item">1. 退款申请提交后，将由客服审核</view>
        <view class="tips-item">2. 审核通过后，款项将原路退回</view>
        <view class="tips-item">3. 退款预计1-3个工作日到账</view>
        <view class="tips-item">4. 如有疑问，请联系客服</view>
      </view>

      <view class="submit-btn" :class="{ disabled: submitting }" @click="handleSubmit">
        <text>{{ submitting ? '提交中...' : '提交退款申请' }}</text>
      </view>
      <view style="height: 60rpx;"></view>
    </scroll-view>
  </view>
</template>

<script>
import { REFUND_API } from '@/config/api.js'
import { post } from '@/utils/request.js'
import { showToast } from '@/utils/common.js'

export default {
  data() {
    return {
      orderId: null,
      amount: '0.00',
      submitting: false,
      form: {
        reason_type: 'user_cancel',
        reason_detail: '',
      },
      reasonOptions: [
        { value: 'user_cancel', label: '用户主动取消' },
        { value: 'service_issue', label: '服务问题' },
        { value: 'other', label: '其他原因' },
      ],
    }
  },

  onLoad(opts) {
    this.orderId = opts.id
    this.amount = opts.amount || '0.00'
  },

  methods: {
    async handleSubmit() {
      if (this.submitting) return
      this.submitting = true
      try {
        await post(REFUND_API.apply, {
          order_id: this.orderId,
          reason_type: this.form.reason_type,
          reason_detail: this.form.reason_detail,
        })
        showToast('退款申请已提交', 'success')
        setTimeout(() => uni.navigateBack(), 1500)
      } catch (e) {
        showToast(e && e.msg ? e.msg : '提交失败')
      } finally {
        this.submitting = false
      }
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; width: 100%; background: #F5F5F5; box-sizing: border-box; }
.content { position: fixed; left: 0; right: 0; bottom: 0; overflow-y: auto; padding: 20rpx 24rpx; box-sizing: border-box; }

.card {
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; padding: 32rpx; margin-bottom: 20rpx;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05); width: 100%; box-sizing: border-box;
}
.card-title { font-size: 28rpx; font-weight: 700; color: #1A1A1A; display: block; margin-bottom: 24rpx; }

/* 订单信息 */
.order-card { background: linear-gradient(135deg, #fff5f5, #fff); border-color: #ffd4d4; }
.order-info { display: flex; justify-content: space-between; align-items: center; padding: 16rpx 0; border-bottom: 1rpx solid #F0F0F0; }
.order-info:last-of-type { border-bottom: none; }
.order-label { font-size: 28rpx; color: #666666; }
.order-value { font-size: 28rpx; color: #1A1A1A; }
.order-value.price { font-size: 36rpx; font-weight: 700; color: #FF4D4F; }
.notice { font-size: 22rpx; color: #FF9800; margin-top: 16rpx; display: block; }

/* 退款原因 */
.reason-list { display: flex; flex-direction: column; gap: 16rpx; }
.reason-item {
  display: flex; align-items: center; gap: 16rpx;
  padding: 24rpx; background: #F8F8F8; border-radius: 16rpx;
  border: 2rpx solid transparent; transition: all 0.2s;
}
.reason-item.active { background: #fff5f5; border-color: #FF4D4F; }
.radio { width: 40rpx; height: 40rpx; border-radius: 50%; border: 4rpx solid #DDDDDD; display: flex; align-items: center; justify-content: center; transition: all 0.2s; flex-shrink: 0; }
.reason-item.active .radio { border-color: #FF4D4F; }
.radio-dot { width: 20rpx; height: 20rpx; border-radius: 50%; background: #FF4D4F; }
.reason-label { font-size: 28rpx; color: #1A1A1A; }

/* 详细说明 */
.detail-textarea {
  width: 100%; min-height: 200rpx; background: #F8F8F8; border: 1rpx solid #E8E8E8;
  border-radius: 16rpx; padding: 20rpx; font-size: 28rpx; color: #1A1A1A; line-height: 1.6; box-sizing: border-box;
}
.ph { color: #999999; }
.char-count { font-size: 22rpx; color: #999999; text-align: right; margin-top: 8rpx; display: block; }

/* 注意事项 */
.tips-card { background: #FFF9E6; border: 1rpx solid #FFE58F; border-radius: 16rpx; padding: 24rpx; margin-bottom: 32rpx; }
.tips-title { font-size: 26rpx; font-weight: 700; color: #FA8C16; display: block; margin-bottom: 16rpx; }
.tips-item { font-size: 24rpx; color: #7A6845; line-height: 1.8; padding-left: 8rpx; }

/* 提交按钮 */
.submit-btn {
  height: 96rpx; line-height: 96rpx; text-align: center;
  background: linear-gradient(135deg, #FF4D4F, #FF6B6B);
  border-radius: 48rpx; font-size: 32rpx; font-weight: 700; color: #FFFFFF;
  box-shadow: 0 4rpx 16rpx rgba(255, 77, 79, 0.3); width: 100%; box-sizing: border-box; margin-top: 20rpx;
}
.submit-btn.disabled { opacity: 0.5; }
</style>
