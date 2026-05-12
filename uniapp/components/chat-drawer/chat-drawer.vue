<template>
  <view class="chat-drawer-root">
    <!-- 聊天入口按钮 -->
    <view
      class="chat-fab"
      :class="{ 'has-unread': unreadCount > 0 }"
      @click="openChat"
    >
      <text class="fab-icon">💬</text>
      <view v-if="unreadCount > 0" class="unread-badge">
        <text class="badge-text">{{ unreadCount > 99 ? '99+' : unreadCount }}</text>
      </view>
    </view>

    <!-- 聊天抽屉 -->
    <view v-if="visible" class="chat-overlay" @click="closeChat">
      <view class="chat-drawer" :class="{ open: drawerOpen }" @click.stop>

      <!-- 抽屉头部 -->
      <view class="drawer-header">
        <text class="header-title">订单沟通</text>
        <text class="header-close" @click="closeChat">×</text>
      </view>

      <!-- 消息列表 -->
      <scroll-view
        scroll-y
        class="message-list"
        :scroll-top="scrollTop"
        :scroll-into-view="scrollIntoView"
      >
        <view v-if="loading && messages.length === 0" class="msg-empty">
          <text>暂无消息，开始聊天吧~</text>
        </view>
        <view v-else>
          <view
            v-for="(msg, idx) in messages"
            :key="msg.id || idx"
            :id="'msg-' + msg.id"
            class="message-item"
            :class="msg.is_me ? 'msg-me' : 'msg-other'"
          >
            <view v-if="!msg.is_me" class="avatar other-avatar">
              <text class="avatar-text">{{ getAvatarText(msg.sender_nickname) }}</text>
            </view>

            <view class="msg-content-wrap">
              <text v-if="!msg.is_me" class="sender-name">{{ msg.sender_nickname }}</text>
              <view class="msg-bubble" :class="msg.is_me ? 'bubble-me' : 'bubble-other'">
                <!-- 系统消息 -->
                <text v-if="msg.message_type === 2" class="sys-msg">{{ msg.content }}</text>
                <!-- 图片消息 -->
                <image
                  v-else-if="msg.message_type === 3"
                  :src="getImageUrl(msg.image_url)"
                  class="msg-img"
                  mode="widthFix"
                  @click="previewImage(msg.image_url)"
                />
                <!-- 文本消息 -->
                <text v-else class="msg-text">{{ msg.content }}</text>
              </view>
              <text class="msg-time">{{ formatTime(msg.create_datetime) }}</text>
            </view>

            <view v-if="msg.is_me" class="avatar my-avatar">
              <text class="avatar-text">{{ myAvatarText }}</text>
            </view>
          </view>
        </view>
        <view id="msg-bottom" style="height: 1rpx;"></view>
      </scroll-view>

      <!-- 输入区（系统/已完成的订单不显示） -->
      <view v-if="canSend" class="input-area">
        <input
          v-model="inputText"
          class="chat-input"
          placeholder="输入消息..."
          confirm-type="send"
          :cursor-spacing="10"
          @confirm="sendMessage"
        />
        <view class="send-btn" @click="sendMessage">
          <text class="send-text">发送</text>
        </view>
      </view>
      <view v-else class="input-area input-disabled">
        <text class="disabled-hint">订单已结束，无法发送消息</text>
      </view>
    </view>
  </view>
  </view>
</template>

<script>
import { ORDER_API } from '@/config/api.js'
import { get, post } from '@/utils/request.js'
import { getImageUrl, showToast } from '@/utils/common.js'

