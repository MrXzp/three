<template>
  <view class="page">
    <!-- 顶部导航栏 -->
    <custom-navbar title="粥一把" />

    <scroll-view
      scroll-y
      class="content"
      :style="{ top: (navBarHeight + statusBarHeight) + 'px', bottom: tabBarBottom + 'px' }"
      @scrolltolower="loadMore"
      :refresher-enabled="true"
      :refresher-triggered="refreshing"
      @refresherrefresh="onRefresh"
    >
      <!-- 搜索框区域 -->
      <view class="search-bar">
        <view class="search-input">
          <text class="search-icon">🔍</text>
          <input class="search-field" placeholder="搜索游戏/服务" placeholder-class="ph" disabled @click="goSearch" />
        </view>
      </view>

      <!-- Banner轮播 -->
      <swiper v-if="banners.length > 0" class="banner-swiper" :indicator-dots="true" :autoplay="true" :interval="3000" circular indicator-color="rgba(0,0,0,0.3)" indicator-active-color="#00B4D8">
        <swiper-item v-for="banner in banners" :key="banner.id">
          <image :src="getImageUrl(banner.image)" class="banner-img" mode="aspectFill" />
        </swiper-item>
      </swiper>

      <!-- 分类Tab -->
      <view class="category-tabs">
        <scroll-view scroll-x class="category-scroll" enhanced :show-scrollbar="false">
          <view
            v-for="cat in categories"
            :key="cat.id"
            class="category-item"
            :class="{ active: currentCategory === cat.id }"
            @click="switchCategory(cat.id)"
          >
            <image v-if="cat.image" :src="getImageUrl(cat.image)" class="cat-icon" mode="aspectFill" />
            <text class="cat-name">{{ cat.name }}</text>
          </view>
        </scroll-view>
      </view>

      <!-- 服务列表 -->
      <view class="service-section">
        <view v-if="loading && services.length === 0" class="loading-wrap">
          <view class="loading-spinner"></view>
          <text class="loading-text">加载中...</text>
        </view>

        <view v-else-if="services.length === 0 && !loading" class="empty-wrap">
          <text class="empty-icon">📦</text>
          <text class="empty-text">暂无服务</text>
        </view>

        <view v-else class="service-grid">
          <view
            v-for="item in services"
            :key="item.id"
            class="service-card"
            @click="goDetail(item.id)"
          >
            <!-- 图片 -->
            <view class="card-img-wrap">
              <swiper v-if="item.images && item.images.length > 1" class="card-swiper" :indicator-dots="false" autoplay circular :interval="3000">
                <swiper-item v-for="(img, idx) in item.images" :key="idx">
                  <image :src="getImageUrl(img.image)" class="card-img" mode="aspectFill" />
                </swiper-item>
              </swiper>
              <image v-else :src="getImageUrl(item.images && item.images[0] && item.images[0].image)" class="card-img" mode="aspectFill" />
            </view>

            <!-- 卡片内容 -->
            <view class="card-body">
              <text class="card-title">{{ item.name }}</text>
              <view class="card-tags">
                <text class="tag tag-primary">{{ item.category_name || '服务' }}</text>
                <text class="tag tag-purple">{{ item.service_type_display || '陪玩' }}</text>
              </view>
              <view class="card-bottom">
                <view class="price-wrap">
                  <text class="price">¥{{ item.price }}</text>
                  <text class="price-unit">/{{ item.duration || 60 }}分钟</text>
                </view>
                <text class="hunters">{{ item.required_hunters || 1 }}人</text>
              </view>
            </view>
          </view>
        </view>
      </view>

      <!-- 加载更多 -->
      <view v-if="loading && services.length > 0" class="load-more">
        <text class="load-more-text">加载中...</text>
      </view>
      <view v-if="noMore && services.length > 0" class="no-more">
        <text class="no-more-text">— 没有更多了 —</text>
      </view>
      <view style="height: 40rpx;"></view>
    </scroll-view>

    <!-- 自定义底部 TabBar -->
    <custom-tabbar ref="tabbar" @tabbarReady="onTabbarReady" />
  </view>
