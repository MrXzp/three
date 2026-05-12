<template>
  <view class="page">
    <custom-navbar title="订单详情" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabbarHeight + bottomBarHeight + 'px' }"
      refresher-enabled :refresher-triggered="refreshing" @refresherrefresh="onRefresh">
      <view v-if="loading" class="loading-wrap"><view class="loading-dot"></view><text class="loading-text">加载中...</text></view>
      <view v-else-if="order" class="detail-wrap">

        <!-- 状态横幅 -->
        <view class="status-banner">
          <view class="banner-left">
            <text class="banner-title">待接单</text>
            <text class="banner-desc">查看订单详情，确认后接单</text>
          </view>
          <view class="banner-price">
            <text class="price-label">订单金额</text>
            <text class="price-value">¥{{ order.total_amount }}</text>
          </view>
        </view>

        <!-- 服务信息 -->
        <view class="card">
          <text class="card-title">服务信息</text>
          <view class="service-row">
            <image v-if="order.service && order.service.images && order.service.images.length > 0"
              :src="getImageUrl(order.service.images[0].image)"
              class="service-img" mode="aspectFill" />
            <view v-else class="service-img-placeholder">
              <text class="placeholder-icon">🎮</text>
            </view>
            <view class="service-info">
              <text class="service-name">{{ order.service_name }}</text>
              <view class="service-tags">
                <text class="tag" :class="order.service_type === 1 ? 'tag-single' : 'tag-multi'">
                  {{ order.service_type === 1 ? '单人服务' : '多人服务' }}
                </text>
                <text v-if="order.required_hunters > 1" class="tag tag-multi">
                  需要 {{ order.required_hunters }} 人
                </text>
              </view>
              <text class="service-cat">{{ order.service && order.service.category ? order.service.category.name : '' }}</text>
            </view>
          </view>
        </view>

        <!-- 游戏信息 -->
        <view class="card">
          <text class="card-title">游戏信息</text>
          <view class="info-row">
            <text class="info-label">游戏账号</text>
            <text class="info-value">{{ order.game_account || '-' }}</text>
          </view>
          <view class="info-row">
            <text class="info-label">服务器</text>
            <text class="info-value">{{ order.game_server || '-' }}</text>
          </view>
          <view v-if="order.game_mode" class="info-row">
            <text class="info-label">游戏模式</text>
            <text class="info-value">{{ order.game_mode }}</text>
          </view>
          <view v-if="order.special_requirements" class="info-row special-row">
            <text class="info-label">特殊要求</text>
            <text class="info-value special-value">{{ order.special_requirements }}</text>
          </view>
        </view>

        <!-- 订单信息 -->
        <view class="card">
          <text class="card-title">订单信息</text>
          <view class="info-row">
            <text class="info-label">订单编号</text>
            <text class="info-value copy-value" @click="copyOrderNo">{{ order.order_no }} <text class="copy-icon">📋</text></text>
          </view>
          <view class="info-row">
            <text class="info-label">下单时间</text>
            <text class="info-value">{{ formatTime(order.create_datetime) }}</text>
          </view>
        </view>

        <!-- 打手收益 -->
        <view class="card earnings-card">
          <text class="card-title">打手收益</text>
          <view class="earnings-grid">
            <view class="earning-item">
              <text class="earning-label">订单总额</text>
              <text class="earning-value primary">¥{{ order.total_amount }}</text>
            </view>
            <view class="earning-item">
              <text class="earning-label">打手分成</text>
              <text class="earning-value success">¥{{ order.hunter_share || '0.00' }}</text>
            </view>
            <view v-if="order.required_hunters > 1" class="earning-item">
              <text class="earning-label">预计每人</text>
              <text class="earning-value">约 ¥{{ perHunterShare }}</text>
            </view>
          </view>
          <view v-if="order.required_hunters > 1" class="earnings-hint">
            <text class="hint-icon">💡</text>
            <text class="hint-text">多人订单收益按接单人数均分</text>
          </view>
        </view>

        <view style="height: 40rpx;"></view>
      </view>
      <view v-else-if="!loading" class="empty-wrap">
        <text class="empty-icon">📋</text>
        <text class="empty-text">订单不存在或已下架</text>
      </view>
    </scroll-view>

    <!-- 底部操作栏 -->
    <view v-if="order" class="bottom-bar" :style="{ bottom: '120rpx' }">
      <view class="bottom-price">
        <text class="bottom-label">打手可得</text>
        <text class="bottom-amount">¥{{ order.hunter_share || '0.00' }}</text>
      </view>
      <view
        class="accept-btn"
        :class="{ disabled: !isHunterApproved || accepting }"
        @click="handleAccept"
      >
        <text v-if="!isHunterApproved">仅认证打手可接单</text>
        <text v-else-if="accepting">接单中...</text>
        <text v-else>立即接单</text>
      </view>
    </view>

    <custom-tabbar ref="tabbar" @tabbarReady="onTabbarReady" />

    <chat-drawer
      v-if="order"
      :orderId="orderId"
      :orderStatus="order.status"
      :myUserId="userInfo ? userInfo.id : null"
      :myNickname="userInfo ? (userInfo.nickname || '') : ''"
      :myAvatar="userInfo ? (userInfo.avatar_url || '') : ''"
    />
  </view>
