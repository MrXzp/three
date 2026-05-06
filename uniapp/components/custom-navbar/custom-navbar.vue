<template>
  <view class="nav-bar">
    <view class="nav-content">
      <view v-if="showBack" class="nav-back" @click="onBack">
        <text class="back-icon">‹</text>
      </view>
      <text class="nav-title">{{ title }}</text>
      <view class="nav-right"></view>
    </view>
  </view>
</template>

<script>
export default {
  name: 'custom-navbar',
  props: {
    title: {
      type: String,
      default: ''
    },
    showBack: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    onBack() {
      uni.navigateBack()
    }
  }
}
</script>

<style scoped>
.nav-bar {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 176rpx;
  background: #FFFFFF;
  z-index: 100;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.08);
}

.nav-content {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 88rpx;
  display: flex;
  align-items: center;
  padding: 0 24rpx;
}

.nav-back {
  width: 64rpx;
  height: 64rpx;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}

.back-icon {
  font-size: 52rpx;
  color: #00B4D8;
  line-height: 1;
  font-weight: 300;
}

.nav-title {
  position: absolute;
  left: 120rpx;
  right: 120rpx;
  text-align: center;
  font-size: 34rpx;
  font-weight: 700;
  color: #1A1A1A;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>