</template>

<script>
import customNavbar from '@/components/custom-navbar/custom-navbar.vue'
import customTabbar from '@/components/custom-tabbar/custom-tabbar.vue'
import { SERVICE_API, BANNER_API } from '@/config/api.js'
import { get } from '@/utils/request.js'
import { showToast, getImageUrl } from '@/utils/common.js'

export default {
  components: { customNavbar, customTabbar },
  data() {
    return {
      statusBarHeight: 0,
      navBarHeight: 88,
      tabBarBottom: 0,
      banners: [],
      categories: [],
      services: [],
      currentCategory: null,
      loading: false,
      refreshing: false,
      page: 1,
      noMore: false,
      PAGE_SIZE: 10
    }
  },

  onLoad() {
    const systemInfo = uni.getSystemInfoSync()
    // this.statusBarHeight = systemInfo.statusBarHeight || 0
    this.fetchBanners()
    this.fetchCategories()
    this.fetchServices(true)
  },

  onShow() {
    // 检查登录状态，未登录跳转登录页
    const token = uni.getStorageSync('escort_token')
    if (!token) {
      uni.reLaunch({ url: '/pages/login/login' })
    }
  },

  methods: {
    getImageUrl,

    onTabbarReady(bottomHeight) {
      this.tabBarBottom = bottomHeight
    },

    async fetchBanners() {
      try {
        const res = await get(BANNER_API.list, { is_active: true })
        this.banners = Array.isArray(res) ? res : (res && res.results ? res.results : [])
      } catch (e) {
        console.error('获取Banner失败', e)
      }
    },

    async fetchCategories() {
      try {
        const res = await get(SERVICE_API.categoryList, { is_active: true })
        this.categories = Array.isArray(res) ? res : (res && res.results ? res.results : [])
      } catch (e) {
        console.error('获取分类失败', e)
      }
    },

    async fetchServices(reset = false) {
      if (this.loading) return
      if (reset) { this.page = 1; this.noMore = false }

      this.loading = true
      try {
        const params = {
          page: this.page,
          page_size: this.PAGE_SIZE,
          is_active: true
        }
        if (this.currentCategory) {
          params.category = this.currentCategory
        }

        const res = await get(SERVICE_API.list, params)

        let results = []
        if (Array.isArray(res)) {
          results = res
        } else if (res && res.results) {
          results = res.results
          this.noMore = !res.next
        }

        if (reset) {
          this.services = results
        } else {
          this.services = this.services.concat(results)
        }

        if (!this.noMore && results.length > 0) {
          this.page++
        }
        if (results.length < this.PAGE_SIZE) {
          this.noMore = true
        }
      } catch (e) {
        console.error('获取服务列表失败', e)
      } finally {
        this.loading = false
        this.refreshing = false
      }
    },

    switchCategory(id) {
      if (this.currentCategory === id) {
        this.currentCategory = null
      } else {
        this.currentCategory = id
      }
      this.fetchServices(true)
    },

    onRefresh() {
      this.refreshing = true
      this.fetchServices(true)
    },

    loadMore() {
      if (!this.noMore && !this.loading) {
        this.fetchServices(false)
      }
    },

    goDetail(id) {
      uni.navigateTo({ url: `/pages/user/service/detail?id=${id}` })
    },

    goSearch() {
      showToast('搜索功能开发中', 'none')
    }
  }
}
</script>

<style scoped>
.page {
  min-height: 100vh;
  background: #F5F5F5;
}

.content {
  position: fixed;
  left: 0;
  right: 0;
}

/* 搜索框 */
.search-bar {
  padding: 20rpx 24rpx;
}
.search-input {
  display: flex;
  align-items: center;
  background: #FFFFFF;
  border: 1rpx solid #E8E8E8;
  border-radius: 40rpx;
  padding: 16rpx 24rpx;
  height: 72rpx;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05);
}
.search-icon {
  font-size: 28rpx;
  margin-right: 12rpx;
}
.search-field {
  flex: 1;
  font-size: 28rpx;
  color: #1A1A1A;
}
.ph {
  color: #999999;
}

