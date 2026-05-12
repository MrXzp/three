<template>
  <view class="page">
    <custom-navbar title="接单大厅" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabBarBottom + 'px' }">
      <view class="welcome-card">
        <view class="welcome-info">
          <text class="welcome-name">{{ userInfo.nickname || '陪玩师' }}</text>
          <view class="status-tag" :class="{ approved: isHunterApproved }">
            {{ isHunterApproved ? '认证打手' : (isHunterPending ? '审核中' : '未认证') }}
          </view>
        </view>
        <view class="welcome-stats">
          <view class="stat-item">
            <text class="stat-num">{{ todayOrders }}</text>
            <text class="stat-label">今日订单</text>
          </view>
          <view class="stat-item">
            <text class="stat-num">{{ inProgress }}</text>
            <text class="stat-label">进行中</text>
          </view>
          <view class="stat-item">
            <text class="stat-num green">{{ totalIncome }}</text>
            <text class="stat-label">收益(元)</text>
          </view>
        </view>
      </view>

      <view class="filter-bar">
        <view
          v-for="f in filters"
          :key="f.value"
          class="filter-item"
          :class="{ active: currentFilter === f.value }"
          @click="switchFilter(f.value)"
        >
          {{ f.label }}
        </view>
      </view>

      <view v-if="loading && orders.length === 0" class="loading-wrap">
        <text class="loading-text">加载中...</text>
      </view>
      <view v-else-if="orders.length === 0 && !loading" class="empty-wrap">
        <text class="empty-icon">🎮</text>
        <text class="empty-text">暂无可接订单</text>
      </view>

      <view v-for="order in orders" :key="order.id" class="order-card" @click="goDetail(order)">
        <view class="order-header">
          <text class="order-no">{{ order.order_no }}</text>
          <view class="status-badge">{{ order.status_display || '待接单' }}</view>
        </view>
        <view class="order-service">
          <text class="service-name">{{ order.service_name }}</text>
          <text class="order-price">¥{{ order.total_amount }}</text>
        </view>
        <view class="order-info">
          <text class="info-item">账号：{{ order.game_account || '-' }}</text>
          <text class="info-item">区服：{{ order.game_server || '-' }}</text>
        </view>
        <view class="order-info" v-if="order.game_mode">
          <text class="info-item">模式：{{ order.game_mode }}</text>
          <text class="info-item">需求：{{ order.required_hunters || 1 }}人</text>
        </view>
        <view class="order-tip">
          <text class="tip-text">点击查看详情 &gt;</text>
        </view>
      </view>

      <view v-if="loading && orders.length > 0" class="load-more">
        <text class="load-more-text">加载中...</text>
      </view>
      <view v-if="noMore && orders.length > 0" class="no-more">
        <text class="no-more-text">— 没有更多了 —</text>
      </view>
    </scroll-view>

    <custom-tabbar ref="tabbar" @tabbarReady="onTabbarReady" />
  </view>
</template>

<script>
import customNavbar from '@/components/custom-navbar/custom-navbar.vue'
import customTabbar from '@/components/custom-tabbar/custom-tabbar.vue'
import { ORDER_API, USER_API } from '@/config/api.js'
import { get } from '@/utils/request.js'
import { showToast } from '@/utils/common.js'

