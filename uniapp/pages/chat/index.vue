<template>
  <view class="page">
    <custom-navbar title="在线沟通" :showBack="true" />

    <!-- 消息列表 -->
    <scroll-view scroll-y class="msg-list" :scroll-into-view="scrollIntoView">
      <view v-if="loading && messages.length === 0" class="empty-tip">
        <text>暂无消息，开始聊天吧~</text>
      </view>

      <view v-for="(msg, idx) in messages" :key="idx" :id="'msg-' + idx">
        <!-- 时间分隔 -->
        <view v-if="showTimeDivider(idx)" class="time-divider">
          <text class="time-text">{{ formatTimeDivider(msg.create_datetime) }}</text>
        </view>

        <!-- 对方消息：头像(左) + 气泡(右) -->
        <view v-if="String(msg.sender) !== String(myUserId)" class="msg-item msg-other">
          <view class="avatar avatar-left"
            :class="msg.sender_type === 'hunter' ? 'avatar-pink' : (msg.sender_type === 'admin' ? 'avatar-green' : 'avatar-blue')">
            <text class="avatar-text">{{ getAvatarText(msg.sender_nickname) }}</text>
          </view>
          <view class="msg-body msg-body-right">
            <text class="sender-name">
              {{ msg.sender_type === 'customer' ? '老板' : (msg.sender_type === 'hunter' ? '打手' : (msg.sender_type === 'admin' ? '管理员' : '未知')) }}
            </text>
            <view class="bubble bubble-right"
              :class="msg.sender_type === 'customer' ? 'bubble-blue' : (msg.sender_type === 'hunter' ? 'bubble-pink' : (msg.sender_type === 'admin' ? 'bubble-green' : 'bubble-blue'))">
              <text v-if="msg.message_type === 2" class="sys-msg">{{ msg.content }}</text>
              <image v-else-if="msg.message_type === 3" :src="getImageUrl(msg.image_url)" class="msg-img"
                mode="widthFix" @click="previewImage(msg.image_url)" />
              <text v-else class="msg-text">{{ msg.content }}</text>
            </view>
            <text class="msg-time">{{ formatTime(msg.create_datetime) }}</text>
          </view>
        </view>

        <!-- 我的消息：气泡(左) + 头像(右) -->
        <view v-if="String(msg.sender) === String(myUserId)" class="msg-item msg-me">
          <view class="msg-body msg-body-left">
            <view class="bubble bubble-left"
              :class="msg.sender_type === 'customer' ? 'bubble-blue' : (msg.sender_type === 'hunter' ? 'bubble-pink' : (msg.sender_type === 'admin' ? 'bubble-green' : 'bubble-blue'))">
              <text v-if="msg.message_type === 2" class="sys-msg">{{ msg.content }}</text>
              <image v-else-if="msg.message_type === 3" :src="getImageUrl(msg.image_url)" class="msg-img"
                mode="widthFix" @click="previewImage(msg.image_url)" />
              <text v-else class="msg-text">{{ msg.content }}</text>
            </view>
            <text class="msg-time">{{ formatTime(msg.create_datetime) }}</text>
          </view>
          <view class="avatar avatar-right"
            :class="msg.sender_type === 'hunter' ? 'avatar-pink' : (msg.sender_type === 'admin' ? 'avatar-green' : 'avatar-blue')">
            <text class="avatar-text">{{ myAvatarText }}</text>
          </view>
        </view>
      </view>

      <view :id="'scroll-bottom-' + scrollBottomId" style="height: 20rpx;"></view>
    </scroll-view>

    <!-- 输入区 -->
    <view class="input-area">
      <input v-model="inputText" class="chat-input" placeholder="输入消息..." confirm-type="send" @confirm="sendMessage" />
      <view class="send-btn" :class="{ disabled: !inputText.trim() || sending }" @click="sendMessage">
        <text class="send-text">{{ sending ? '发送中' : '发送' }}</text>
      </view>
    </view>
  </view>
</template>

