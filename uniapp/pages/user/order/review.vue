<template>
  <view class="page">
    <custom-navbar title="评价服务" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx' }">
      <view class="card">
        <text class="card-label">⭐ 评分</text>
        <view class="star-row">
          <text v-for="i in 5" :key="i" class="star" :class="{ active: i <= rating }" @click="setRating(i)">{{ i <= rating ? '★' : '☆' }}</text>
        </view>
        <textarea class="review-textarea" v-model="form.content" placeholder="分享你的体验，帮助其他玩家做出更好的选择..." placeholder-class="ph" />
        <view class="anonymous-row">
          <view class="anonymous-toggle" :class="{ on: form.is_anonymous }" @click="form.is_anonymous = !form.is_anonymous">
            <view class="toggle-dot"></view>
          </view>
          <text class="anonymous-label">匿名评价</text>
        </view>
      </view>

      <view class="submit-btn" :class="{ disabled: submitting }" @click="handleSubmit">
        <text>{{ submitting ? '提交中...' : '提交评价' }}</text>
      </view>
      <view style="height: 60rpx;"></view>
    </scroll-view>
  </view>
</template>

<script>
import { ORDER_API } from '@/config/api.js'
import { post } from '@/utils/request.js'
import { showToast } from '@/utils/common.js'

export default {
  data() {
    return {
      orderId: null, submitting: false, rating: 5,
      form: { content: '', is_anonymous: false },
    }
  },

  onLoad(opts) {
    this.orderId = opts.id
  },

  methods: {
    setRating(v) { this.rating = v },
    async handleSubmit() {
      if (!this.form.content.trim()) { showToast('请填写评价内容', 'none'); return }
      this.submitting = true
      try {
        await post(ORDER_API.review(this.orderId), {
          rating: this.rating, content: this.form.content, is_anonymous: this.form.is_anonymous,
        })
        showToast('评价成功', 'success')
        setTimeout(() => uni.navigateBack(), 1000)
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

.card { background: #FFFFFF; border: 1rpx solid #E8E8E8; border-radius: 20rpx; padding: 32rpx; margin-bottom: 32rpx; box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05); width: 100%; box-sizing: border-box; }
.card-label { font-size: 28rpx; font-weight: 700; color: #1A1A1A; display: block; margin-bottom: 20rpx; }
.star-row { display: flex; gap: 16rpx; margin-bottom: 24rpx; }
.star { font-size: 56rpx; transition: all 0.2s; }
.star.active { color: #FF9800; text-shadow: 0 0 16rpx rgba(255, 152, 0, 0.6); }
.star:not(.active) { color: #E8E8E8; }
.review-textarea {
  width: 100%; min-height: 200rpx; background: #F5F5F5; border: 1rpx solid #E8E8E8;
  border-radius: 16rpx; padding: 20rpx; font-size: 28rpx; color: #1A1A1A; line-height: 1.6; margin-bottom: 24rpx; box-sizing: border-box;
}
.ph { color: #999999; }
.anonymous-row { display: flex; align-items: center; gap: 12rpx; }
.anonymous-label { font-size: 26rpx; color: #666666; }
.anonymous-toggle {
  width: 80rpx; height: 44rpx; border-radius: 22rpx; background: #F5F5F5;
  border: 1rpx solid #E8E8E8; position: relative; transition: all 0.3s;
}
.anonymous-toggle.on { background: rgba(0, 180, 216, 0.15); border-color: rgba(0, 180, 216, 0.4); }
.toggle-dot {
  position: absolute; top: 2rpx; left: 2rpx; width: 36rpx; height: 36rpx; border-radius: 50%;
  background: #999999; transition: all 0.3s;
}
.anonymous-toggle.on .toggle-dot { left: 38rpx; background: #00B4D8; box-shadow: 0 0 8rpx rgba(0, 180, 216, 0.8); }

.submit-btn {
  height: 96rpx; line-height: 96rpx; text-align: center;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  border-radius: 48rpx; font-size: 32rpx; font-weight: 700; color: #FFFFFF;
  box-shadow: 0 4rpx 16rpx rgba(0, 180, 216, 0.3); width: 100%; box-sizing: border-box;
}
.submit-btn.disabled { opacity: 0.5; }
</style>