</template>

<script>
import { ORDER_API, USER_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { showToast, showModal, getImageUrl } from '@/utils/common.js'
import chatDrawer from '@/components/chat-drawer/chat-drawer.vue'

export default {
  components: { chatDrawer },
  data() {
    return {
      tabbarHeight: 180,
      bottomBarHeight: 140,  // 底部操作栏高度（固定值）
      orderId: null,
      order: null,
      loading: false,
      refreshing: false,
      accepting: false,
      userInfo: null,
    }
  },

  computed: {
    isHunterApproved() {
      return this.userInfo && this.userInfo.hunter_status === 2
    },
    perHunterShare() {
      if (!this.order || !this.order.hunter_share) return '0.00'
      const count = this.order.required_hunters || 1
      return (parseFloat(this.order.hunter_share) / count).toFixed(2)
    },
  },

  onLoad(opts) {
    this.orderId = opts.id
    if (!this.orderId) {
      uni.showToast({ title: '参数错误', icon: 'none' })
      setTimeout(() => uni.navigateBack(), 1500)
      return
    }
  },

  onShow() {
    this.loadData()
  },

  methods: {
    onTabbarReady(h) { this.tabbarHeight = h },

    async loadData() {
      this.loading = true
      try {
        const [orderRes, userRes] = await Promise.all([
          get(ORDER_API.detail(this.orderId)),
          get(USER_API.current).catch(() => null),
        ])
        this.order = orderRes
        this.userInfo = userRes || {}
      } catch (e) {
        showToast('加载失败', 'none')
      } finally {
        this.loading = false
        this.refreshing = false
      }
    },

    onRefresh() {
      this.loadData()
    },

    copyOrderNo() {
      if (!this.order || !this.order.order_no) return
      uni.setClipboardData({
        data: this.order.order_no,
        success: () => showToast('已复制订单号', 'success'),
      })
    },

    formatTime(t) {
      if (!t) return '-'
      return t.slice(0, 16).replace('T', ' ')
    },

    async handleAccept() {
      if (!this.isHunterApproved) {
        uni.showModal({
          title: '无法接单',
          content: '您还没有通过打手认证，请先申请成为认证打手',
          confirmText: '去申请',
          success: (res) => {
            if (res.confirm) {
              uni.navigateTo({ url: '/pages/user/my/apply_hunter' })
            }
          }
        })
        return
      }
      if (this.accepting) return

      const res = await showModal({
        title: '确认接单',
        content: `确定接下此订单吗？\n订单编号：${this.order.order_no}\n打手分成：¥${this.order.hunter_share || '0.00'}`,
      })
      if (!res.confirm) return

      this.accepting = true
      try {
        await post(ORDER_API.accept(this.orderId))
        showToast('接单成功', 'success')
        setTimeout(() => {
          uni.redirectTo({ url: '/pages/handler/order/detail?id=' + this.orderId })
        }, 1200)
      } catch (e) {
        showToast(e.msg || '接单失败', 'none')
      } finally {
        this.accepting = false
      }
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; background: #F5F5F5; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.loading-wrap {
  display: flex; flex-direction: column; align-items: center;
  padding: 200rpx 0; gap: 16rpx;
}
.loading-dot { width: 48rpx; height: 48rpx; border: 4rpx solid rgba(0,180,216,0.2); border-top-color: #00B4D8; border-radius: 50%; animation: spin 0.8s linear infinite; }
@keyframes spin { to { transform: rotate(360deg); } }
.loading-text, .empty-text { font-size: 26rpx; color: #999; }
.empty-wrap { display: flex; flex-direction: column; align-items: center; padding: 200rpx 0; gap: 16rpx; }
.empty-icon { font-size: 80rpx; }

.detail-wrap { padding: 20rpx 24rpx; }

/* 状态横幅 */
.status-banner {
  display: flex; align-items: center; justify-content: space-between;
  background: linear-gradient(135deg, #1A1A2E, #16213E);
  border-radius: 20rpx;
  padding: 32rpx;
  margin-bottom: 20rpx;
  box-shadow: 0 4rpx 16rpx rgba(0,0,0,0.15);
}
.banner-left { display: flex; flex-direction: column; gap: 6rpx; }
.banner-title { font-size: 40rpx; font-weight: 700; color: #FFFFFF; }
.banner-desc { font-size: 22rpx; color: rgba(255,255,255,0.6); }
.banner-price { display: flex; flex-direction: column; align-items: flex-end; gap: 4rpx; }
.price-label { font-size: 20rpx; color: rgba(255,255,255,0.5); }
.price-value { font-size: 40rpx; font-weight: 700; color: #FF3366; }

/* 卡片通用 */
.card {
  background: #FFFFFF;
  border: 1rpx solid #E8E8E8;
  border-radius: 20rpx;
  padding: 24rpx;
  margin-bottom: 20rpx;
}
.card-title {
  font-size: 28rpx; font-weight: 700;
  color: #00B4D8;
  margin-bottom: 20rpx;
  display: block;
}

/* 服务信息 */
.service-row { display: flex; gap: 16rpx; }
.service-img { width: 120rpx; height: 120rpx; border-radius: 16rpx; background: #F5F5F5; flex-shrink: 0; }
.service-img-placeholder { width: 120rpx; height: 120rpx; border-radius: 16rpx; background: #F0F0F0; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.placeholder-icon { font-size: 48rpx; }
.service-info { flex: 1; display: flex; flex-direction: column; gap: 8rpx; }
.service-name { font-size: 30rpx; font-weight: 700; color: #1A1A1A; }
.service-tags { display: flex; gap: 8rpx; }
.tag { font-size: 20rpx; padding: 4rpx 12rpx; border-radius: 8rpx; }
.tag-single { background: rgba(0,180,216,0.1); color: #00B4D8; }
.tag-multi { background: rgba(157,78,221,0.1); color: #9D4EDD; }
.service-cat { font-size: 22rpx; color: #999; }

/* 通用信息行 */
.info-row { display: flex; justify-content: space-between; align-items: flex-start; padding: 14rpx 0; border-bottom: 1rpx solid #F0F0F0; }
.info-row:last-child { border-bottom: none; }
.info-label { font-size: 26rpx; color: #888888; flex-shrink: 0; }
.info-value { font-size: 26rpx; color: #1A1A1A; text-align: right; }
.copy-value { color: #00B4D8; }
.copy-icon { font-size: 20rpx; margin-left: 4rpx; }
.special-row { align-items: flex-start; }
.special-value { color: #FF5722; background: rgba(255,87,34,0.06); padding: 8rpx; border-radius: 8rpx; }

/* 收益卡片 */
.earnings-card { background: linear-gradient(135deg, #f0f9ff, #e8f5e9); border-color: rgba(0,180,216,0.15); }
.earnings-grid { display: flex; gap: 16rpx; flex-wrap: wrap; }
.earning-item { flex: 1; min-width: 140rpx; display: flex; flex-direction: column; gap: 6rpx; padding: 12rpx 16rpx; background: rgba(255,255,255,0.8); border-radius: 12rpx; }
.earning-label { font-size: 22rpx; color: #888; }
.earning-value { font-size: 30rpx; font-weight: 700; color: #1A1A1A; }
.earning-value.primary { color: #FF3366; }
.earning-value.success { color: #00C853; }
.earnings-hint { display: flex; align-items: center; gap: 8rpx; margin-top: 12rpx; padding: 10rpx 14rpx; background: rgba(255,255,255,0.8); border-radius: 10rpx; }
.hint-icon { font-size: 24rpx; }
.hint-text { font-size: 22rpx; color: #666; }

/* 底部操作栏 */
.bottom-bar {
  position: fixed; left: 0; right: 0;
  display: flex; align-items: center; gap: 16rpx;
  padding: 20rpx 32rpx;
  padding-bottom: calc(20rpx + env(safe-area-inset-bottom));
  background: #FFFFFF;
  border-top: 1rpx solid #E8E8E8;
  box-shadow: 0 -4rpx 16rpx rgba(0,0,0,0.06);
  z-index: 100;
}
.bottom-price { display: flex; flex-direction: column; gap: 2rpx; }
.bottom-label { font-size: 20rpx; color: #888; }
.bottom-amount { font-size: 36rpx; font-weight: 700; color: #FF3366; }
.accept-btn {
  flex: 1;
  height: 96rpx; line-height: 96rpx; text-align: center;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  border-radius: 48rpx;
  font-size: 32rpx; font-weight: 700; color: #FFFFFF;
  box-shadow: 0 4rpx 16rpx rgba(0,180,216,0.3);
}
.accept-btn.disabled {
  background: #CCCCCC;
  box-shadow: none;
}
</style>
