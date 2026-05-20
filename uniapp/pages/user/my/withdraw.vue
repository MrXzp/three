<template>
  <view class="page">
    <custom-navbar title="提现申请" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabBarBottom + 'px' }">
      <!-- 未授权提示 -->
      <view class="auth-card" v-if="!authorized">
        <view class="auth-icon">🔐</view>
        <view class="auth-title">需要授权微信免确认收款</view>
        <view class="auth-desc">授权后，提现将自动到账，无需手动确认</view>
        <view class="auth-btn" @click="handleAuthorize">
          <text>去授权</text>
        </view>
      </view>

      <template v-else>
      <!-- 可提现余额 -->
      <view class="balance-card">
        <text class="balance-label">可提现余额</text>
        <text class="balance-value">¥{{ balance }}</text>
      </view>

      <!-- 提现金额 -->
      <view class="section-title">💰 提现金额</view>
      <view class="input-card">
        <text class="yuan">¥</text>
        <input class="amount-input" type="digit" v-model="amount" placeholder="0.00" placeholder-class="ph" @input="onAmountInput" />
      </view>

      <!-- 快捷金额按钮 -->
      <view class="quick-amounts">
        <view
          v-for="item in quickAmounts"
          :key="item.value"
          class="quick-btn"
          :class="{ active: amount == item.value, disabled: !item.enabled }"
          @click="item.enabled && setAmount(item.value)"
        >
          <text>{{ item.label }}</text>
        </view>
      </view>

      <!-- 费用说明 -->
      <view class="fee-card">
        <view class="fee-row total">
          <text class="fee-label">提现金额</text>
          <text class="fee-value primary">¥{{ amount || '0.00' }}</text>
        </view>
      </view>

      <!-- 说明 -->
      <view class="tips-card">
        <text class="tips-title">💡 提现说明</text>
        <text class="tips-item">• 平台将在1-3个工作日内完成处理</text>
        <text class="tips-item">• 单笔提现最低 ¥10，最高 ¥5000</text>
        <text class="tips-item">• 提现全额到账，收益自行申报个人所得税</text>
      </view>

      <!-- 提交按钮 -->
      <view class="submit-btn" :class="{ disabled: !canSubmit || submitting }" @click="handleSubmit">
        <text>{{ submitting ? '提交中...' : '立即提现' }}</text>
      </view>
      </template>
    </scroll-view>
  </view>
</template>

