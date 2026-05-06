<template>
  <view class="tabbar-wrap" :class="{ safe: hasSafeArea }">
    <view class="tabbar">
      <view class="tab-list">
        <view
          v-for="item in visibleTabs"
          :key="item.pagePath"
          class="tab-item"
          :class="{ active: currentRoute === item.pagePath }"
          @click="onTabClick(item.pagePath)"
        >
          <text class="tab-icon">{{ item.icon }}</text>
          <text class="tab-text">{{ item.text }}</text>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import { USER_API } from '@/config/api.js'
import { get } from '@/utils/request.js'

export default {
  data() {
    return {
      statusBarHeight: 0,
      hasSafeArea: false,
      currentRoute: '',
      isLoggedIn: false,
      isHunterApproved: false,
      allTabs: [
        { icon: '🏠', text: '首页', pagePath: 'pages/index/index' },
        { icon: '🎯', text: '接单', pagePath: 'pages/handler/index/index', requireLogin: true, requireHunter: true },
        { icon: '📋', text: '订单', pagePath: 'pages/user/order/index', requireLogin: true },
        { icon: '👤', text: '我的', pagePath: 'pages/user/my/index' },
      ],
    }
  },

  created() {
    console.log('[TABBAR] created 触发')
  },

  computed: {
    visibleTabs() {
      return this.allTabs.filter(tab => {
        if (tab.requireLogin && !this.isLoggedIn) {
          return false
        }
        if (tab.requireHunter && !this.isHunterApproved) {
          return false
        }
        return true
      })
    }
  },

  mounted() {
    console.log('[TABBAR] mounted 触发')
    this.syncTabFromPage()
    this.checkUserStatus()

    // 通知页面获取 tabbar 高度
    this.$nextTick(() => {
      const sys = uni.getSystemInfoSync()
      const bottomHeight = sys.safeAreaInsets ? sys.safeAreaInsets.bottom : 0
      this.$emit('tabbarReady', bottomHeight)
    })

    uni.$on('loginSuccess', () => {
      console.log('[TABBAR] 收到 loginSuccess')
      this.checkUserStatus()
    })
    uni.$on('userInfoUpdate', () => {
      this.checkUserStatus()
    })
    uni.$on('checkLoginStatus', () => {
      this.checkUserStatus()
    })
  },

  beforeDestroy() {
    uni.$off('loginSuccess')
    uni.$off('userInfoUpdate')
    uni.$off('checkLoginStatus')
  },

  methods: {
    async checkUserStatus() {
      const token = uni.getStorageSync('escort_token')
      this.isLoggedIn = !!token
      console.log('[TABBAR] checkUserStatus, token:', !!token)

      if (this.isLoggedIn) {
        try {
          const userInfo = await get(USER_API.current)
          console.log('[TABBAR] 获取用户信息成功:', userInfo)
          this.isHunterApproved = userInfo && userInfo.hunter_status === 2
          uni.setStorageSync('escort_user_info', userInfo)
        } catch (e) {
          console.error('[TABBAR] 获取用户信息失败:', e)
          // 即使获取失败，只要有 token 就认为已登录
          this.isLoggedIn = true
          this.isHunterApproved = false
        }
      } else {
        this.isHunterApproved = false
      }
    },

    onTabClick(pagePath) {
      this.currentRoute = pagePath
      const url = '/' + pagePath
      const pages = getCurrentPages()
      const curPage = pages[pages.length - 1]
      if (curPage && url === '/' + curPage.route) return
      uni.reLaunch({ url })
    },

    syncTab(idx) {
      const tab = this.visibleTabs[idx]
      if (tab) this.currentRoute = tab.pagePath
    },

    syncTabFromPage() {
      const pages = getCurrentPages()
      if (pages.length === 0) return
      const curPage = pages[pages.length - 1]
      if (!curPage) return
      this.currentRoute = curPage.route
    },
  },
}
</script>

<style scoped>
.tabbar-wrap {
  position: fixed;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 999;
  background: #FFFFFF;
  box-shadow: 0 -2rpx 8rpx rgba(0, 0, 0, 0.08);
}

.tabbar {
  padding-bottom: constant(safe-area-inset-bottom);
  padding-bottom: env(safe-area-inset-bottom);
}

.tab-list {
  display: flex;
  align-items: flex-end;
  height: 100rpx;
  padding: 0 16rpx;
}

.tab-item {
  position: relative;
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 4rpx;
  height: 100%;
  transition: all 0.3s;
}

.tab-icon { font-size: 44rpx; transition: transform 0.3s; }
.tab-item.active .tab-icon { transform: scale(1.1); }

.tab-text {
  font-size: 22rpx;
  color: #999999;
  transition: color 0.3s;
  line-height: 1;
}
.tab-item.active .tab-text { color: #00B4D8; }
</style>
