<template>
  <view class="page">
    <custom-navbar title="服务详情" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: btnBarHeight + 'px' }">
      <view class="img-swiper">
        <swiper v-if="images.length > 0" class="swiper" :indicator-dots="images.length > 1" :autoplay="images.length > 1" :interval="3500" circular>
          <swiper-item v-for="(img, idx) in images" :key="idx">
            <image :src="getImageUrl(img.image)" class="swiper-img" mode="aspectFill" />
          </swiper-item>
        </swiper>
        <image v-else src="/static/logo.png" class="swiper-img" mode="aspectFill" />
      </view>

      <view class="price-card">
        <text class="service-price">¥{{ service ? service.price : '0' }}</text>
        <text class="service-price-unit">元/次</text>
        <view class="service-tags">
          <text class="tag" v-if="service && service.category_name">{{ service.category_name }}</text>
          <text class="tag warning" v-if="service && service.service_type === 2">多人服务</text>
          <text class="tag" v-if="service && service.required_hunters > 1">{{ service.required_hunters }}人</text>
          <text class="tag" v-if="service && service.duration">{{ service.duration }}分钟</text>
        </view>
      </view>

      <view class="name-card">
        <text class="service-name">{{ service ? service.name : '' }}</text>
      </view>

      <view class="section-title">📋 服务介绍</view>
      <view class="desc-card">
        <rich-text :nodes="service ? service.description || '暂无详细介绍' : '加载中...'"></rich-text>
      </view>

      <view style="height: 40rpx;"></view>
    </scroll-view>

    <view class="buy-bar" :style="{ paddingBottom: safeAreaBottom + 'px' }">
      <view class="buy-info">
        <text class="buy-price">¥{{ service ? service.price : '0' }}</text>
        <text class="buy-label">服务费</text>
      </view>
      <view class="buy-btn" @click="goCreate">
        <text>立即下单</text>
      </view>
    </view>
  </view>
</template>

<script>
import { SERVICE_API } from '@/config/api.js'
import { get } from '@/utils/request.js'
import { getImageUrl } from '@/utils/common.js'

export default {
  data() {
    return {
      btnBarHeight: 120,
      serviceId: null, service: null, loading: false,
    }
  },

  computed: {
    images() {
      if (!this.service || !this.service.images) return []
      return this.service.images.filter(i => i.image)
    },
  },

  onLoad(opts) {
    this.serviceId = opts.id
    this.loadService()
  },

  methods: {
    async loadService() {
      this.loading = true
      try {
        this.service = await get(SERVICE_API.detail(this.serviceId), {}, false)
      } finally { this.loading = false }
    },
    goCreate() {
      uni.navigateTo({ url: `/pages/user/order/create?service_id=${this.serviceId}` })
    },
    getImageUrl,
  },
}
</script>

<style scoped>
.page { min-height: 100vh; background: #F5F5F5; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.img-swiper { width: 100%; height: 600rpx; background: #F0F0F0; }
.swiper { width: 100%; height: 100%; }
.swiper-img { width: 100%; height: 100%; }

.price-card {
  display: flex; align-items: baseline; flex-wrap: wrap; gap: 12rpx;
  padding: 24rpx; background: #FFFFFF;
  border-bottom: 1rpx solid #E8E8E8;
}
.service-price { font-size: 56rpx; font-weight: 700; color: #FF3366; }
.service-price-unit { font-size: 26rpx; color: #999999; }
.service-tags { display: flex; flex-wrap: wrap; gap: 8rpx; margin-left: auto; }
.tag { font-size: 22rpx; padding: 6rpx 16rpx; border-radius: 10rpx; background: rgba(0, 180, 216, 0.1); color: #00B4D8; border: 1rpx solid rgba(0, 180, 216, 0.3); }
.tag.warning { background: rgba(255, 51, 102, 0.1); color: #FF3366; border-color: rgba(255, 51, 102, 0.3); }

.name-card { padding: 24rpx; background: #FFFFFF; border-bottom: 1rpx solid #E8E8E8; }
.service-name { font-size: 34rpx; font-weight: 700; color: #1A1A1A; line-height: 1.4; }

.section-title { font-size: 28rpx; font-weight: 700; color: #1A1A1A; padding: 24rpx 24rpx 12rpx; }
.desc-card {
  padding: 24rpx; background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; margin: 0 24rpx; color: #666666; font-size: 28rpx; line-height: 1.8;
}

.buy-bar {
  position: fixed; bottom: 0; left: 0; right: 0; height: 120rpx;
  background: #FFFFFF;
  border-top: 1rpx solid #E8E8E8;
  display: flex; align-items: center; padding: 0 24rpx; gap: 20rpx; z-index: 100;
  box-shadow: 0 -2rpx 8rpx rgba(0, 0, 0, 0.08);
}
.buy-info { display: flex; flex-direction: column; gap: 4rpx; }
.buy-price { font-size: 44rpx; font-weight: 700; color: #FF3366; }
.buy-label { font-size: 22rpx; color: #999999; }
.buy-btn {
  flex: 1; height: 88rpx; line-height: 88rpx; text-align: center;
  background: linear-gradient(135deg, #FF3366, #FF9800);
  border-radius: 44rpx; font-size: 32rpx; font-weight: 700; color: #fff;
  box-shadow: 0 4rpx 16rpx rgba(255, 51, 102, 0.3);
}
</style>
