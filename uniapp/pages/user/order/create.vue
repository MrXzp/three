<template>
  <view class="page">
    <custom-navbar title="创建订单" :showBack="true" />

    <scroll-view scroll-y class="content" :style="{ top: '176rpx', bottom: btnBarHeight + 'px' }">
      <view class="service-preview">
        <image v-if="service && service.images && service.images.length > 0"
          :src="getImageUrl(service.images[0].image)"
          class="preview-img" mode="aspectFill" />
        <view class="preview-info">
          <text class="preview-name">{{ service ? service.name : '服务' }}</text>
          <text class="preview-cat">{{ service ? (service.category_name || '') : '' }}</text>
          <text class="preview-price">¥{{ service ? service.price : '0' }}</text>
        </view>
      </view>

      <view class="section-title">🎮 游戏信息</view>
      <view class="form-card">
        <view class="form-row">
          <text class="form-label">游戏账号</text>
          <input class="form-input" v-model="form.game_account" placeholder="请输入你的游戏账号" placeholder-class="ph" />
        </view>
        <view class="form-row">
          <text class="form-label">服务器</text>
          <input class="form-input" v-model="form.game_server" placeholder="请输入游戏服务器" placeholder-class="ph" />
        </view>
        <view class="form-row">
          <text class="form-label">游戏模式</text>
          <input class="form-input" v-model="form.game_mode" placeholder="如：经典模式/排位赛等（选填）" placeholder-class="ph" />
        </view>
        <view class="form-row" style="border:none">
          <text class="form-label">特殊要求</text>
        </view>
        <textarea class="form-textarea" v-model="form.special_requirements" placeholder="如有特殊需求请在此说明（选填）" placeholder-class="ph" />
      </view>

      <view class="section-title">💰 费用明细</view>
      <view class="form-card">
        <view class="form-row">
          <text class="form-label">服务费用</text>
          <text class="form-value primary">¥{{ service ? service.price : '0' }}</text>
        </view>
        <view class="form-row" style="border:none">
          <text class="form-label">合计</text>
          <text class="form-total">¥{{ service ? service.price : '0' }}</text>
        </view>
      </view>

      <view style="height: 40rpx;"></view>
    </scroll-view>

    <view class="submit-bar" :style="{ paddingBottom: safeAreaBottom + 'px' }">
      <view class="submit-price">
        <text class="price-label">应付</text>
        <text class="price-value">¥{{ service ? service.price : '0' }}</text>
      </view>
      <view class="submit-btn" :class="{ disabled: submitting }" @click="handleSubmit">
        <text>{{ submitting ? '提交中...' : '提交订单' }}</text>
      </view>
    </view>
  </view>
</template>

