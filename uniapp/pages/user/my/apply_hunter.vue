<template>
  <view class="page">
    <custom-navbar title="申请陪玩达人" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx' }">
      <view v-if="userInfo && userInfo.hunter_status === 2" class="status-card success">
        <text class="status-icon">✅</text>
        <text class="status-text">您已是陪玩达人</text>
        <text class="status-desc">恭喜！您可以开始接单赚钱了</text>
      </view>
      <view v-else-if="userInfo && userInfo.hunter_status === 1" class="status-card pending">
        <text class="status-icon">⏳</text>
        <text class="status-text">申请审核中</text>
        <text class="status-desc">请耐心等待平台审核，通常1-3个工作日</text>
      </view>
      <view v-else-if="userInfo && userInfo.hunter_status === 3" class="status-card failed">
        <text class="status-icon">❌</text>
        <text class="status-text">申请被拒绝</text>
        <text class="status-desc">{{ userInfo.reject_reason || '请重新提交申请' }}</text>
      </view>

      <view v-if="!userInfo || userInfo.hunter_status === 0 || userInfo.hunter_status === 3" class="form-wrap">
        <view class="form-card">
          <text class="form-title">填写申请信息</text>
          <view class="form-row">
            <text class="form-label">真实姓名</text>
            <input class="form-input" v-model="form.real_name" placeholder="请输入真实姓名" placeholder-class="ph" />
          </view>
          <view class="form-row">
            <text class="form-label">身份证号</text>
            <input class="form-input" v-model="form.id_card" placeholder="请输入身份证号" placeholder-class="ph" maxlength="18" />
          </view>
          <view class="form-row" style="border:none">
            <text class="form-label">联系电话</text>
            <input class="form-input" v-model="form.phone" :placeholder="userInfo && userInfo.phone ? userInfo.phone : '请输入手机号'" placeholder-class="ph" />
          </view>
        </view>

        <view class="form-card">
          <text class="form-title">上传证件照片</text>
          <view class="id-card-upload">
            <view class="id-card-item" @click="chooseIdCardFront">
              <image v-if="form.id_card_front" :src="form.id_card_front" class="id-card-img" mode="aspectFill" />
              <view v-else class="id-card-placeholder">
                <text class="id-card-icon">📷</text>
                <text class="id-card-tip">点击上传</text>
              </view>
              <view class="id-card-label">身份证正面</view>
            </view>
            <view class="id-card-item" @click="chooseIdCardBack">
              <image v-if="form.id_card_back" :src="form.id_card_back" class="id-card-img" mode="aspectFill" />
              <view v-else class="id-card-placeholder">
                <text class="id-card-icon">📷</text>
                <text class="id-card-tip">点击上传</text>
              </view>
              <view class="id-card-label">身份证反面</view>
            </view>
          </view>
          <text class="id-card-hint">请确保照片清晰可辨，信息完整</text>
        </view>

        <view class="submit-btn" :class="{ disabled: submitting }" @click="handleSubmit">
          <text>{{ submitting ? '提交中...' : '提交申请' }}</text>
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script>
import { USER_API, UPLOAD_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { showToast } from '@/utils/common.js'

export default {
  data() {
    return {
      userInfo: null, submitting: false,
      form: { real_name: '', id_card: '', phone: '', id_card_front: '', id_card_back: '' },
    }
  },

  onLoad() {
    this.loadUserInfo()
  },

  methods: {
    async loadUserInfo() {
      try {
        this.userInfo = await get(USER_API.current)
        if (this.userInfo && this.userInfo.phone) this.form.phone = this.userInfo.phone
      } catch (e) { /* no data */ }
    },

    // 选择身份证正面
    chooseIdCardFront() {
      uni.chooseImage({
        count: 1,
        sizeType: ['compressed'],
        sourceType: ['album', 'camera'],
        success: (res) => {
          this.uploadIdCard(res.tempFilePaths[0], 'front')
        }
      })
    },

    // 选择身份证反面
    chooseIdCardBack() {
      uni.chooseImage({
        count: 1,
        sizeType: ['compressed'],
        sourceType: ['album', 'camera'],
        success: (res) => {
          this.uploadIdCard(res.tempFilePaths[0], 'back')
        }
      })
    },

    // 上传身份证照片
    async uploadIdCard(filePath, type) {
      uni.showLoading({ title: '上传中...' })
      try {
        const token = uni.getStorageSync('escort_token')
        const res = await new Promise((resolve, reject) => {
          uni.uploadFile({
            url: UPLOAD_API.upload,
            filePath: filePath,
            name: 'file',
            header: { 'Authorization': `Bearer ${token}` },
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
            fail: (err) => reject(err)
          })
        })
        if (type === 'front') {
          this.form.id_card_front = res
        } else {
          this.form.id_card_back = res
        }
        showToast('上传成功', 'success')
      } catch (e) {
        showToast(e.message || '上传失败')
      } finally {
        uni.hideLoading()
      }
    },

    handleSubmit() {
      if (!this.form.real_name.trim()) { showToast('请填写真实姓名', 'none'); return }
      if (!this.form.id_card.trim() || this.form.id_card.length < 15) { showToast('请填写正确的身份证号', 'none'); return }
      if (!this.form.id_card_front) { showToast('请上传身份证正面照片', 'none'); return }
      if (!this.form.id_card_back) { showToast('请上传身份证反面照片', 'none'); return }
      this.submitting = true
      post(USER_API.applyHunter, this.form).then(() => {
        showToast('申请已提交', 'success')
        uni.$emit('userInfoUpdate')
        setTimeout(() => uni.navigateBack(), 1200)
      }).catch(e => {
        showToast(e && e.msg ? e.msg : '提交失败')
      }).finally(() => { this.submitting = false })
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; width: 100%; background: #F5F5F5; box-sizing: border-box; }
.content { position: fixed; left: 0; right: 0; bottom: 0; overflow-y: auto; padding: 20rpx 24rpx; box-sizing: border-box; }

.status-card {
  display: flex; flex-direction: column; align-items: center; gap: 12rpx;
  padding: 48rpx; border-radius: 24rpx; margin-bottom: 32rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8; width: 100%; box-sizing: border-box;
}
.status-card.success { border-color: #00C853; background: rgba(0, 200, 83, 0.05); }
.status-card.pending { border-color: #FF9800; background: rgba(255, 152, 0, 0.05); }
.status-card.failed { border-color: #FF3366; background: rgba(255, 51, 102, 0.05); }
.status-icon { font-size: 64rpx; }
.status-text { font-size: 36rpx; font-weight: 700; color: #1A1A1A; }
.status-desc { font-size: 26rpx; color: #666666; text-align: center; }

.form-card {
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; padding: 0 24rpx; margin-bottom: 32rpx; width: 100%; box-sizing: border-box;
}
.form-title { font-size: 28rpx; font-weight: 700; color: #00B4D8; display: block; padding: 24rpx 0 8rpx; }
.form-row {
  display: flex; align-items: center; justify-content: space-between;
  padding: 28rpx 0; border-bottom: 1rpx solid #F0F0F0;
}
.form-label { font-size: 28rpx; color: #666666; flex-shrink: 0; }
.form-input { flex: 1; text-align: right; font-size: 28rpx; color: #1A1A1A; }
.ph { color: #999999; }

.id-card-upload { display: flex; gap: 24rpx; padding: 16rpx 0; }
.id-card-item { flex: 1; display: flex; flex-direction: column; align-items: center; gap: 12rpx; }
.id-card-img { width: 280rpx; height: 180rpx; border-radius: 16rpx; background: #F5F5F5; }
.id-card-placeholder {
  width: 280rpx; height: 180rpx; border-radius: 16rpx;
  background: #F5F5F5; border: 2rpx dashed #E0E0E0;
  display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 8rpx;
}
.id-card-icon { font-size: 48rpx; }
.id-card-tip { font-size: 22rpx; color: #999999; }
.id-card-label { font-size: 24rpx; color: #666666; }
.id-card-hint { font-size: 22rpx; color: #999999; display: block; padding-bottom: 16rpx; }

.submit-btn {
  height: 96rpx; line-height: 96rpx; text-align: center;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  border-radius: 48rpx; font-size: 32rpx; font-weight: 700; color: #FFFFFF;
  box-shadow: 0 4rpx 16rpx rgba(0, 180, 216, 0.3); width: 100%; box-sizing: border-box;
}
.submit-btn.disabled { opacity: 0.5; }
</style>
