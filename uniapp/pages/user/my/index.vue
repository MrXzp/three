<template>
  <view class="page">
    <custom-navbar title="我的" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabBarBottom + 'px' }">
      <view class="user-card" @click="openEditModal">
        <view class="avatar-wrap">
          <image v-if="userInfo && userInfo.avatar_url" :src="getImageUrl(userInfo.avatar_url)" class="avatar" mode="aspectFill" />
          <text v-else class="avatar-text">{{ (userInfo && userInfo.nickname) ? userInfo.nickname.charAt(0) : '?' }}</text>
          <view class="avatar-edit-icon">✏️</view>
        </view>
        <view class="user-info">
          <text class="user-name">{{ userInfo ? userInfo.nickname : '未登录' }}</text>
          <view class="hunter-badge" v-if="isHunter">🎖️ 认证打手</view>
          <text class="user-phone">{{ userInfo && userInfo.phone ? userInfo.phone : '登录后获取完整功能' }}</text>
        </view>
        <text class="user-arrow">›</text>
      </view>

      <!-- 达人中心入口（仅认证打手显示） -->
      <view v-if="isHunter" class="hunter-entrance" @click="goHunterCenter">
        <view class="hunter-entrance-left">
          <text class="hunter-entrance-icon">🎯</text>
          <text class="hunter-entrance-text">达人中心</text>
        </view>
        <text class="user-arrow">›</text>
      </view>

      <view class="balance-row">
        <view class="balance-item" @click="goWithdraw">
          <text class="balance-value">¥{{ userInfo ? userInfo.balance || '0.00' : '0.00' }}</text>
          <text class="balance-label">我的余额</text>
        </view>
        <view class="balance-divider"></view>
        <view class="balance-item" @click="goWithdraw">
          <text class="balance-value">¥{{ userInfo ? userInfo.total_income || '0.00' : '0.00' }}</text>
          <text class="balance-label">累计收入</text>
        </view>
      </view>

      <view class="menu-list">
        <view class="menu-item" @click="goRefundList">
          <text class="menu-icon">💰</text>
          <text class="menu-text">退款记录</text>
          <text class="menu-arrow">›</text>
        </view>
        <view class="menu-item" @click="goApplyHunter">
          <text class="menu-icon">⚔️</text>
          <text class="menu-text">{{ getHunterBtnText() }}</text>
          <text class="menu-arrow">›</text>
        </view>
        <view class="menu-item logout" @click="logout">
          <text class="menu-icon">🚪</text>
          <text class="menu-text">退出登录</text>
          <text class="menu-arrow">›</text>
        </view>
      </view>
    </scroll-view>

    <!-- 编辑用户信息弹窗 -->
    <view v-if="showEditModal" class="modal-mask" @click="closeEditModal">
      <view class="modal-content" @click.stop>
        <view class="modal-header">
          <text class="modal-title">编辑资料</text>
          <text class="modal-close" @click="closeEditModal">×</text>
        </view>
        <view class="modal-body">
          <!-- 头像 -->
          <view class="edit-item">
            <text class="edit-label">头像</text>
            <view class="avatar-edit-wrap">
              <image v-if="editForm.avatar_url" :src="getImageUrl(editForm.avatar_url)" class="edit-avatar" mode="aspectFill" />
              <text v-else class="edit-avatar-text">{{ editForm.nickname ? editForm.nickname.charAt(0) : '?' }}</text>
              <text class="avatar-tip" @click="chooseAvatar">点击更换</text>
            </view>
          </view>
          <!-- 昵称 -->
          <view class="edit-item">
            <text class="edit-label">昵称</text>
            <input class="edit-input" v-model="editForm.nickname" placeholder="请输入昵称" maxlength="20" />
          </view>
          <!-- 真实姓名 -->
          <view class="edit-item">
            <text class="edit-label">真实姓名</text>
            <input class="edit-input" v-model="editForm.real_name" placeholder="请输入真实姓名（选填）" maxlength="20" />
          </view>
        </view>
        <view class="modal-footer">
          <text class="btn-cancel" @click="closeEditModal">取消</text>
          <text class="btn-save" @click="saveUserInfo">保存</text>
        </view>
      </view>
    </view>

    <custom-tabbar ref="tabbar" @tabbarReady="onTabbarReady" />
  </view>
</template>

