<template>
  <view class="page">
    <custom-navbar title="接单详情" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabbarHeight + 'px' }">
      <view v-if="loading" class="loading-wrap"><view class="loading-dot"></view></view>
      <view v-else-if="order" class="detail-wrap">

        <!-- 状态卡片 -->
        <view class="status-card" :class="'status-bg-' + order.status">
          <text class="status-text" :class="'s-' + order.status">{{ getStatusText(order.status) }}</text>
          <text class="status-desc">{{ getStatusDesc(order.status) }}</text>
        </view>

        <!-- 搭子进度（多人订单） -->
        <view v-if="order.service_type === 2 || order.required_hunters > 1" class="card">
          <text class="card-title">搭子进度</text>
          <view class="hunter-progress">
            <text class="progress-text">已加入 {{ currentHunterCount }} / {{ order.required_hunters }} 人</text>
            <view class="progress-bar-wrap">
              <view class="progress-bar" :style="{ width: progressPercent + '%' }"></view>
            </view>
            <text v-if="currentHunterCount < order.required_hunters" class="progress-hint">等待搭子加入...</text>
            <text v-else class="progress-ready">搭子已满，可以开始服务！</text>
          </view>
        </view>

        <!-- 已加入的打手列表 -->
        <view v-if="order.hunters && order.hunters.length > 0" class="card">
          <text class="card-title">参与打手</text>
          <view v-for="h in order.hunters" :key="h.id" class="hunter-row">
            <text class="hunter-name">{{ h.hunter_nickname || '打手' }}</text>
            <text v-if="h.is_primary" class="hunter-tag primary">抢单人</text>
          </view>
        </view>

        <view class="card">
          <text class="card-title">服务信息</text>
          <view class="service-row">
            <image v-if="order.service && order.service.images && order.service.images.length > 0"
              :src="getImageUrl(order.service.images[0].image)"
              class="service-img" mode="aspectFill" />
            <view class="service-info">
              <text class="service-name">{{ order.service ? order.service.name : order.service_name }}</text>
              <text class="service-cat">{{ order.required_hunters > 1 ? '多人服务 · ' + order.required_hunters + '人' : '单人服务' }}</text>
            </view>
          </view>
        </view>

        <view class="card">
          <text class="card-title">客户信息</text>
          <view class="info-row"><text class="info-label">游戏账号</text><text class="info-value">{{ order.game_account || '-' }}</text></view>
          <view class="info-row"><text class="info-label">服务器</text><text class="info-value">{{ order.game_server || '-' }}</text></view>
          <view v-if="order.game_mode" class="info-row"><text class="info-label">游戏模式</text><text class="info-value">{{ order.game_mode }}</text></view>
          <view v-if="order.special_requirements" class="info-row"><text class="info-label">特殊要求</text><text class="info-value">{{ order.special_requirements }}</text></view>
        </view>

        <view class="card">
          <text class="card-title">收益信息</text>
          <view class="info-row"><text class="info-label">订单金额</text><text class="info-value">¥{{ order.total_amount }}</text></view>
          <view class="info-row"><text class="info-label">打手分成</text><text class="info-value">¥{{ order.hunter_share || '0.00' }}</text></view>
          <view v-if="order.required_hunters > 1" class="info-row info-hint">
            <text class="info-label">预计每人</text>
            <text class="info-value primary">约 ¥{{ perHunterShare }}</text>
          </view>
        </view>

        <!-- 操作区 -->
        <view class="action-area">
          <!-- 待接单状态（不应出现在详情页，但保留） -->
          <text v-if="order.status === 1" class="btn-disabled">订单待接单</text>

          <!-- 已接单/等待搭子 - 邀请搭子按钮 -->
          <view v-if="order.status === 3" class="action-group">
            <text v-if="currentHunterCount < order.required_hunters" class="invite-hint">当前 {{ currentHunterCount }}/{{ order.required_hunters }} 人，还需 {{ order.required_hunters - currentHunterCount }} 人</text>
            <text class="btn-invite" @click="showBuddyPicker">邀请搭子加入</text>
            <text class="btn-primary" v-if="currentHunterCount >= order.required_hunters" @click="startService">确定上号打单</text>
          </view>

          <!-- 服务中 - 完成服务 -->
          <view v-if="order.status === 4" class="action-group">
            <text class="btn-primary" @click="confirmServiceDone">通知客户已打完</text>
          </view>

          <!-- 已完成/已评价 -->
          <text v-if="order.status === 6 || order.status === 7" class="btn-disabled">订单已完成</text>

          <!-- 联系客户（活跃订单可见） -->
          <text
            v-if="[1,2,3,4,5].includes(order.status)"
            class="btn-chat"
            @click="goToChat"
          >联系老板</text>
        </view>
      </view>
      <view style="height: 40rpx;"></view>
    </scroll-view>

    <!-- 搭子选择抽屉 -->
    <view v-if="showBuddyModal" class="drawer-mask" @click="closeBuddyModal">
      <view class="drawer-content" @click.stop>
        <view class="drawer-header">
          <text class="drawer-title">邀请搭子</text>
          <view class="drawer-handle-bar"></view>
          <text class="drawer-close" @click="closeBuddyModal">✕</text>
        </view>
        <scroll-view scroll-y class="drawer-body">
          <view v-if="loadingBuddies" class="buddy-loading">加载中...</view>
          <view v-else-if="buddies.length === 0" class="buddy-empty">
            <text>暂无搭子，请先去「我的 - 搭子」中添加搭子</text>
          </view>
          <view v-else class="buddy-list">
            <view v-for="b in buddies" :key="b.id" class="buddy-item" @click="inviteBuddy(b)">
              <view class="buddy-avatar-wrap">
                <image v-if="b.buddy && b.buddy.avatar_url" :src="getImageUrl(b.buddy.avatar_url)" class="buddy-avatar" mode="aspectFill" />
                <text v-else class="buddy-avatar-text">{{ (getBuddyName(b) || '?')[0] }}</text>
              </view>
              <view class="buddy-info">
                <text class="buddy-name">{{ getBuddyName(b) }}</text>
                <text class="buddy-status" :class="'status-' + b.status">{{ getBuddyStatusText(b.status) }}</text>
              </view>
              <text class="invite-tag">邀请</text>
            </view>
          </view>
        </scroll-view>
      </view>
    </view>

    <custom-tabbar ref="tabbar" />
  </view>
