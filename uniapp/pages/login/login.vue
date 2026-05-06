<template>
  <view class="login-container">
    <!-- 背景装饰 -->
    <view class="bg-decoration">
      <view class="circle c1"></view>
      <view class="circle c2"></view>
      <view class="circle c3"></view>
    </view>

    <!-- Logo 区域 -->
    <view class="logo-area">
      <image class="logo" src="/static/logo.png" mode="aspectFit" />
      <text class="app-name">粥一把</text>
      <text class="app-slogan">专业游戏陪玩平台</text>
    </view>

    <!-- 登录按钮区域 -->
    <view class="login-area">
      <!-- 步骤1：微信授权手机号 -->
      <button
        v-if="!loading && step === 'phone'"
        class="wx-login-btn"
        type="primary"
        open-type="getPhoneNumber"
        @getphonenumber="onGetPhoneNumber"
      >
        <text class="btn-icon">📱</text>
        微信一键登录
      </button>

      <!-- 步骤2：静默登录（已有手机号缓存） -->
      <button
        v-if="!loading && step === 'silent'"
        class="wx-login-btn silent"
        type="primary"
        @click="onSilentLogin"
      >
        <text class="btn-icon">🔑</text>
        微信快速登录
      </button>

      <!-- 加载中 -->
      <view v-if="loading" class="loading-wrap">
        <view class="spinner"></view>
        <text class="loading-text">登录中...</text>
      </view>
    </view>

    <!-- 协议 -->
    <view class="agreement">
      <text class="agreement-text">
        登录即表示同意
        <text class="link" @click="showAgreement('user')">《用户协议》</text>
        和
        <text class="link" @click="showAgreement('privacy')">《隐私政策》</text>
      </text>
    </view>
  </view>
</template>

<script>
import { AUTH_API } from '@/config/api.js'
import { post, setToken } from '@/utils/request.js'
import { setUserInfo, getEscortPhone, showToast } from '@/utils/common.js'

export default {
  data() {
    return {
      loading: false,
      step: 'phone',   // 'phone' | 'silent'
      loginCode: '',   // 缓存 wx.login() 的 code
    }
  },

  onShow() {
    // 已登录直接跳转
    const token = uni.getStorageSync('escort_token')
    if (token) {
      uni.reLaunch({ url: '/pages/index/index' })
      return
    }
    // 根据是否有缓存手机号，决定展示哪个登录按钮
    const phone = getEscortPhone()
    this.step = phone ? 'silent' : 'phone'
  },

  methods: {
    _wxLogin() {
      return new Promise((resolve) => {
        uni.login({
          provider: 'weixin',
          success: (res) => resolve(res),
          fail: () => resolve({ code: '' }),
        })
      })
    },

    async onGetPhoneNumber(e) {
      const loginRes = await this._wxLogin()
      if (!loginRes.code) {
        showToast('获取登录凭证失败')
        return
      }
      this.loginCode = loginRes.code

      const { detail } = e
      if (!detail.code) {
        showToast('已改为快速登录')
        this.step = 'silent'
        return
      }

      await this._doLogin({ code: this.loginCode, phone_code: detail.code })
    },

    async onSilentLogin() {
      const loginRes = await this._wxLogin()
      if (!loginRes.code) {
        showToast('获取登录凭证失败')
        return
      }
      this.loginCode = loginRes.code
      const cachedPhone = getEscortPhone()
      await this._doLogin({ code: this.loginCode, phone: cachedPhone })
    },

    async _doLogin(payload) {
      this.loading = true
      try {
        const res = await post(AUTH_API.login, payload, false)
        const token = res && (res.token || res.access)
        if (!token) {
          showToast('登录失败，请重试')
          return
        }

        const userInfo = res && (res.user_info || res.userInfo || res)
        setToken(token)

        if (userInfo && typeof userInfo === 'object') {
          setUserInfo(userInfo)
          if (userInfo.phone) {
            uni.setStorageSync('escort_phone', userInfo.phone)
          }
        }

        showToast('登录成功', 'success')
        setTimeout(() => {
          uni.$emit('loginSuccess')
          uni.reLaunch({ url: '/pages/index/index' })
        }, 800)
      } catch (err) {
        console.error('登录失败', err)
      } finally {
        this.loading = false
      }
    },

    showAgreement(type) {
      uni.showModal({
        title: type === 'user' ? '用户协议' : '隐私政策',
        content: '此处显示协议内容（需后台配置）',
        showCancel: false,
      })
    },
  },
}
</script>

<style scoped>
.login-container {
  min-height: 100vh;
  background: linear-gradient(135deg, #00B4D8 0%, #00C853 100%);
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 0 80rpx;
  position: relative;
  overflow: hidden;
}

/* 背景装饰圆 */
.bg-decoration {
  position: absolute;
  inset: 0;
  pointer-events: none;
}
.circle { position: absolute; border-radius: 50%; background: rgba(255, 255, 255, 0.15); }
.c1 { width: 600rpx; height: 600rpx; top: -200rpx; right: -160rpx; }
.c2 { width: 400rpx; height: 400rpx; top: 700rpx; left: -120rpx; }
.c3 { width: 300rpx; height: 300rpx; bottom: 400rpx; right: -80rpx; }

/* Logo 区域 */
.logo-area {
  margin-top: 200rpx;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.logo {
  width: 160rpx;
  height: 160rpx;
  border-radius: 40rpx;
  background: rgba(255, 255, 255, 0.9);
  margin-bottom: 24rpx;
}
.app-name { font-size: 56rpx; font-weight: 700; color: #fff; margin-bottom: 12rpx; }
.app-slogan { font-size: 28rpx; color: rgba(255, 255, 255, 0.8); }

/* 登录区域 */
.login-area {
  margin-top: 160rpx;
  width: 100%;
}
.wx-login-btn {
  width: 100%;
  height: 96rpx;
  background: rgba(255, 255, 255, 0.95);
  border-radius: 48rpx;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 32rpx;
  font-weight: 600;
  color: #333;
  border: none;
  box-shadow: 0 4rpx 20rpx rgba(0, 0, 0, 0.15);
}
.wx-login-btn::after { border: none; }
.wx-login-btn.silent {
  background: linear-gradient(135deg, #7C3AED, #A78BFA);
  color: #fff;
}
.btn-icon { margin-right: 12rpx; font-size: 36rpx; }

/* 加载动画 */
.loading-wrap {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 16rpx;
}
.spinner {
  width: 64rpx;
  height: 64rpx;
  border: 6rpx solid rgba(255, 255, 255, 0.3);
  border-top-color: #fff;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}
@keyframes spin {
  to { transform: rotate(360deg); }
}
.loading-text {
  font-size: 28rpx;
  color: rgba(255, 255, 255, 0.9);
}

/* 协议 */
.agreement {
  position: absolute;
  bottom: 80rpx;
  left: 0;
  right: 0;
  text-align: center;
}
.agreement-text { font-size: 24rpx; color: rgba(255, 255, 255, 0.7); }
.link { color: #FFD700; }
</style>