export default {
  components: { customNavbar, customTabbar },

  data() {
    return {
      tabBarBottom: 0,
      userInfo: null,
      orders: [],
      loading: false,
      page: 1,
      noMore: false,
      currentFilter: 0,
      todayOrders: 0,
      inProgress: 0,
      totalIncome: '0.00',
      PAGE_SIZE: 10,
      filters: [
        { label: '全部可接', value: 0 },
        { label: '待接单', value: 1 },
        { label: '已接单', value: 2 },
      ],
    }
  },

  computed: {
    isHunterApproved() {
      return this.userInfo && this.userInfo.hunter_status === 2
    },
    isHunterPending() {
      return this.userInfo && this.userInfo.hunter_status === 1
    },
  },

  onLoad() {
    this.loadUserInfo()
    this.fetchOrders(true)
  },

  onShow() {
    this.loadUserInfo()
  },

  methods: {
    onTabbarReady(bottomHeight) {
      this.tabBarBottom = bottomHeight
    },
    async loadUserInfo() {
      try {
        const res = await get(USER_API.current)
        this.userInfo = res || {}
        uni.setStorageSync('escort_user_info', this.userInfo)
        if (this.userInfo.phone) {
          uni.setStorageSync('escort_phone', this.userInfo.phone)
        }
        this.totalIncome = this.userInfo.total_income || '0.00'
        this.inProgress = this.userInfo.in_progress_orders || 0
      } catch (e) {
        console.error('获取用户信息失败', e)
      }
    },

    async fetchOrders(reset = false) {
      if (this.loading) return
      if (reset) { this.page = 1; this.noMore = false }
      this.loading = true
      try {
        let results = []
        if (this.currentFilter === 2) {
          // 已接单：使用打手已接订单接口
          const res = await get(ORDER_API.my, { page: this.page, page_size: this.PAGE_SIZE })
          results = Array.isArray(res) ? res : (res && res.results) || []
          this.noMore = !res || !res.next
        } else {
          // 大厅订单列表
          const params = {
            status: this.currentFilter === 0 ? undefined : 1,
            page: this.page,
            page_size: this.PAGE_SIZE,
          }
          const res = await get(ORDER_API.list, params)
          results = Array.isArray(res) ? res : (res && res.results) || []
          this.noMore = !res || !res.next
        }
        this.orders = reset ? results : this.orders.concat(results)
        if (!reset && results.length > 0) this.page++
        if (results.length < this.PAGE_SIZE) this.noMore = true
      } catch (e) {
        console.error('获取订单失败', e)
      } finally {
        this.loading = false
      }
    },

    switchFilter(val) {
      this.currentFilter = val
      this.fetchOrders(true)
    },

    loadMore() {
      if (!this.noMore) this.fetchOrders(false)
    },

    goDetail(order) {
      const id = typeof order === 'object' ? order.id : order
      if (this.currentFilter === 2) {
        // 已接单 → 已有详情页
        uni.navigateTo({ url: `/pages/handler/order/detail?id=${id}` })
      } else {
        // 大厅待接单 → 新的详情页
        uni.navigateTo({ url: `/pages/handler/order/hall_detail?id=${id}` })
      }
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; background: #F5F5F5; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.welcome-card {
  margin: 20rpx 24rpx 0;
  background: #FFFFFF;
  border-radius: 16rpx;
  padding: 32rpx;
  border: 1rpx solid #E8E8E8;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05);
}
.welcome-info {
  display: flex;
  align-items: center;
  gap: 16rpx;
  margin-bottom: 24rpx;
}
.welcome-name { font-size: 36rpx; font-weight: 700; color: #1A1A1A; }
.status-tag {
  padding: 4rpx 16rpx;
  background: #F0F0F0;
  color: #999999;
  border-radius: 20rpx;
  font-size: 22rpx;
}
.status-tag.approved {
  background: rgba(0, 180, 216, 0.15);
  color: #00B4D8;
}
.welcome-stats {
  display: flex;
  justify-content: space-around;
}
.stat-item { text-align: center; }
.stat-num {
  display: block;
  font-size: 44rpx;
  font-weight: bold;
  color: #1A1A1A;
  margin-bottom: 4rpx;
}
.stat-num.green { color: #00C853; }
.stat-label { font-size: 22rpx; color: #999999; }

.filter-bar {
  display: flex;
  background: #FFFFFF;
  padding: 0 24rpx;
  border-bottom: 1rpx solid #E8E8E8;
}
.filter-item {
  padding: 24rpx;
  font-size: 28rpx;
  color: #999999;
  position: relative;
}
.filter-item.active {
  color: #00B4D8;
  font-weight: 600;
}
.filter-item.active::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 48rpx;
  height: 6rpx;
  background: #00B4D8;
  border-radius: 3rpx;
}

.loading-wrap, .empty-wrap {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-top: 200rpx;
  gap: 16rpx;
}
.loading-text, .empty-text { font-size: 28rpx; color: #999999; }
.empty-icon { font-size: 80rpx; }

.order-card {
  margin: 20rpx 24rpx;
  background: #FFFFFF;
  border-radius: 16rpx;
  padding: 24rpx;
  border: 1rpx solid #E8E8E8;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05);
}
.order-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16rpx;
}
.order-no { font-size: 24rpx; color: #999999; }
.status-badge {
  padding: 4rpx 16rpx;
  border-radius: 20rpx;
  font-size: 22rpx;
  background: rgba(0, 180, 216, 0.1);
  color: #00B4D8;
}
.order-service {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12rpx;
}
.service-name { font-size: 30rpx; font-weight: 600; color: #1A1A1A; }
.order-price { font-size: 32rpx; font-weight: 700; color: #FF3366; }
.order-info { display: flex; gap: 24rpx; margin-bottom: 8rpx; }
.info-item { font-size: 24rpx; color: #666666; }
.order-tip {
  display: flex;
  justify-content: flex-end;
  padding-top: 8rpx;
}
.tip-text { font-size: 22rpx; color: #00B4D8; }

.load-more, .no-more { text-align: center; padding: 30rpx; }
.load-more-text { font-size: 24rpx; color: #999999; }
.no-more-text { font-size: 24rpx; color: #999999; }
</style>