</template>

<script>
import { ORDER_API, BUDDY_API, USER_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { showToast, getImageUrl } from '@/utils/common.js'

export default {
  data() {
    return {
      tabbarHeight: 180,
      orderId: null, order: null, loading: false,
      showBuddyModal: false, buddies: [], loadingBuddies: false,
      userInfo: null,
    }
  },

  computed: {
    currentHunterCount() {
      return this.order && this.order.hunters ? this.order.hunters.length : 0
    },
    progressPercent() {
      if (!this.order || !this.order.required_hunters) return 0
      return Math.min(100, (this.currentHunterCount / this.order.required_hunters) * 100)
    },
    perHunterShare() {
      if (!this.order || !this.order.hunter_share) return '0.00'
      const count = this.currentHunterCount || 1
      return (parseFloat(this.order.hunter_share) / count).toFixed(2)
    }
  },

  onLoad(opts) {
    this.orderId = opts.id
    this.loadUserInfo()
    this.loadOrder()
  },

  onShow() {
    this.loadUserInfo()
    this.loadOrder()
  },

  methods: {
    getImageUrl,

    goBack() { uni.navigateBack() },

    goToChat() {
      uni.navigateTo({
        url: `/pages/chat/index?order_id=${this.orderId}&order_no=${this.order ? this.order.order_no : ''}`,
      })
    },

    async loadUserInfo() {
      try {
        const res = await get(USER_API.current)
        this.userInfo = res || {}
      } catch (e) {}
    },

    async loadOrder() {
      this.loading = true
      try { this.order = await get(ORDER_API.detail(this.orderId)) }
      catch (e) { showToast('加载失败') }
      finally { this.loading = false }
    },

    // 通知客户服务完成
    confirmServiceDone() {
      uni.showModal({
        title: '确认', content: '确认陪玩已完成了吗？',
        success: async (res) => {
          if (!res.confirm) return
          try {
            await post(ORDER_API.hunterComplete(this.orderId))
            showToast('已通知客户', 'success')
            this.loadOrder()
          } catch (e) { showToast(e.msg || '操作失败') }
        }
      })
    },

    // 召集搭子开始打单（多人订单）
    startService() {
      uni.showModal({
        title: '确认开始', content: '确认所有搭子已就位，可以开始打单了吗？',
        success: async (res) => {
          if (!res.confirm) return
          try {
            await post(ORDER_API.hunterComplete(this.orderId))
            showToast('服务已开始，祝游戏愉快！', 'success')
            this.loadOrder()
          } catch (e) { showToast(e.msg || '操作失败') }
        }
      })
    },

    // 显示搭子选择弹窗
    async showBuddyPicker() {
      this.showBuddyModal = true
      this.loadingBuddies = true
      try {
        const res = await get(BUDDY_API.my)
        this.buddies = Array.isArray(res) ? res : (res.results || [])
      } catch (e) {
        this.buddies = []
      } finally {
        this.loadingBuddies = false
      }
    },

    closeBuddyModal() {
      this.showBuddyModal = false
    },

    getBuddyName(buddy) {
      return (buddy.buddy && buddy.buddy.nickname) || '搭子'
    },
    getBuddyStatusText(status) {
      const map = { 0: '待确认', 1: '活跃', 2: '已删除' }
      return map[status] || '未知'
    },

    async inviteBuddy(buddy) {
      try {
        const buddyId = (buddy.buddy && buddy.buddy.id) || buddy.id
        const res = await post(ORDER_API.inviteBuddy(this.orderId), { buddy_id: buddyId })
        showToast(res.msg || '已邀请搭子', 'success')
        this.closeBuddyModal()
        this.loadOrder()
      } catch (e) { showToast(e.msg || '邀请失败') }
    },

    getStatusText(s) {
      const map = { 0:'待支付', 1:'待接单', 2:'已接单', 3:'等待搭子', 4:'服务中', 5:'待确认', 6:'已完成', 7:'已评价', 8:'已取消' }
      return map[s] || '未知'
    },
    getStatusDesc(s) {
      const map = {
        3: '您是抢单人，请邀请搭子加入或直接开始服务',
        4: '服务进行中，请完成陪玩后通知客户',
      }
      return map[s] || ''
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; background: #F5F5F5; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }
.loading-wrap { display: flex; justify-content: center; padding: 200rpx 0; }
.loading-dot { width: 48rpx; height: 48rpx; border: 4rpx solid rgba(0,180,216,0.2); border-top-color: #00B4D8; border-radius: 50%; animation: spin 0.8s linear infinite; }
@keyframes spin { to { transform: rotate(360deg); } }

.detail-wrap { padding: 20rpx 24rpx; }
.status-card {
  display: flex; flex-direction: column; align-items: center; gap: 8rpx;
  padding: 32rpx 24rpx; border-radius: 20rpx; margin-bottom: 20rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
}
.status-text { font-size: 40rpx; font-weight: 700; }
.status-desc { font-size: 24rpx; color: #666666; text-align: center; }
.s-2 { color: #00B4D8; }
.s-3, .s-5 { color: #9D4EDD; }
.s-4 { color: #FF5722; }
.s-6 { color: #00C853; }

.hunter-progress { display: flex; flex-direction: column; gap: 12rpx; }
.progress-text { font-size: 26rpx; color: #1A1A1A; font-weight: 600; }
.progress-bar-wrap { height: 16rpx; background: #F0F0F0; border-radius: 8rpx; overflow: hidden; }
.progress-bar { height: 100%; background: linear-gradient(90deg, #00B4D8, #00C853); border-radius: 8rpx; transition: width 0.3s; }
.progress-hint { font-size: 24rpx; color: #FF9800; }
.progress-ready { font-size: 24rpx; color: #00C853; font-weight: 600; }

.hunter-row { display: flex; align-items: center; gap: 16rpx; padding: 16rpx 0; border-bottom: 1rpx solid #F0F0F0; }
.hunter-row:last-child { border-bottom: none; }
.hunter-name { flex: 1; font-size: 28rpx; color: #1A1A1A; }
.hunter-tag { font-size: 22rpx; padding: 4rpx 12rpx; border-radius: 12rpx; background: rgba(0,0,0,0.05); color: #666; }
.hunter-tag.primary { background: rgba(0,180,216,0.15); color: #00B4D8; }

.card { background: #FFFFFF; border: 1rpx solid #E8E8E8; border-radius: 20rpx; padding: 24rpx; margin-bottom: 20rpx; }
.card-title { font-size: 28rpx; font-weight: 700; color: #00B4D8; margin-bottom: 20rpx; display: block; }
.service-row { display: flex; gap: 16rpx; }
.service-img { width: 100rpx; height: 100rpx; border-radius: 12rpx; background: #F0F0F0; flex-shrink: 0; }
.service-info { flex: 1; display: flex; flex-direction: column; gap: 8rpx; }
.service-name { font-size: 30rpx; font-weight: 700; color: #1A1A1A; }
.service-cat { font-size: 24rpx; color: #666666; }
.info-row { display: flex; justify-content: space-between; padding: 14rpx 0; border-bottom: 1rpx solid #F0F0F0; }
.info-row:last-child { border-bottom: none; }
.info-hint { background: rgba(0,180,216,0.05); border-radius: 8rpx; padding: 4rpx 0; }
.info-label { font-size: 26rpx; color: #666666; }
.info-value { font-size: 26rpx; color: #1A1A1A; }
.info-value.primary { color: #00B4D8; font-weight: 700; }

.action-area { margin-top: 20rpx; display: flex; flex-direction: column; gap: 16rpx; }
.action-group { display: flex; flex-direction: column; gap: 16rpx; }
.invite-hint { font-size: 24rpx; color: #FF9800; text-align: center; padding: 8rpx 0; }
.btn-primary {
  display: block; height: 96rpx; line-height: 96rpx; text-align: center;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  border-radius: 48rpx; font-size: 32rpx; font-weight: 700; color: #FFFFFF;
  box-shadow: 0 4rpx 16rpx rgba(0, 180, 216, 0.3);
}
.btn-invite {
  display: block; height: 80rpx; line-height: 80rpx; text-align: center;
  background: rgba(157, 78, 221, 0.1); border: 1rpx solid rgba(157, 78, 221, 0.3);
  border-radius: 40rpx; font-size: 28rpx; color: #9D4EDD; font-weight: 600;
}
.btn-disabled {
  display: block; height: 96rpx; line-height: 96rpx; text-align: center;
  background: #F0F0F0; border-radius: 48rpx; font-size: 32rpx; color: #999999;
}

.btn-chat {
  display: block; height: 88rpx; line-height: 88rpx; text-align: center;
  background: linear-gradient(135deg, #00B4D8, #0097B2);
  border-radius: 44rpx; font-size: 30rpx; font-weight: 600; color: #FFFFFF;
  box-shadow: 0 4rpx 16rpx rgba(0, 180, 216, 0.3); width: 100%; box-sizing: border-box;
}

/* 搭子选择抽屉 */
.drawer-mask { position: fixed; inset: 0; background: rgba(0,0,0,0.5); z-index: 999; }
.drawer-content {
  position: fixed; left: 0; right: 0; bottom: 0;
  max-height: 70vh;
  background: #FFFFFF; border-radius: 32rpx 32rpx 0 0;
  display: flex; flex-direction: column;
  animation: slideUp 0.3s ease;
  padding-bottom: env(safe-area-inset-bottom);
}
@keyframes slideUp {
  from { transform: translateY(100%); }
  to   { transform: translateY(0); }
}
.drawer-header {
  display: flex; align-items: center; justify-content: center;
  padding: 24rpx 32rpx 16rpx;
  border-bottom: 1rpx solid #F0F0F0; position: relative; flex-shrink: 0;
}
.drawer-handle-bar {
  position: absolute; top: 16rpx; left: 50%; transform: translateX(-50%);
  width: 64rpx; height: 8rpx; background: #E0E0E0; border-radius: 4rpx;
}
.drawer-title { font-size: 32rpx; font-weight: 700; color: #1A1A1A; }
.drawer-close {
  position: absolute; right: 32rpx; top: 50%; transform: translateY(-50%);
  font-size: 40rpx; color: #999; line-height: 1;
}
.drawer-body { padding: 24rpx; padding-bottom: calc(24rpx + 180rpx); overflow-y: auto; flex: 1; }
.buddy-loading, .buddy-empty { text-align: center; padding: 60rpx; font-size: 26rpx; color: #999; }
.buddy-list { display: flex; flex-direction: column; gap: 0;width: calc(100vw - 40rpx); }
.buddy-item {
  display: flex; align-items: center; gap: 16rpx;
  padding: 20rpx 0; border-bottom: 1rpx solid #F0F0F0;
}
.buddy-item:last-child { border-bottom: none; }
.buddy-avatar-wrap {
  width: 72rpx; height: 72rpx; border-radius: 50%; overflow: hidden;
  background: rgba(0, 180, 216, 0.1); display: flex; align-items: center; justify-content: center; flex-shrink: 0;
}
.buddy-avatar { width: 100%; height: 100%; }
.buddy-avatar-text { font-size: 32rpx; font-weight: 700; color: #00B4D8; }
.buddy-info { flex: 1; display: flex; flex-direction: column; gap: 4rpx; }
.buddy-name { font-size: 28rpx; font-weight: 600; color: #1A1A1A; }
.buddy-status { font-size: 22rpx; }
.buddy-status.status-1 { color: #00C853; }
.buddy-status.status-0 { color: #FF9800; }
.buddy-status.status-2 { color: #999999; }
.invite-tag {
  font-size: 24rpx; color: #9D4EDD; font-weight: 600;
  padding: 6rpx 20rpx; background: rgba(157,78,221,0.1); border-radius: 20rpx;
  margin-right: 8rpx;
}
</style>
