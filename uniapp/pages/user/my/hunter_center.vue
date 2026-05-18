<template>
  <view class="page">
    <custom-navbar title="达人中心" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabBarBottom + 'px' }">
      <!-- 数据统计卡片 -->
      <view class="stats-card">
        <view class="stat-item">
          <text class="stat-value">{{ stats.completed_orders || 0 }}</text>
          <text class="stat-label">完成订单</text>
        </view>
        <view class="stat-divider"></view>
        <view class="stat-item">
          <text class="stat-value primary">{{ stats.total_income || '0.00' }}</text>
          <text class="stat-label">累计收入(元)</text>
        </view>
        <view class="stat-divider"></view>
        <view class="stat-item">
          <text class="stat-value danger">{{ stats.balance || '0.00' }}</text>
          <text class="stat-label">可提现(元)</text>
        </view>
      </view>

      <!-- 提现按钮 -->
      <view class="withdraw-btn" @click="goWithdraw">
        <text class="withdraw-icon">💰</text>
        <text class="withdraw-text">申请提现</text>
      </view>

      <!-- 收益说明 -->
      <view class="tips-card">
        <text class="tips-title">💡 收益说明</text>
        <text class="tips-text">• 平台抽成15%，打手分成85%</text>
        <text class="tips-text">• 提现全额到账，收益自行申报个人所得税</text>
      </view>

      <!-- 搭子管理 -->
      <view class="section-title">👥 搭子管理</view>
      <view class="buddy-card">
        <view class="buddy-header">
          <text class="buddy-title">我的搭子</text>
          <text class="buddy-count">{{ buddyList.length }} 人</text>
        </view>

        <view v-if="buddyList.length === 0" class="buddy-empty">
          <text class="buddy-empty-text">暂无搭子，快去邀请吧</text>
        </view>

        <view v-for="buddy in buddyList" :key="buddy.id" class="buddy-item">
          <view class="buddy-avatar-wrap">
            <image v-if="buddy.buddy && buddy.buddy.avatar_url" :src="getImageUrl(buddy.buddy.avatar_url)" class="buddy-avatar" mode="aspectFill" />
            <text v-else class="buddy-avatar-text">{{ (buddy.buddy && buddy.buddy.nickname) ? buddy.buddy.nickname.charAt(0) : '?' }}</text>
          </view>
          <view class="buddy-info">
            <text class="buddy-name">{{ buddy.buddy ? buddy.buddy.nickname : '搭子' }}</text>
            <text class="buddy-status" :class="'status-' + buddy.status">{{ getBuddyStatusText(buddy.status) }}</text>
          </view>
          <text class="buddy-delete" @click="deleteBuddy(buddy.id)">删除</text>
        </view>

        <view class="buddy-actions">
          <view class="buddy-btn primary" @click="generateInviteCode">
            <text>📤 生成邀请码</text>
          </view>
          <view class="buddy-btn" @click="scanInviteCode">
            <text>📷 扫码添加</text>
          </view>
        </view>
      </view>

      <!-- 邀请码弹窗 -->
      <view v-if="showInviteModal" class="modal-mask" @click="closeInviteModal">
        <view class="modal-content invite-modal" @click.stop>
          <view class="modal-header">
            <text class="modal-title">邀请搭子</text>
            <text class="modal-close" @click="closeInviteModal">×</text>
          </view>
          <view class="modal-body center">
            <text class="invite-tip">让搭子扫码即可绑定</text>
            <view class="qrcode-wrap">
              <canvas canvas-id="inviteQrcode" id="inviteQrcode" class="qrcode-canvas" />
              <view v-if="!qrcodeTempPath" class="qrcode-placeholder">
                <text>生成中...</text>
              </view>
            </view>
            <text class="invite-code">{{ inviteCode || '生成中...' }}</text>
          </view>
        </view>
      </view>

      <!-- 注销身份 -->
      <view class="section-title danger-title">⚠️ 账号安全</view>
      <view class="danger-card" @click="showQuitConfirm">
        <text class="danger-icon">🚪</text>
        <view class="danger-content">
          <text class="danger-text">注销达人身份</text>
          <text class="danger-sub">注销后将无法接单和查看收益</text>
        </view>
        <text class="user-arrow">›</text>
      </view>

      <view style="height: 40rpx;"></view>
    </scroll-view>

    <custom-tabbar ref="tabbar" @tabbarReady="onTabbarReady" />
  </view>
</template>