<script>
import customNavbar from '@/components/custom-navbar/custom-navbar.vue'
import customTabbar from '@/components/custom-tabbar/custom-tabbar.vue'
import { USER_API, UPLOAD_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { getImageUrl, showToast } from '@/utils/common.js'

export default {
  components: { customNavbar, customTabbar },
  data() {
    return {
      tabBarBottom: 0,
      userInfo: null, loading: false,
      showEditModal: false,
      editForm: {
        nickname: '',
        real_name: '',
        avatar_url: '',
      },
    }
  },

  computed: {
    isHunter() {
      // hunter_status: 0=未申请, 1=审核中, 2=已通过, 3=已拒绝, 4=已暂停
      return this.userInfo && this.userInfo.hunter_status === 2
    }
  },

  onLoad() {
    this.loadUserInfo()
  },

  onShow() {
    this.loadUserInfo()
  },

  methods: {
    getImageUrl,

    onTabbarReady(bottomHeight) {
      this.tabBarBottom = bottomHeight
    },

    checkLogin() {
      const token = uni.getStorageSync('escort_token')
      if (!token) uni.reLaunch({ url: '/pages/login/login' })
    },

    async loadUserInfo() {
      const token = uni.getStorageSync('escort_token')
      if (!token) return
      try {
        this.userInfo = await get(USER_API.current)
        uni.setStorageSync('escort_user_info', this.userInfo)
      } catch (e) { /* not logged in */ }
    },

    // 打开编辑弹窗
    openEditModal() {
      this.checkLogin()
      if (!this.userInfo) return
      this.editForm = {
        nickname: this.userInfo.nickname || '',
        real_name: this.userInfo.real_name || '',
        avatar_url: this.userInfo.avatar_url || '',
      }
      this.showEditModal = true
    },

    // 关闭编辑弹窗
    closeEditModal() {
      this.showEditModal = false
    },

    // 选择头像
    chooseAvatar() {
      uni.chooseImage({
        count: 1,
        sizeType: ['compressed'],
        sourceType: ['album', 'camera'],
        success: (res) => {
          const tempFilePath = res.tempFilePaths[0]
          this.uploadAvatar(tempFilePath)
        }
      })
    },

    // 上传头像
    async uploadAvatar(filePath) {
      uni.showLoading({ title: '上传中...' })
      try {
        const token = uni.getStorageSync('escort_token')
        const res = await new Promise((resolve, reject) => {
          uni.uploadFile({
            url: UPLOAD_API.upload,
            filePath: filePath,
            name: 'file',
            header: {
              'Authorization': `Bearer ${token}`
            },
            success: (uploadRes) => {
              try {
                const data = JSON.parse(uploadRes.data)
                if (data.code === 2000 && data.data && data.data.url) {
                  resolve(data.data.url)
                } else {
                  reject(new Error(data.msg || '上传失败'))
                }
              } catch (e) {
                reject(new Error('解析响应失败'))
              }
            },
            fail: (err) => {
              reject(err)
            }
          })
        })
        this.editForm.avatar_url = res
        showToast('头像上传成功', 'success')
      } catch (e) {
        showToast(e.message || '上传失败')
      } finally {
        uni.hideLoading()
      }
    },

    // 保存用户信息
    async saveUserInfo() {
      if (!this.editForm.nickname || !this.editForm.nickname.trim()) {
        showToast('请输入昵称')
        return
      }
      uni.showLoading({ title: '保存中...' })
      try {
        await post(USER_API.updateInfo, {
          nickname: this.editForm.nickname.trim(),
          real_name: this.editForm.real_name.trim(),
          avatar_url: this.editForm.avatar_url,
        })
        showToast('保存成功', 'success')
        this.closeEditModal()
        await this.loadUserInfo()
      } catch (e) {
        showToast(e.msg || '保存失败')
      } finally {
        uni.hideLoading()
      }
    },

    goHunterCenter() {
      uni.navigateTo({ url: '/pages/user/my/hunter_center' })
    },

    goWithdraw() {
      this.checkLogin()
      uni.navigateTo({ url: '/pages/user/my/withdraw' })
    },

    goRefundList() {
      this.checkLogin()
      uni.navigateTo({ url: '/pages/user/order/refund-list' })
    },

    goApplyHunter() {
      this.checkLogin()
      // 已经是陪玩达人，跳转到接单大厅
      if (this.isHunter) {
        uni.switchTab({ url: '/pages/handler/index/index' })
        return
      }
      // 未申请/已拒绝/审核中/已暂停，跳转到申请页面
      uni.navigateTo({ url: '/pages/user/my/apply_hunter' })
    },

    getHunterBtnText() {
      if (!this.userInfo) return '成为陪玩达人'
      const statusMap = {
        0: '成为陪玩达人',
        1: '审核中...',
        2: '去接单',
        3: '重新申请',
        4: '重新申请'
      }
      return statusMap[this.userInfo.hunter_status] || '成为陪玩达人'
    },

    logout() {
      uni.showModal({
        title: '确认退出', content: '确定要退出登录吗？',
        success: (res) => {
          if (!res.confirm) return
          uni.removeStorageSync('escort_token')
          uni.removeStorageSync('escort_user_info')
          uni.removeStorageSync('escort_openid')
          uni.removeStorageSync('escort_phone')
          uni.reLaunch({ url: '/pages/login/login' })
        },
      })
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; background: #F5F5F5; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.user-card {
  display: flex; align-items: center; gap: 20rpx;
  padding: 40rpx 32rpx; margin: 20rpx 24rpx; border-radius: 24rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05);
}
.avatar-wrap { width: 100rpx; height: 100rpx; border-radius: 50%; overflow: hidden; background: rgba(0, 180, 216, 0.1); flex-shrink: 0; display: flex; align-items: center; justify-content: center; position: relative; }
.avatar { width: 100%; height: 100%; }
.avatar-text { font-size: 48rpx; font-weight: 700; color: #00B4D8; }
.avatar-edit-icon { position: absolute; bottom: -4rpx; right: -4rpx; font-size: 20rpx; background: #fff; border-radius: 50%; width: 32rpx; height: 32rpx; display: flex; align-items: center; justify-content: center; box-shadow: 0 2rpx 4rpx rgba(0,0,0,0.1); }
.user-info { flex: 1; display: flex; flex-direction: column; gap: 8rpx; }
.user-name { font-size: 36rpx; font-weight: 700; color: #1A1A1A; }
.user-phone { font-size: 24rpx; color: #999999; }
.user-arrow { font-size: 48rpx; color: #CCCCCC; }

.balance-row {
  display: flex; align-items: center;
  margin: 0 24rpx 24rpx; padding: 24rpx 0;
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx;
}
.balance-item { flex: 1; display: flex; flex-direction: column; align-items: center; gap: 8rpx; }
.balance-value { font-size: 40rpx; font-weight: 700; color: #FF3366; }
.balance-label { font-size: 22rpx; color: #999999; }
.balance-divider { width: 1rpx; height: 60rpx; background: #E8E8E8; }

.hunter-badge {
  display: inline-block;
  padding: 4rpx 16rpx;
  background: linear-gradient(135deg, #9D4EDD, #00B4D8);
  color: #FFFFFF;
  border-radius: 20rpx;
  font-size: 22rpx;
  font-weight: 600;
}
.hunter-entrance {
  display: flex; align-items: center; justify-content: space-between;
  margin: 0 24rpx 24rpx; padding: 28rpx 24rpx; border-radius: 20rpx;
  background: linear-gradient(135deg, #9D4EDD, #6B21A8);
  box-shadow: 0 4rpx 16rpx rgba(157, 78, 221, 0.3);
}
.hunter-entrance-left { display: flex; align-items: center; gap: 16rpx; }
.hunter-entrance-icon { font-size: 36rpx; }
.hunter-entrance-text { font-size: 30rpx; font-weight: 700; color: #FFFFFF; }
.menu-list { padding: 0 24rpx 24rpx; display: flex; flex-direction: column; gap: 16rpx; }
.menu-item {
  display: flex; align-items: center; gap: 16rpx;
  padding: 28rpx 24rpx; border-radius: 20rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
}
.menu-icon { font-size: 36rpx; }
.menu-text { flex: 1; font-size: 28rpx; color: #1A1A1A; }
.menu-arrow { font-size: 36rpx; color: #CCCCCC; }
.menu-item.logout .menu-text { color: #FF3366; }

/* 弹窗样式 */
.modal-mask {
  position: fixed; top: 0; left: 0; right: 0; bottom: 0;
  background: rgba(0, 0, 0, 0.5); z-index: 999;
  display: flex; align-items: center; justify-content: center;
}
.modal-content {
  width: 600rpx; background: #FFFFFF; border-radius: 24rpx;
  overflow: hidden;
}
.modal-header {
  display: flex; align-items: center; justify-content: space-between;
  padding: 32rpx; border-bottom: 1rpx solid #F0F0F0;
}
.modal-title { font-size: 32rpx; font-weight: 700; color: #1A1A1A; }
.modal-close { font-size: 48rpx; color: #999999; line-height: 1; }
.modal-body { padding: 32rpx; }
.edit-item { display: flex; align-items: flex-start; margin-bottom: 32rpx; }
.edit-item:last-child { margin-bottom: 0; }
.edit-label { width: 140rpx; font-size: 28rpx; color: #666666; flex-shrink: 0; padding-top: 8rpx; }
.edit-input {
  flex: 1; height: 72rpx; padding: 0 24rpx;
  background: #F5F5F5; border-radius: 12rpx;
  font-size: 28rpx; color: #1A1A1A;
}
.avatar-edit-wrap { flex: 1; display: flex; align-items: center; gap: 20rpx; }
.edit-avatar { width: 100rpx; height: 100rpx; border-radius: 50%; background: #F0F0F0; }
.edit-avatar-text { width: 100rpx; height: 100rpx; border-radius: 50%; background: rgba(0, 180, 216, 0.1); display: flex; align-items: center; justify-content: center; font-size: 48rpx; color: #00B4D8; font-weight: 700; }
.avatar-tip { font-size: 24rpx; color: #00B4D8; }
.modal-footer { display: flex; padding: 24rpx 32rpx; gap: 24rpx; border-top: 1rpx solid #F0F0F0; }
.btn-cancel, .btn-save {
  flex: 1; height: 80rpx; line-height: 80rpx; text-align: center;
  border-radius: 40rpx; font-size: 28rpx; font-weight: 600;
}
.btn-cancel { background: #F5F5F5; color: #666666; }
.btn-save { background: linear-gradient(135deg, #00B4D8, #00C853); color: #FFFFFF; }
</style>
