<template>
  <view class="page">
    <custom-navbar title="陪玩达人" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabbarHeight + 'px' }">
      <view class="hunter-card">
        <view class="avatar-wrap">
          <image v-if="userInfo && userInfo.avatar_url" :src="getImageUrl(userInfo.avatar_url)" class="avatar" mode="aspectFill" />
          <text v-else class="avatar-text">{{ (userInfo && userInfo.nickname) ? userInfo.nickname.charAt(0) : '?' }}</text>
        </view>
        <text class="hunter-name">{{ userInfo ? userInfo.nickname : '' }}</text>
        <text class="hunter-badge">🎖️ 陪玩达人</text>
        <view class="hunter-stats">
          <view class="h-stat"><text class="h-val">{{ userInfo ? userInfo.completed_orders || 0 : 0 }}</text><text class="h-label">完成订单</text></view>
          <view class="h-divider"></view>
          <view class="h-stat"><text class="h-val">{{ userInfo ? userInfo.avg_rating || '0.0' : '0.0' }}</text><text class="h-label">平均评分</text></view>
        </view>
      </view>

      <view class="income-row">
        <view class="income-item">
          <text class="income-label">可提现</text>
          <text class="income-value">¥{{ userInfo ? userInfo.balance || '0.00' : '0.00' }}</text>
        </view>
        <view class="income-divider"></view>
        <view class="income-item">
          <text class="income-label">累计收入</text>
          <text class="income-value secondary">¥{{ userInfo ? userInfo.total_income || '0.00' : '0.00' }}</text>
        </view>
        <view class="income-divider"></view>
        <view class="income-item">
          <text class="income-label">累计提现</text>
          <text class="income-value secondary">¥{{ userInfo ? userInfo.total_withdrawal || '0.00' : '0.00' }}</text>
        </view>
      </view>

      <view class="menu-list">
        <view class="menu-item" @click="goWithdraw">
          <text class="menu-icon">💰</text><text class="menu-text">提现余额</text><text class="menu-arrow">›</text>
        </view>
        <view class="menu-item" @click="goOrders">
          <text class="menu-icon">📋</text><text class="menu-text">我的接单</text><text class="menu-arrow">›</text>
        </view>
        <view class="menu-item" @click="switchToUser">
          <text class="menu-icon">🎮</text><text class="menu-text">切换为客户</text><text class="menu-arrow">›</text>
        </view>
      </view>
    </scroll-view>

    <custom-tabbar ref="tabbar" />
  </view>
</template>

<script>
import { USER_API } from '@/config/api.js'
import { get } from '@/utils/request.js'
import { getImageUrl } from '@/utils/common.js'

export default {
  data() {
    return { tabbarHeight: 180, userInfo: null }
  },

  onLoad() {
    this.loadUserInfo()
  },

  methods: {
    getImageUrl,

    async loadUserInfo() {
      try { this.userInfo = await get(USER_API.current) } catch (e) { /* no data */ }
    },
    goWithdraw() { uni.navigateTo({ url: '/pages/user/my/withdraw' }) },
    goOrders() { uni.reLaunch({ url: '/pages/handler/order/index' }) },
    switchToUser() {
      uni.setStorageSync('escort_user_mode', 'user')
      uni.reLaunch({ url: '/pages/index/index' })
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; background: #F5F5F5; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.hunter-card {
  display: flex; flex-direction: column; align-items: center; gap: 12rpx;
  margin: 20rpx 24rpx; padding: 40rpx 24rpx; border-radius: 24rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
}
.avatar-wrap { width: 120rpx; height: 120rpx; border-radius: 50%; overflow: hidden; background: rgba(0, 180, 216, 0.1); display: flex; align-items: center; justify-content: center; }
.avatar { width: 100%; height: 100%; }
.avatar-text { font-size: 56rpx; font-weight: 700; color: #00B4D8; }
.hunter-name { font-size: 36rpx; font-weight: 700; color: #1A1A1A; }
.hunter-badge { font-size: 24rpx; color: #9D4EDD; }
.hunter-stats { display: flex; align-items: center; gap: 40rpx; margin-top: 12rpx; }
.h-stat { display: flex; flex-direction: column; align-items: center; gap: 4rpx; }
.h-val { font-size: 40rpx; font-weight: 700; color: #00B4D8; }
.h-label { font-size: 22rpx; color: #999999; }
.h-divider { width: 1rpx; height: 60rpx; background: #E8E8E8; }

.income-row {
  display: flex; align-items: center; margin: 0 24rpx 24rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8; border-radius: 20rpx;
}
.income-item { flex: 1; display: flex; flex-direction: column; align-items: center; gap: 8rpx; padding: 24rpx 0; }
.income-divider { width: 1rpx; height: 60rpx; background: #E8E8E8; }
.income-label { font-size: 22rpx; color: #999999; }
.income-value { font-size: 36rpx; font-weight: 700; color: #FF3366; }
.income-value.secondary { color: #999999; }

.menu-list { padding: 0 24rpx; display: flex; flex-direction: column; gap: 16rpx; }
.menu-item { display: flex; align-items: center; gap: 16rpx; padding: 28rpx 24rpx; border-radius: 20rpx; background: #FFFFFF; border: 1rpx solid #E8E8E8; }
.menu-icon { font-size: 36rpx; }
.menu-text { flex: 1; font-size: 28rpx; color: #1A1A1A; }
.menu-arrow { font-size: 36rpx; color: #CCCCCC; }
</style>