export default {
  props: {
    orderId: { type: [String, Number], required: true },
    orderStatus: { type: Number, default: 0 },
    myUserId: { type: [String, Number], default: null },
    myNickname: { type: String, default: '' },
    myAvatar: { type: String, default: '' },
  },

  data() {
    return {
      visible: false,
      drawerOpen: false,
      messages: [],
      loading: false,
      inputText: '',
      scrollTop: 0,
      scrollIntoView: '',
      unreadCount: 0,
      lastMsgId: null,
      pollingTimer: null,
    }
  },

  computed: {
    canSend() {
      // 订单进行中（待接单/已接单/等待搭子/服务中/待确认）可以发消息
      const activeStatuses = [1, 2, 3, 4, 5]
      return activeStatuses.includes(this.orderStatus)
    },
    myAvatarText() {
      return this.getAvatarText(this.myNickname || '我')
    },
  },

  methods: {
    getImageUrl,

    openChat() {
      this.visible = true
      this.$nextTick(() => {
        setTimeout(() => { this.drawerOpen = true }, 10)
      })
      this.loadMessages(true)
      this.startPolling()
    },

    closeChat() {
      this.drawerOpen = false
      setTimeout(() => {
        this.visible = false
        this.stopPolling()
      }, 300)
    },

    async loadMessages(initial = false) {
      this.loading = true
      try {
        const params = this.lastMsgId ? { after_id: this.lastMsgId, limit: 50 } : { limit: 50 }
        const res = await get(ORDER_API.chatMessages(this.orderId), params)
        const msgs = (res && res.messages) || []
        if (!msgs.length) { this.loading = false; return }

        const enriched = msgs.map(m => ({
          ...m,
          is_me: m.sender === this.myUserId,
        }))

        if (initial) {
          this.messages = enriched
        } else {
          const existingIds = new Set(this.messages.map(m => m.id))
          const newMsgs = enriched.filter(m => !existingIds.has(m.id))
          if (newMsgs.length) {
            this.messages = [...this.messages, ...newMsgs]
            this.$nextTick(() => {
              this.scrollIntoView = 'msg-bottom'
            })
          }
        }

        if (this.messages.length) {
          this.lastMsgId = Math.max(...this.messages.map(m => m.id))
        }
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
      if (!content) return
      this.inputText = ''

      // 乐观更新：先显示自己的消息
      const tempId = Date.now()
      const optimistic = {
        id: tempId,
        sender: this.myUserId,
        sender_type: 'me',
        sender_nickname: this.myNickname || '我',
        message_type: 1,
        content,
        create_datetime: new Date().toISOString(),
        is_me: true,
      }
      this.messages.push(optimistic)
      this.$nextTick(() => { this.scrollIntoView = 'msg-bottom' })

      try {
        const res = await post(ORDER_API.chatSend(this.orderId), {
          content,
          message_type: 1,
        })
        // 用服务端返回的真实消息替换掉乐观消息
        const idx = this.messages.findIndex(m => m.id === tempId)
        if (idx !== -1 && res && res.data) {
          this.messages.splice(idx, 1, { ...res.data, is_me: true })
        }
        this.lastMsgId = res.data ? Math.max(this.lastMsgId || 0, res.data.id) : this.lastMsgId
      } catch (e) {
        // 发送失败，移除乐观消息
        const idx = this.messages.findIndex(m => m.id === tempId)
        if (idx !== -1) this.messages.splice(idx, 1)
        showToast(e.msg || '发送失败', 'none')
        this.inputText = content // 恢复输入
      }
    },

    getAvatarText(name) {
      if (!name) return '?'
      return name.slice(-2, name.length)
    },

    formatTime(datetime) {
      if (!datetime) return ''
      const d = new Date(datetime)
      const h = String(d.getHours()).padStart(2, '0')
      const m = String(d.getMinutes()).padStart(2, '0')
      return `${h}:${m}`
    },

    previewImage(url) {
      const full = getImageUrl(url)
      uni.previewImage({ urls: [full], current: full })
    },
  },

  beforeDestroy() {
    this.stopPolling()
  },
}
</script>

<style scoped>
/* 悬浮入口 */
.chat-fab {
  position: relative;
  width: 96rpx;
  height: 96rpx;
  border-radius: 50%;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 4rpx 20rpx rgba(0, 180, 216, 0.4);
  z-index: 50;
}
.chat-fab.has-unread { animation: pulse 2s infinite; }
@keyframes pulse {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.1); }
}
.fab-icon { font-size: 40rpx; }
.unread-badge {
  position: absolute;
  top: -8rpx; right: -8rpx;
  min-width: 36rpx; height: 36rpx;
  border-radius: 18rpx;
  background: #FF3366;
  display: flex; align-items: center; justify-content: center;
  padding: 0 6rpx;
}
.badge-text { font-size: 20rpx; color: #fff; font-weight: 700; }

/* 遮罩 */
.chat-overlay {
  position: fixed; inset: 0;
  background: rgba(0,0,0,0);
  z-index: 998;
  transition: background 0.3s;
}
.chat-overlay .chat-drawer {
  position: fixed;
  bottom: 0; left: 0; right: 0;
  height: 75vh;
  background: #F5F7FA;
  border-radius: 24rpx 24rpx 0 0;
  display: flex; flex-direction: column;
  transform: translateY(100%);
  transition: transform 0.3s cubic-bezier(0.36, 0.66, 0.56, 1);
}
.chat-overlay .chat-drawer.open {
  transform: translateY(0);
}

/* 抽屉头部 */
.drawer-header {
  display: flex; align-items: center; justify-content: space-between;
  padding: 28rpx 32rpx;
  border-bottom: 1rpx solid #E8E8E8;
  background: #FFFFFF;
  flex-shrink: 0;
  border-radius: 24rpx 24rpx 0 0;
}
.header-title { font-size: 32rpx; font-weight: 700; color: #1A1A1A; }
.header-close { font-size: 52rpx; color: #999; line-height: 1; padding: 0 8rpx; }

/* 消息列表 */
.message-list { flex: 1; padding: 20rpx 24rpx; overflow-y: auto; }
.msg-empty { text-align: center; padding: 80rpx 0; font-size: 26rpx; color: #999; }

.message-item {
  display: flex; align-items: flex-end; gap: 12rpx;
  margin-bottom: 24rpx;
}
.msg-me { flex-direction: row-reverse; }
.msg-other { flex-direction: row; }

.avatar {
  width: 72rpx; height: 72rpx;
  border-radius: 50%;
  background: linear-gradient(135deg, #667eea, #764ba2);
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0;
}
.other-avatar { background: linear-gradient(135deg, #00B4D8, #00C853); }
.avatar-text { font-size: 24rpx; color: #fff; font-weight: 600; }

.msg-content-wrap { display: flex; flex-direction: column; max-width: 70%; }
.msg-me .msg-content-wrap { align-items: flex-end; }
.msg-other .msg-content-wrap { align-items: flex-start; }

.sender-name { font-size: 22rpx; color: #999; margin-bottom: 4rpx; padding: 0 8rpx; }

.msg-bubble {
  padding: 16rpx 20rpx;
  border-radius: 20rpx;
  font-size: 28rpx;
  line-height: 1.5;
  word-break: break-all;
}
.bubble-me {
  background: linear-gradient(135deg, #00B4D8, #0097B2);
  color: #fff;
  border-bottom-right-radius: 8rpx;
}
.bubble-other {
  background: #FFFFFF;
  color: #1A1A1A;
  border: 1rpx solid #E8E8E8;
  border-bottom-left-radius: 8rpx;
}
.msg-img { max-width: 280rpx; border-radius: 12rpx; }
.sys-msg { font-size: 22rpx; color: #999; text-align: center; display: block; padding: 4rpx 0; }
.msg-text { }
.msg-time { font-size: 20rpx; color: #BBB; margin-top: 4rpx; padding: 0 8rpx; }

/* 输入区 */
.input-area {
  display: flex; align-items: center; gap: 16rpx;
  padding: 16rpx 24rpx;
  padding-bottom: calc(16rpx + env(safe-area-inset-bottom));
  background: #FFFFFF;
  border-top: 1rpx solid #E8E8E8;
  flex-shrink: 0;
}
.input-disabled { justify-content: center; }
.disabled-hint { font-size: 26rpx; color: #999; }
.chat-input {
  flex: 1;
  height: 72rpx;
  background: #F5F5F5;
  border-radius: 36rpx;
  padding: 0 24rpx;
  font-size: 28rpx;
}
.send-btn {
  width: 120rpx; height: 72rpx;
  background: linear-gradient(135deg, #00B4D8, #00C853);
  border-radius: 36rpx;
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0;
}
.send-text { font-size: 28rpx; color: #fff; font-weight: 600; }

/* 根容器 */
.chat-drawer-root {
  display: contents;
}
</style>