<script>
import { USER_API, WITHDRAWAL_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { showToast, showModal } from '@/utils/common.js'
import customNavbar from '@/components/custom-navbar/custom-navbar.vue'

const QUICK_VALUES = [100, 200, 400]
const MIN_AMOUNT = 0.1
const MAX_AMOUNT = 5000

export default {
  components: { customNavbar },
  data() {
    return {
      balance: '0.00',
      amount: '',
      submitting: false,
      tabBarBottom: 0,
      authorized: false,
      authorizing: false,
      pendingAuthId: '',
    }
  },

  computed: {
    balanceNum() {
      return parseFloat(this.balance) || 0
    },
    amountNum() {
      return parseFloat(this.amount) || 0
    },
    actualAmount() {
      return this.amountNum.toFixed(2)
    },
    quickAmounts() {
      const base = QUICK_VALUES.map(v => ({
        label: String(v),
        value: v,
        enabled: v <= this.balanceNum && this.balanceNum >= MIN_AMOUNT,
      }))
      const allVal = Math.min(this.balanceNum, MAX_AMOUNT)
      base.push({
        label: '全部',
        value: allVal > 0 ? allVal : this.balanceNum,
        enabled: this.balanceNum >= MIN_AMOUNT,
      })
      return base
    },
    canSubmit() {
      return (
        this.authorized &&
        this.amountNum >= MIN_AMOUNT &&
        this.amountNum <= MAX_AMOUNT &&
        this.amountNum <= this.balanceNum
      )
    },
    validationMsg() {
      if (!this.amountNum) return '请输入提现金额'
      if (this.amountNum < MIN_AMOUNT) return '提现金额最低 ¥10'
      if (this.amountNum > MAX_AMOUNT) return '单笔提现最高 ¥5000'
      if (this.amountNum > this.balanceNum) return '提现金额不能超过可提现余额'
      return ''
    },
  },

  onLoad() {
    this.loadBalance()
    this.checkAuth()
  },

  methods: {
    async loadBalance() {
      try {
        const user = await get(USER_API.current)
        this.balance = user && user.balance ? String(user.balance) : '0.00'
      } catch (e) { /* no data */ }
    },

    async checkAuth() {
      try {
        const res = await get(WITHDRAWAL_API.checkAuth)
        this.authorized = res && res.data && res.data.authorized
      } catch (e) { /* ignore */ }
    },

    async handleAuthorize() {
      if (this.authorizing) return
      this.authorizing = true
      try {
        const res = await post(WITHDRAWAL_API.authorizeWx, {})
        if (res.code !== 0) {
          showToast(res.msg || '授权请求失败')
          return
        }
        const { authorization_id, package_info } = res.data || {}
        this.pendingAuthId = authorization_id

        // 拉起微信授权小程序
        uni.navigateToMiniProgram({
          appId: 'wx4c1a3e7c47b9f12a', // 微信支付小程序 appId
          path: 'pages/open/facetoface?package=' + encodeURIComponent(package_info),
          fail: (err) => {
            showToast('打开微信授权页失败，请稍后重试')
            console.error('navigateToMiniProgram fail:', err)
          },
          success: () => {
            // 用户已跳转，等待授权结果回调
            showToast('请在微信中完成授权')
            // 轮询检查授权状态
            this._pollAuthStatus()
          },
        })
      } catch (e) {
        showToast('授权失败：' + (e.msg || e.message || '未知错误'))
      } finally {
        this.authorizing = false
      }
    },

    _pollAuthStatus() {
      let count = 0
      const timer = setInterval(async () => {
        count++
        if (count > 30) {
          clearInterval(timer)
          return
        }
        try {
          const res = await get(WITHDRAWAL_API.checkAuth)
          if (res && res.data && res.data.authorized) {
            clearInterval(timer)
            this.authorized = true
            showToast('授权成功！可以提现了', 'success')
          }
        } catch (e) { /* ignore */ }
      }, 2000)
    },

    onAmountInput() {
      this.$forceUpdate()
    },

    setAmount(val) {
      this.amount = String(val)
      this.$forceUpdate()
    },

    async handleSubmit() {
      if (!this.canSubmit) {
        showToast(this.validationMsg, 'none')
        return
      }
      const confirmed = await showModal({
        title: '确认提现',
        content: '提现金额 ¥' + this.amountNum + '，确定提交吗？',
      })
      if (!confirmed.confirm) return

      this.submitting = true
      try {
        await post(WITHDRAWAL_API.apply, { amount: this.amountNum })
        showToast('提现申请已提交', 'success')
        uni.$emit('userInfoUpdate')
        setTimeout(() => uni.navigateBack(), 1500)
      } catch (e) {
        showToast(e && e.msg ? e.msg : '提交失败')
      } finally {
        this.submitting = false
      }
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; width: 100%; background: #F5F5F5; box-sizing: border-box; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; padding: 20rpx 24rpx; box-sizing: border-box; }

.balance-card {
  display: flex; flex-direction: column; align-items: center; gap: 8rpx;
  padding: 48rpx; border-radius: 24rpx;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  margin-bottom: 32rpx; width: 100%; box-sizing: border-box;
}
.balance-label { font-size: 26rpx; color: rgba(255,255,255,0.8); }
.balance-value { font-size: 72rpx; font-weight: 700; color: #FFFFFF; }

.section-title { font-size: 28rpx; font-weight: 700; color: #1A1A1A; margin-bottom: 16rpx; }
.input-card {
  display: flex; align-items: center; gap: 12rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; padding: 28rpx 24rpx; margin-bottom: 16rpx; width: 100%; box-sizing: border-box;
}
.yuan { font-size: 48rpx; font-weight: 700; color: #FF3366; }
.amount-input { flex: 1; font-size: 56rpx; font-weight: 700; color: #1A1A1A; }
.ph { color: #999999; }

.quick-amounts { display: flex; gap: 16rpx; margin-bottom: 24rpx; }
.quick-btn {
  flex: 1; height: 72rpx; line-height: 72rpx; text-align: center;
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 16rpx; font-size: 28rpx; color: #666666;
}
.quick-btn.active {
  background: rgba(0, 180, 216, 0.1);
  border-color: rgba(0, 180, 216, 0.4);
  color: #00B4D8;
}
.quick-btn.disabled {
  background: #F5F5F5;
  color: #CCCCCC;
  border-color: #E8E8E8;
}

.fee-card {
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; padding: 24rpx; margin-bottom: 24rpx; width: 100%; box-sizing: border-box;
}
.fee-row {
  display: flex; justify-content: space-between; align-items: center;
  padding: 14rpx 0; border-bottom: 1rpx solid #F0F0F0;
}
.fee-row:last-child { border-bottom: none; }
.fee-row.total { border-top: 2rpx solid #E8E8E8; margin-top: 8rpx; padding-top: 20rpx; }
.fee-label { font-size: 26rpx; color: #666666; }
.fee-value { font-size: 26rpx; color: #1A1A1A; font-weight: 600; }
.fee-value.red { color: #FF3366; }
.fee-value.primary { color: #00C853; font-size: 32rpx; font-weight: 700; }

.tips-card {
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; padding: 24rpx; margin-bottom: 32rpx; width: 100%; box-sizing: border-box;
}
.tips-title { font-size: 26rpx; font-weight: 700; color: #1A1A1A; display: block; margin-bottom: 16rpx; }
.tips-item { font-size: 24rpx; color: #666666; display: block; margin-bottom: 8rpx; line-height: 1.6; }

.submit-btn {
  height: 96rpx; line-height: 96rpx; text-align: center;
  background: linear-gradient(135deg, #FF3366, #FF9800);
  border-radius: 48rpx; font-size: 32rpx; font-weight: 700; color: #fff;
  box-shadow: 0 4rpx 16rpx rgba(255, 51, 102, 0.3); margin-bottom: 60rpx; width: 100%; box-sizing: border-box;
}
.submit-btn.disabled { opacity: 0.5; }

.auth-card {
  background: #FFFFFF;
  border-radius: 24rpx;
  padding: 60rpx 40rpx;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 24rpx;
  margin-bottom: 32rpx;
}
.auth-icon { font-size: 80rpx; }
.auth-title { font-size: 34rpx; font-weight: 700; color: #1A1A1A; }
.auth-desc { font-size: 26rpx; color: #666666; text-align: center; line-height: 1.6; }
.auth-btn {
  background: linear-gradient(135deg, #00B4D8, #00C853);
  color: #fff;
  font-size: 30rpx;
  font-weight: 700;
  padding: 20rpx 64rpx;
  border-radius: 48rpx;
  box-shadow: 0 4rpx 16rpx rgba(0, 180, 216, 0.3);
}
</style>