<script>
import { ORDER_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { getImageUrl, showToast } from '@/utils/common.js'

export default {
  data() {
    return {
      orderId: null,
      orderNo: '',
      messages: [],
      loading: false,
      sending: false,
      inputText: '',
      scrollIntoView: '',
      scrollBottomId: 0,
      pollingTimer: null,
      navbarHeight: 88,
      myUserId: null,
      myNickname: '',
    }
  },

  computed: {
    myAvatarText() {
      return this.getAvatarText(this.myNickname || '我')
    },
  },

  onLoad(opts) {
    this.orderId = opts.order_id
    this.orderNo = opts.order_no || ''
    const sys = uni.getSystemInfoSync()
    this.navbarHeight = sys.statusBarHeight + 44
    this.loadUserInfo()
    this.loadMessages(true)
    this.startPolling()
  },

  onUnload() {
    this.stopPolling()
  },

  methods: {
    getImageUrl,

    async loadUserInfo() {
      try {
        const stored = uni.getStorageSync('escort_user_info') || {}
        this.myUserId = stored.id
        this.myNickname = stored.nickname || ''
      } catch (e) { }
    },

    async loadMessages(initial = false) {
      this.loading = true
      try {
        const res = await get(ORDER_API.chatMessages(this.orderId), { limit: 20 })
        const msgs = (res && res.messages) || []
        if (!msgs.length) { this.loading = false; return }

        const addIsMe = list => list.map(m => ({
          ...m,
          is_me: String(m.sender) === String(this.myUserId),
        }))

        if (initial) {
          // 首次加载：替换列表
          this.messages = addIsMe(msgs)
        } else {
          // 轮询：合并去重
          const existingIds = new Set(this.messages.map(m => m.id))
          const newMsgs = msgs.filter(m => !existingIds.has(m.id))
          if (newMsgs.length) {
            this.messages = [...this.messages, ...addIsMe(newMsgs)]
            this.$nextTick(() => {
              this.scrollBottomId = Date.now()
              this.scrollIntoView = 'scroll-bottom-' + this.scrollBottomId
            })
          }
          return
        }

        this.$nextTick(() => {
          this.scrollBottomId = Date.now()
          this.scrollIntoView = 'scroll-bottom-' + this.scrollBottomId
        })
      } catch (e) {
        console.error('loadMessages error', e)
      } finally {
        this.loading = false
      }
    },

    startPolling() {
      this.stopPolling()
      this.pollingTimer = setInterval(() => {
        this.loadMessages(false)
      }, 4000)
    },

    stopPolling() {
      if (this.pollingTimer) {
        clearInterval(this.pollingTimer)
        this.pollingTimer = null
      }
    },

    async sendMessage() {
      const content = this.inputText.trim()
      if (!content || this.sending) return
      this.inputText = ''
      this.sending = true

      try {
        await post(ORDER_API.chatSend(this.orderId), {
          content,
          message_type: 1,
        })
        this.stopPolling()
        await this.loadMessages(true)
        this.$nextTick(() => {
          this.scrollBottomId = Date.now()
          this.scrollIntoView = 'scroll-bottom-' + this.scrollBottomId
        })
        setTimeout(() => { this.startPolling() }, 5000)
      } catch (e) {
        showToast(e.msg || '发送失败', 'none')
        this.inputText = content
      } finally {
        this.sending = false
      }
    },
    // 是否显示时间分隔（距离上一条超过5分钟）
    showTimeDivider(idx) {
      if (idx === 0) return true
      const prev = this.messages[idx - 1]
      const curr = this.messages[idx]
      if (!prev || !curr || !prev.create_datetime || !curr.create_datetime) return false
      const t1 = new Date(prev.create_datetime.replace(' ', 'T')).getTime()
      const t2 = new Date(curr.create_datetime.replace(' ', 'T')).getTime()
      return t2 - t1 > 5 * 60 * 1000
    },

    formatTimeDivider(datetime) {
      if (!datetime) return ''
      const d = new Date(datetime.replace(' ', 'T'))
      const mo = d.getMonth() + 1
      const day = d.getDate()
      const h = String(d.getHours()).padStart(2, '0')
      const m = String(d.getMinutes()).padStart(2, '0')
      return `${mo}月${day}日 ${h}:${m}`
    },

    formatTime(datetime) {
      if (!datetime) return ''
      const d = new Date(datetime.replace(' ', 'T'))
      const h = String(d.getHours()).padStart(2, '0')
      const m = String(d.getMinutes()).padStart(2, '0')
      return `${h}:${m}`
    },

    getAvatarText(name) {
      if (!name) return '?'
      return name.slice(-2)
    },

    previewImage(url) {
      const full = getImageUrl(url)
      uni.previewImage({ urls: [full], current: full })
    },
  },
}
</script>

<style scoped>
.page {
  min-height: 100vh;
  width: 100%;
  background: #F0F2F5;
  display: flex;
  flex-direction: column;
}

/* 消息列表 - 固定定位，四周留出导航栏和输入区 */
.msg-list {
  position: fixed;
  left: 0;
  right: 0;
  top: 180rpx;
  bottom: 130rpx;
  /* padding: 0 24rpx; */
  overflow-y: auto;
  background: #F0F2F5;
  /* margin: 0 20rpx; */
  /* width: calc(100vw - 40rpx); */
}

.empty-tip {
  text-align: center;
  padding: 160rpx 0;
  font-size: 26rpx;
  color: #9CA3AF;
}

/* 时间分隔线 */
.time-divider {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 24rpx 0 20rpx;
}

.time-text {
  font-size: 22rpx;
  color: #9CA3AF;
  background: #E5E7EB;
  padding: 6rpx 20rpx;
  border-radius: 20rpx;
}

/* 消息行 */
.msg-item {
  display: flex;
  gap: 16rpx;
  margin-bottom: 32rpx;
}

.msg-me {
  flex-direction: row;
  display: flex;
  justify-content: flex-end;
}

.msg-other {
  flex-direction: row;
}

/* 头像 */
.avatar {
  width: 80rpx;
  height: 80rpx;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  font-size: 24rpx;
  color: #fff;
  font-weight: 600;
}

.avatar-blue {
  background: linear-gradient(135deg, #4A9EFF, #1D4ED8);
}

.avatar-pink {
  background: linear-gradient(135deg, #FF6EB4, #E91E8C);
}

.avatar-green {
  background: linear-gradient(135deg, #34D399, #059669);
}

/* 消息内容 */
.msg-body {
  display: flex;
  flex-direction: column;
  max-width: 70%;
}
.msg-body-left { align-items: flex-start; }
.msg-body-right { align-items: flex-end; }
.msg-body {
  display: flex;
  flex-direction: column;
  max-width: 70%;
}

.msg-me .msg-body {
  align-items: flex-start;
}

.msg-other .msg-body {
  align-items: flex-end;
}

.sender-name {
  font-size: 22rpx;
  margin-bottom: 6rpx;
  padding: 0 8rpx;
}

.msg-other .sender-name {
  color: #6B7280;
}

.msg-me .sender-name {
  color: transparent;
  height: 0;
  margin: 0;
}

/* 气泡 */
.bubble {
  padding: 18rpx 24rpx;
  border-radius: 20rpx;
  font-size: 28rpx;
  line-height: 1.7;
  word-break: break-all;
}

.msg-img {
  max-width: 280rpx;
  border-radius: 12rpx;
  display: block;
}

.sys-msg {
  font-size: 22rpx;
  color: #9CA3AF;
  text-align: center;
  display: block;
  padding: 4rpx 0;
}

/* 老板蓝色 */
.bubble-blue {
  background: linear-gradient(135deg, #4A9EFF, #2563EB);
  color: #fff;
}

.bubble-left.bubble-blue {
  border-bottom-right-radius: 6rpx;
}

.bubble-right.bubble-blue {
  border-bottom-left-radius: 6rpx;
}

/* 打手粉红 */
.bubble-pink {
  background: linear-gradient(135deg, #FF6EB4, #EC4899);
  color: #fff;
}

.bubble-left.bubble-pink {
  border-bottom-right-radius: 6rpx;
}

.bubble-right.bubble-pink {
  border-bottom-left-radius: 6rpx;
}

/* 管理员绿色 */
.bubble-green {
  background: linear-gradient(135deg, #34D399, #10B981);
  color: #fff;
}

.bubble-left.bubble-green {
  border-bottom-right-radius: 6rpx;
}

.bubble-right.bubble-green {
  border-bottom-left-radius: 6rpx;
}

.msg-text {
  color: inherit;
}

/* 时间戳 */
.msg-time {
  font-size: 20rpx;
  color: #C4C4C4;
  margin-top: 6rpx;
  padding: 0 8rpx;
}

/* 输入区 */
.input-area {
  position: fixed;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  align-items: center;
  gap: 16rpx;
  padding: 16rpx 24rpx;
  padding-bottom: calc(16rpx + env(safe-area-inset-bottom));
  background: #FFFFFF;
  border-top: 1rpx solid #E8E8E8;
  z-index: 100;
}

.chat-input {
  flex: 1;
  height: 76rpx;
  background: #F5F5F5;
  border-radius: 38rpx;
  padding: 0 28rpx;
  font-size: 28rpx;
  color: #1A1A1A;
}

.chat-input::placeholder {
  color: #C4C4C4;
}

.send-btn {
  width: 130rpx;
  height: 76rpx;
  background: linear-gradient(135deg, #4A9EFF, #2563EB);
  border-radius: 38rpx;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}

.send-btn.disabled {
  background: #D1D5DB;
}

.send-text {
  font-size: 28rpx;
  color: #fff;
  font-weight: 600;
}
</style>