<script>
import { SERVICE_API, ORDER_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { showToast, getImageUrl } from '@/utils/common.js'

export default {
  data() {
    return {
      btnBarHeight: 140,
      serviceId: null, service: null, loading: false, submitting: false,
      form: {
        game_account: '', game_server: '', game_mode: '', special_requirements: '',
      },
    }
  },

  onLoad(opts) {
    console.log('[CREATE] onLoad, opts:', opts)
    this.serviceId = opts.service_id
    console.log('[CREATE] serviceId:', this.serviceId)
    this.loadService()
  },

  methods: {
    getImageUrl,

    async loadService() {
      if (!this.serviceId) return
      console.log('[CREATE] loadService 开始加载, serviceId:', this.serviceId)
      this.loading = true
      try {
        this.service = await get(SERVICE_API.detail(this.serviceId), {}, false)
        console.log('[CREATE] loadService 完成, service:', this.service)
      } finally { this.loading = false }
    },

    async handleSubmit() {
      console.log('[CREATE] 开始提交订单')
      if (!this.form.game_account.trim()) { showToast('请填写游戏账号', 'none'); return }
      if (!this.form.game_server.trim()) { showToast('请填写服务器', 'none'); return }
      this.submitting = true
      try {
        const payload = {
          service: this.serviceId,
          total_amount: this.service.price,
          game_account: this.form.game_account,
          game_server: this.form.game_server,
          game_mode: this.form.game_mode,
          special_requirements: this.form.special_requirements,
        }
        console.log('[CREATE] 创建订单, payload:', payload)
        const res = await post(ORDER_API.create, payload)
        console.log('[CREATE] 订单创建成功:', res)
        const orderId = res && res.id
        const orderNo = res && res.order_no
        
        uni.showModal({
          title: '订单已创建', content: '是否立即支付？',
          confirmText: '去支付', cancelText: '稍后支付',
          success: async (m) => {
            if (m.confirm && orderId && orderNo) {
              // 直接调起微信支付
              uni.showLoading({ title: '正在调起支付...' })
              try {
                console.log('[CREATE] 调用 wx_pay, order_no:', orderNo)
                const payRes = await post(ORDER_API.wxPay, { order_no: orderNo })
                console.log('[CREATE] wx_pay 返回:', payRes)
                if (!payRes.payParams) {
                  showToast('支付参数异常')
                  uni.redirectTo({ url: `/pages/user/order/detail?id=${orderId}` })
                  return
                }
                
                await uni.requestPayment({
                  provider: 'wxpay',
                  ...payRes.payParams,
                })
                console.log('[CREATE] uni.requestPayment 完成')
                
                // 支付完成后，主动查询微信确认支付状态
                uni.showLoading({ title: '确认支付结果...' })
                try {
                  console.log('[CREATE] 查询支付状态, order_no:', orderNo)
                  const queryRes = await get(ORDER_API.queryPaymentStatus(orderNo))
                  console.log('[CREATE] query_payment_status 返回:', queryRes)
                  if (queryRes.is_paid) {
                    showToast('支付成功', 'success')
                  } else {
                    showToast('支付结果待确认，请稍后刷新页面查看')
                  }
                } catch (queryErr) {
                  console.error('[CREATE] 查询支付状态失败:', queryErr)
                  showToast('支付结果待确认，请稍后刷新页面查看')
                } finally {
                  uni.hideLoading()
                }
              } catch (e) {
                console.error('[CREATE] 支付异常:', e)
                showToast('支付失败: ' + (e.msg || e.message || '未知错误'))
              }
              uni.redirectTo({ url: `/pages/user/order/detail?id=${orderId}` })
            } else {
              uni.reLaunch({ url: '/pages/user/order/index' })
            }
          },
        })
      } catch (e) {
        console.error('[CREATE] 创建订单失败:', e)
        showToast(e && e.msg ? e.msg : '创建失败')
      } finally {
        this.submitting = false
      }
    },
  },
}
</script>

<style scoped>
.page { min-height: 100vh; width: 100%; background: #F5F5F5; box-sizing: border-box; }
.content { position: fixed; left: 0; right: 0; overflow-y: auto; }

.service-preview {
  display: flex; gap: 20rpx; padding: 24rpx; margin: 20rpx 24rpx; border-radius: 20rpx;
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05); width: calc(100% - 48rpx); box-sizing: border-box;
}
.preview-img { width: 160rpx; height: 160rpx; border-radius: 16rpx; background: #F0F0F0; flex-shrink: 0; }
.preview-info { flex: 1; display: flex; flex-direction: column; gap: 8rpx; }
.preview-name { font-size: 30rpx; font-weight: 700; color: #1A1A1A; }
.preview-cat { font-size: 24rpx; color: #666666; }
.preview-price { font-size: 40rpx; font-weight: 700; color: #FF3366; margin-top: auto; }

.section-title { font-size: 28rpx; font-weight: 700; color: #1A1A1A; padding: 20rpx 24rpx 12rpx; }
.form-card {
  background: #FFFFFF; border: 1rpx solid #E8E8E8;
  border-radius: 20rpx; margin: 0 24rpx 20rpx; padding: 0 24rpx;
  box-shadow: 0 2rpx 8rpx rgba(0, 0, 0, 0.05); width: calc(100% - 48rpx); box-sizing: border-box;
}
.form-row {
  display: flex; align-items: center; justify-content: space-between;
  padding: 28rpx 0; border-bottom: 1rpx solid #F0F0F0;
}
.form-label { font-size: 28rpx; color: #666666; flex-shrink: 0; }
.form-input { flex: 1; text-align: right; font-size: 28rpx; color: #1A1A1A; }
.form-value { font-size: 28rpx; color: #1A1A1A; }
.form-value.primary { color: #FF3366; font-weight: 700; }
.form-textarea {
  width: 100%; min-height: 160rpx; padding: 20rpx 0; font-size: 28rpx; color: #1A1A1A; line-height: 1.6; box-sizing: border-box;
}
.ph { color: #999999; }
.form-total { font-size: 40rpx; font-weight: 700; color: #FF3366; }

.submit-bar {
  position: fixed; bottom: 0; left: 0; right: 0; height: 140rpx;
  background: #FFFFFF;
  border-top: 1rpx solid #E8E8E8;
  display: flex; align-items: center; padding: 0 24rpx; gap: 20rpx; z-index: 100;
  box-shadow: 0 -2rpx 8rpx rgba(0, 0, 0, 0.08);
}
.submit-price { display: flex; flex-direction: column; gap: 4rpx; }
.price-label { font-size: 22rpx; color: #999999; }
.price-value { font-size: 44rpx; font-weight: 700; color: #FF3366; }
.submit-btn {
  flex: 1; height: 88rpx; line-height: 88rpx; text-align: center;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  border-radius: 44rpx; font-size: 32rpx; font-weight: 700; color: #FFFFFF;
  box-shadow: 0 4rpx 16rpx rgba(0, 180, 216, 0.3);
}
.submit-btn.disabled { opacity: 0.5; }
</style>
