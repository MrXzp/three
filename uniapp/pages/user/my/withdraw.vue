<template>
  <view class="page">
    <custom-navbar title="提现申请" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: tabBarBottom + 'px' }">
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
        <text class="tips-item">• 提现将转入您的微信零钱</text>
        <text class="tips-item">• 请在微信中确认收款</text>
        <text class="tips-item">• 单笔提现最低 ¥0.1，最高 ¥5000</text>
      </view>

      <!-- 提交按钮 -->
      <view class="submit-btn" :class="{ disabled: !canSubmit || submitting }" @click="handleSubmit">
        <text>{{ submitting ? '提交中...' : '立即提现' }}</text>
      </view>
    </scroll-view>
  </view>
</template>

<script>
import { USER_API, WITHDRAWAL_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { showToast, showModal } from '@/utils/common.js'
import customNavbar from '@/components/custom-navbar/custom-navbar.vue'

const QUICK_VALUES = [10, 50, 100]
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
        this.amountNum >= MIN_AMOUNT &&
        this.amountNum <= MAX_AMOUNT &&
        this.amountNum <= this.balanceNum
      )
    },
    validationMsg() {
      if (!this.amountNum) return '请输入提现金额'
      if (this.amountNum < MIN_AMOUNT) return '提现金额最低 ¥0.1'
      if (this.amountNum > MAX_AMOUNT) return '单笔提现最高 ¥5000'
      if (this.amountNum > this.balanceNum) return '提现金额不能超过可提现余额'
      return ''
    },
  },

  onLoad() {
    this.loadBalance()
  },

  methods: {
    async loadBalance() {
      try {
        const user = await get(USER_API.current)
        this.balance = user && user.balance ? String(user.balance) : '0.00'
      } catch (e) { /* no data */ }
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
        content: '提现金额 ¥' + this.amountNum + '，请在微信中确认收款',
      })
      if (!confirmed.confirm) return

      this.submitting = true
      try {
        // 1. 调用后端接口，发起微信转账
        const res = await post(WITHDRAWAL_API.authorizeWx, {
          amount: this.amountNum,
        })

        if (res.code !== 0) {
          showToast(res.msg || '发起提现失败')
          return
        }

        const { package_info, out_bill_no, state } = res.data || {}

        // 2. 如果状态是直接成功（免确认）
        if (state === 'SUCCESS') {
          showToast('提现成功，金额已到账', 'success')
          uni.$emit('userInfoUpdate')
          setTimeout(() => uni.navigateBack(), 1500)
          return
        }

        // 3. 需要用户确认，拉起微信收款确认页
        if (!package_info) {
          showToast('获取收款信息失败')
          return
        }

        // 检查是否支持 requestMerchantTransfer
        if (!wx.requestMerchantTransfer) {
          showToast('当前微信版本不支持，请升级')
          return
        }

        wx.requestMerchantTransfer({
          mchId: '1106364727', // 商户号
          appId: 'wxc9849c4b7aedae78', // 小程序AppID
          package: package_info,
          success: (res) => {
            // 页面拉起成功，不代表转账成功
            showToast('请在微信中确认收款', 'none', 3000)
            uni.$emit('userInfoUpdate')
            setTimeout(() => uni.navigateBack(), 2000)
          },
          fail: (err) => {
            console.error('拉起转账页面失败', err)
            // 用户取消或失败，不算提交失败
            if (err.errMsg && err.errMsg.indexOf('cancel') !== -1) {
              showToast('已取消提现', 'none')
            } else {
              showToast('打开收款页面失败，请重试')
            }
          }
        })

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
</style>
