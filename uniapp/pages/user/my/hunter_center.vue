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
              <canvas canvas-id="inviteQrcode" id="inviteQrcode" :width="200" :height="200" style="width: 200px; height: 200px;" />
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
      console.log('==== 加载搭子列表 ====')
      try {
        const res = await get(BUDDY_API.my)
        console.log('my接口返回:', JSON.stringify(res))
        this.buddyList = Array.isArray(res) ? res : (res && res.results) || []
        console.log('buddyList赋值后:', JSON.stringify(this.buddyList))
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

    async     generateInviteCode() {
      console.log('==== 生成邀请码 ====')
      uni.showLoading({ title: '生成中...' })
      try {
        const res = await post(BUDDY_API.generateCode, {})
        console.log('generateCode返回:', JSON.stringify(res))
        const code = res.code || res.invite_code || ''
        this.inviteCode = code
        this.qrcodeTempPath = ''
        this.showInviteModal = true
        this.$nextTick(() => {
          const info = this.userInfo || {}
          const expire = Math.floor(Date.now() / 1000) + 600 // 10分钟后过期
          const qrText = `BIND:code=${code}&expire=${expire}&uid=${info.id || ''}`
          console.log('QR内容:', qrText)
          this.drawQrcode(qrText)
        })
      } catch (e) {
        console.error('generateCode报错:', JSON.stringify(e))
        showToast(e.msg || '生成邀请码失败')
        this.closeInviteModal()
      } finally {
        uni.hideLoading()
      }
    },

    drawQrcode(text) {
      console.log('drawQrcode 被调用，text=', text)
      const size = 200
      const logoUrl = 'https://hctht-ogn-1410707956.cos.ap-shanghai.myqcloud.com/xcx/%E6%98%9F%E9%99%85%E6%80%AA%E5%85%BDlo.png'
      const logoSize = 40 // logo 宽高
      const logoRadius = 8

      const ctx = uni.createCanvasContext('inviteQrcode')

      let instance
      try {
        instance = new uQRCode.QRCode(0, 3)
        instance.addData(uQRCode.utf16To8(text))
        instance.make()
      } catch(e) {
        console.error('QR生成失败', e)
        return
      }

      const tileW = (size - 20) / instance.getModuleCount()
      const tileH = tileW

      // 1. 画白底
      ctx.setFillStyle('#FFFFFF')
      ctx.fillRect(0, 0, size, size)

      // 2. 画二维码模块
      ctx.setFillStyle('#000000')
      for (let row = 0; row < instance.getModuleCount(); row++) {
        for (let col = 0; col < instance.getModuleCount(); col++) {
          if (instance.isDark(row, col)) {
            const x = Math.round(col * tileW) + 10
            const y = Math.round(row * tileH) + 10
            const w = Math.ceil((col + 1) * tileW) - Math.floor(col * tileW)
            const h = Math.ceil((row + 1) * tileH) - Math.floor(row * tileH)
            ctx.fillRect(x, y, w, h)
          }
        }
      }

      // 3. 画白色圆角矩形背景（logo 区域）
      const center = size / 2
      const bgX = center - logoSize / 2 - 6
      const bgY = center - logoSize / 2 - 6
      const bgW = logoSize + 12
      const bgH = logoSize + 12
      ctx.setFillStyle('#FFFFFF')
      this._roundRect(ctx, bgX, bgY, bgW, bgH, logoRadius + 2)
      ctx.fill()

      // 4. 下载 logo 并绘制
      uni.downloadFile({
        url: logoUrl,
        success: (res) => {
          console.log('logo 下载成功', res.tempFilePath)
          // 画 logo（圆角裁切用遮罩实现）
          ctx.save()
          this._roundRect(ctx, center - logoSize / 2, center - logoSize / 2, logoSize, logoSize, logoRadius)
          ctx.clip()
          ctx.drawImage(res.tempFilePath, center - logoSize / 2, center - logoSize / 2, logoSize, logoSize)
          ctx.restore()
          ctx.draw(false, () => {
            setTimeout(() => {
              uni.canvasToTempFilePath({
                canvasId: 'inviteQrcode',
                fileType: 'png',
                destWidth: size,
                destHeight: size,
                quality: 1,
                success: (ret) => {
                  console.log('导出成功', ret.tempFilePath)
                  this.qrcodeTempPath = ret.tempFilePath
                },
                fail: (err) => {
                  console.error('导出失败', err)
                  this.qrcodeTempPath = ''
                },
              })
            }, 200)
          })
        },
        fail: (err) => {
          console.error('logo 下载失败', err)
          // 无 logo 时直接导出纯二维码
          ctx.draw(false, () => {
            setTimeout(() => {
              uni.canvasToTempFilePath({
                canvasId: 'inviteQrcode',
                fileType: 'png',
                destWidth: size,
                destHeight: size,
                quality: 1,
                success: (ret) => {
                  this.qrcodeTempPath = ret.tempFilePath
                },
                fail: () => {
                  this.qrcodeTempPath = ''
                },
              })
            }, 200)
          })
        },
      })
    },

    _roundRect(ctx, x, y, w, h, r) {
      ctx.beginPath()
      ctx.moveTo(x + r, y)
      ctx.lineTo(x + w - r, y)
      ctx.quadraticCurveTo(x + w, y, x + w, y + r)
      ctx.lineTo(x + w, y + h - r)
      ctx.quadraticCurveTo(x + w, y + h, x + w - r, y + h)
      ctx.lineTo(x + r, y + h)
      ctx.quadraticCurveTo(x, y + h, x, y + h - r)
      ctx.lineTo(x, y + r)
      ctx.quadraticCurveTo(x, y, x + r, y)
      ctx.closePath()
    },

    closeInviteModal() {
      this.showInviteModal = false
      this.inviteCode = ''
      this.qrcodeTempPath = ''
    },

    scanInviteCode() {
      console.log('==== 扫码开始 ====')
      uni.scanCode({
        onlyFromCamera: true,
        success: async (res) => {
          console.log('scanCode success:', JSON.stringify(res))
          const raw = res.result || res.code || ''
          console.log('原始扫码内容:', raw)
          if (!raw) {
            showToast('扫码内容为空')
            return
          }
          try {
            const raw = res.result || res.code || ''
            console.log('原始扫码内容:', raw)
            if (!raw) {
              showToast('扫码内容为空')
              return
            }
            // 解析 BIND:code=XXX&expire=XXX&uid=XXX 格式
            let code, expire, uid
            if (raw.startsWith('BIND:')) {
              const params = raw.slice(5).split('&')
              params.forEach(p => {
                const [k, v] = p.split('=')
                if (k === 'code') code = v
                if (k === 'expire') expire = parseInt(v || '0')
                if (k === 'uid') uid = v
              })
            } else {
              try {
                const url = new URL(raw)
                code = url.searchParams.get('code')
                expire = parseInt(url.searchParams.get('expire') || '0')
                uid = url.searchParams.get('uid')
              } catch (_) {
                showToast('无效的邀请码')
                return
              }
            }
            console.log('解析参数: code=', code, 'expire=', expire, 'uid=', uid)
            if (!code || !expire || !uid) {
              showToast('无效的邀请码')
              return
            }
            const now = Math.floor(Date.now() / 1000)
            if (now > expire) {
              showToast('邀请码已过期，请重新生成')
              return
            }
            uni.showLoading({ title: '绑定中...' })
            const result = await post(BUDDY_API.bind, { code, expire, uid })
            console.log('bind接口返回:', JSON.stringify(result))
            showToast('绑定成功', 'success')
            this.loadBuddyList()
          } catch (e) {
            console.error('扫码处理异常:', JSON.stringify(e))
            showToast(e.msg || e.message || '绑定失败')
          } finally {
            uni.hideLoading()
          }
        },
        fail: (e) => {
          console.error('scanCode fail:', JSON.stringify(e))
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
  width: 240px; height: 240px;
  background: #FFFFFF; border-radius: 16rpx;
  display: flex; align-items: center; justify-content: center;
  overflow: hidden;
  border: 2rpx solid #E8E8E8;
  padding: 20px;
}
.qrcode-canvas { }
.qrcode-placeholder { font-size: 26rpx; color: #999999; }
.invite-code { font-size: 28rpx; color: #9D4EDD; font-weight: 700; letter-spacing: 4rpx; }
</style>