/* Banner轮播 */
.banner-swiper {
  width: 100%;
  height: 320rpx;
  margin-bottom: 24rpx;
}
.banner-img {
  width: 100%;
  height: 100%;
  border-radius: 16rpx;
}

/* 分类Tab */
.category-tabs {
  padding: 0 0 20rpx 0;
}
.category-scroll {
  white-space: nowrap;
  padding: 0 16rpx;
}
.category-item {
  display: inline-flex;
  flex-direction: column;
  align-items: center;
  margin-right: 24rpx;
  padding: 12rpx 8rpx;
  border-radius: 16rpx;
  transition: all 0.2s;
}
.category-item.active {
  background: rgba(0, 180, 216, 0.1);
}
.cat-icon {
  width: 80rpx;
  height: 80rpx;
  border-radius: 24rpx;
  margin-bottom: 8rpx;
  background: #F0F0F0;
}
.cat-name {
  font-size: 22rpx;
  color: #666666;
  white-space: nowrap;
}
.category-item.active .cat-name {
  color: #00B4D8;
}

/* 服务列表 */
.service-section {
  padding: 0 24rpx;
}
.service-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 10rpx;
}
.service-card {
  width: calc(50% - 10rpx);
  background: #FFFFFF;
  border-radius: 20rpx;
  overflow: hidden;
  border: 1rpx solid #E8E8E8;
  box-shadow: 0 4rpx 16rpx rgba(0, 0, 0, 0.05);
}

.card-img-wrap {
  width: 100%;
  height: 240rpx;
  background: #F0F0F0;
}
.card-swiper {
  width: 100%;
  height: 100%;
}
.card-img {
  width: 100%;
  height: 100%;
}

.card-body {
  padding: 16rpx;
}
.card-title {
  font-size: 28rpx;
  font-weight: 600;
  color: #1A1A1A;
  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  margin-bottom: 10rpx;
}
.card-tags {
  display: flex;
  gap: 8rpx;
  margin-bottom: 12rpx;
  flex-wrap: wrap;
}
.tag {
  display: inline-block;
  padding: 4rpx 12rpx;
  border-radius: 8rpx;
  font-size: 20rpx;
}
.tag-primary {
  background: rgba(0, 180, 216, 0.1);
  color: #00B4D8;
  border: 1rpx solid rgba(0, 180, 216, 0.3);
}
.tag-purple {
  background: rgba(139, 92, 246, 0.1);
  color: #9D4EDD;
  border: 1rpx solid rgba(139, 92, 246, 0.3);
}
.card-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.price-wrap {
  display: flex;
  align-items: baseline;
}
.price {
  font-size: 36rpx;
  font-weight: 700;
  color: #FF3366;
}
.price-unit {
  font-size: 22rpx;
  color: #999999;
  margin-left: 4rpx;
}
.hunters {
  font-size: 22rpx;
  color: #666666;
  background: #F0F0F0;
  padding: 4rpx 12rpx;
  border-radius: 8rpx;
}

/* 加载状态 */
.loading-wrap, .empty-wrap {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 120rpx 0;
  gap: 16rpx;
}
.loading-spinner {
  width: 48rpx;
  height: 48rpx;
  border: 4rpx solid rgba(0, 180, 216, 0.2);
  border-top-color: #00B4D8;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}
@keyframes spin {
  to { transform: rotate(360deg); }
}
.loading-text, .empty-text {
  font-size: 28rpx;
  color: #999999;
}
.empty-icon {
  font-size: 80rpx;
}

.load-more, .no-more {
  text-align: center;
  padding: 30rpx;
}
.load-more-text, .no-more-text {
  font-size: 24rpx;
  color: #999999;
}
</style>