<script>
import customNavbar from '@/components/custom-navbar/custom-navbar.vue'
import customTabbar from '@/components/custom-tabbar/custom-tabbar.vue'
import { USER_API, BUDDY_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { getImageUrl, showToast, showModal } from '@/utils/common.js'
import uQRCode from '@/utils/uqrcode.js'

export default {
  components: { customNavbar, customTabbar },
  data() {
    return {
      tabBarBottom: 0,
      userInfo: null,
      stats: {
        completed_orders: 0,
        total_income: '0.00',
        balance: '0.00',
      },
      buddyList: [],
      showInviteModal: false,
      inviteCode: '',
      qrcodeTempPath: '',
    }
  },

  onLoad() {
    this.loadData()
  },

  onShow() {
    this.loadData()
  },

  methods: {
    getImageUrl,

    onTabbarReady(bottomHeight) {
      this.tabBarBottom = bottomHeight
    },

    async loadData() {
      await Promise.all([
        this.loadUserInfo(),
        this.loadBuddyList(),
      ])
    },

    async loadUserInfo() {
      try {
        const res = await get(USER_API.current)
        this.userInfo = res || {}
        uni.setStorageSync('escort_user_info', this.userInfo)
        this.stats = {
          completed_orders: res.completed_orders || 0,
          total_income: res.total_income || '0.00',
          balance: res.balance || '0.00',
        }
      } catch (e) {
        console.error('获取用户信息失败', e)
      }
    },

    async loadBuddyList() {
      try {
        const res = await get(BUDDY_API.my)
        this.buddyList = Array.isArray(res) ? res : (res && res.results) || []
      } catch (e) {
        console.error('获取搭子列表失败', e)
      }
    },

    goWithdraw() {
      uni.navigateTo({ url: '/pages/user/my/withdraw' })
    },

    getBuddyStatusText(status) {
      const map = { 0: '待确认', 1: '活跃', 2: '已删除' }
      return map[status] || '未知'
    },

    async generateInviteCode() {
      uni.showLoading({ title: '生成中...' })
      try {
        const res = await post(BUDDY_API.generateCode, {})
        const code = res.code || res.invite_code || ''
        this.inviteCode = code
        this.qrcodeTempPath = ''
        this.showInviteModal = true
        // 等 canvas 渲染完毕再绘制
        this.$nextTick(() => {
          this.drawQrcode(code)
        })
      } catch (e) {
        showToast(e.msg || '生成邀请码失败')
        this.closeInviteModal()
      } finally {
        uni.hideLoading()
      }
    },

    drawQrcode(text) {
      const size = 320
      uQRCode.make({
        canvasId: 'inviteQrcode',
        text: text,
        size: size,
        margin: 16,
        backgroundColor: '#FFFFFF',
        foregroundColor: '#9D4EDD',
        correctLevel: 3,
        success: (tempFilePath) => {
          this.qrcodeTempPath = tempFilePath
        },
        fail: (err) => {
          console.error('二维码绘制失败', err)
          this.qrcodeTempPath = ''
        },
      })
    },

    closeInviteModal() {
      this.showInviteModal = false
      this.inviteCode = ''
      this.qrcodeTempPath = ''
    },

    scanInviteCode() {
      uni.scanCode({
        onlyFromCamera: true,
        success: async (res) => {
          const code = res.result || res.code
          if (!code) {
            showToast('扫码内容为空')
            return
          }
          uni.showLoading({ title: '绑定中...' })
          try {
            await post(BUDDY_API.bind, { code })
            showToast('绑定成功', 'success')
            this.loadBuddyList()
          } catch (e) {
            showToast(e.msg || '绑定失败')
          } finally {
            uni.hideLoading()
          }
        },
        fail: (e) => {
          if (e.errMsg !== 'scanCode:fail cancel') {
            showToast('扫码失败')
          }
        }
      })
    },

    async deleteBuddy(id) {
      const res = await showModal({ title: '确认', content: '确定要删除该搭子吗？' })
      if (!res.confirm) return
      try {
        await post(BUDDY_API.removeBuddy(id), {})
        showToast('删除成功', 'success')
        this.loadBuddyList()
      } catch (e) {
        showToast(e.msg || '删除失败')
      }
    },

    async showQuitConfirm() {
      const res = await showModal({
        title: '注销达人身份',
        content: '确定要注销达人身份吗？注销后将无法接单和查看收益，确定注销？'
      })
      if (!res.confirm) return

      // 二次确认
      const res2 = await showModal({
        title: '再次确认',
        content: '此操作不可恢复，确定要继续吗？'
      })
      if (!res2.confirm) return

      uni.showLoading({ title: '注销中...' })
      try {
        await post(BUDDY_API.quitHunter, {})
        showToast('注销成功', 'success')
        uni.reLaunch({ url: '/pages/index/index' })
      } catch (e) {
        showToast(e.msg || '注销失败')
      } finally {
        uni.hideLoading()
      }
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; background: #F5F5F5; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.stats-card {
  display: flex; align-items: center;
  margin: 20rpx 24rpx; padding: 32rpx 24rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8; border-radius: 20rpx;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05);
}
.stat-item { flex: 1; display: flex; flex-direction: column; align-items: center; gap: 8rpx; }
.stat-value { font-size: 40rpx; font-weight: 700; color: #1A1A1A; }
.stat-value.primary { color: #00B4D8; }
.stat-value.danger { color: #FF3366; }
.stat-label { font-size: 22rpx; color: #999999; }
.stat-divider { width: 1rpx; height: 60rpx; background: #E8E8E8; }

.withdraw-btn {
  display: flex; align-items: center; justify-content: center; gap: 12rpx;
  margin: 0 24rpx 24rpx; padding: 28rpx;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  border-radius: 40rpx;
  box-shadow: 0 4rpx 16rpx rgba(0, 180, 216, 0.3);
}
.withdraw-icon { font-size: 32rpx; }
.withdraw-text { font-size: 32rpx; font-weight: 700; color: #FFFFFF; }

.tips-card {
  margin: 0 24rpx 24rpx; padding: 24rpx;
  background: rgba(0, 180, 216, 0.08); border-radius: 16rpx; border: 1rpx solid rgba(0, 180, 216, 0.2);
}
.tips-title { font-size: 26rpx; font-weight: 600; color: #00B4D8; display: block; margin-bottom: 12rpx; }
.tips-text { font-size: 24rpx; color: #666666; display: block; line-height: 1.8; }

.section-title {
  font-size: 28rpx; font-weight: 700; color: #1A1A1A;
  padding: 20rpx 24rpx 12rpx;
}
.danger-title { color: #FF3366; }

.buddy-card {
  margin: 0 24rpx 24rpx; padding: 24rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8; border-radius: 20rpx;
}
.buddy-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20rpx; }
.buddy-title { font-size: 28rpx; font-weight: 600; color: #1A1A1A; }
.buddy-count { font-size: 24rpx; color: #999999; }

.buddy-empty { padding: 40rpx 0; text-align: center; }
.buddy-empty-text { font-size: 26rpx; color: #999999; }

.buddy-item {
  display: flex; align-items: center; gap: 16rpx;
  padding: 16rpx 0; border-bottom: 1rpx solid #F0F0F0;
}
.buddy-item:last-of-type { border-bottom: none; }
.buddy-avatar-wrap { width: 72rpx; height: 72rpx; border-radius: 50%; overflow: hidden; background: rgba(0, 180, 216, 0.1); display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.buddy-avatar { width: 100%; height: 100%; }
.buddy-avatar-text { font-size: 32rpx; font-weight: 700; color: #00B4D8; }
.buddy-info { flex: 1; display: flex; flex-direction: column; gap: 4rpx; }
.buddy-name { font-size: 28rpx; font-weight: 600; color: #1A1A1A; }
.buddy-status { font-size: 22rpx; }
.buddy-status.status-1 { color: #00C853; }
.buddy-status.status-0 { color: #FF9800; }
.buddy-status.status-2 { color: #999999; }
.buddy-delete { font-size: 24rpx; color: #FF3366; padding: 8rpx 16rpx; }

.buddy-actions { display: flex; gap: 16rpx; margin-top: 20rpx; }
.buddy-btn {
  flex: 1; display: flex; align-items: center; justify-content: center;
  padding: 20rpx; border-radius: 16rpx; background: #F5F5F5;
  font-size: 26rpx; color: #1A1A1A; font-weight: 600;
}
.buddy-btn.primary { background: linear-gradient(135deg, #9D4EDD, #6B21A8); color: #FFFFFF; }

.danger-card {
  display: flex; align-items: center; gap: 16rpx;
  margin: 0 24rpx; padding: 28rpx 24rpx;
  background: #FFFFFF; border: 1rpx solid #FFE5E5; border-radius: 20rpx;
}
.danger-icon { font-size: 36rpx; }
.danger-content { flex: 1; display: flex; flex-direction: column; gap: 4rpx; }
.danger-text { font-size: 28rpx; font-weight: 600; color: #FF3366; }
.danger-sub { font-size: 22rpx; color: #999999; }
.user-arrow { font-size: 48rpx; color: #CCCCCC; }

.modal-mask {
  position: fixed; top: 0; left: 0; right: 0; bottom: 0;
  background: rgba(0, 0, 0, 0.5); z-index: 999;
  display: flex; align-items: center; justify-content: center;
}
.modal-content {
  width: 600rpx; background: #FFFFFF; border-radius: 24rpx; overflow: hidden;
}
.modal-header {
  display: flex; align-items: center; justify-content: space-between;
  padding: 32rpx; border-bottom: 1rpx solid #F0F0F0;
}
.modal-title { font-size: 32rpx; font-weight: 700; color: #1A1A1A; }
.modal-close { font-size: 48rpx; color: #999999; line-height: 1; }
.modal-body { padding: 32rpx; }
.modal-body.center { display: flex; flex-direction: column; align-items: center; gap: 20rpx; }
.invite-tip { font-size: 26rpx; color: #666666; }
.qrcode-wrap {
  width: 400rpx; height: 400rpx;
  background: #F5F5F5; border-radius: 16rpx;
  display: flex; align-items: center; justify-content: center;
  overflow: hidden;
}
.qrcode-canvas { width: 400rpx; height: 400rpx; }
.qrcode-placeholder { font-size: 26rpx; color: #999999; }
.invite-code { font-size: 28rpx; color: #9D4EDD; font-weight: 700; letter-spacing: 4rpx; }
</style>
