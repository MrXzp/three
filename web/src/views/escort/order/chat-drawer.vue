<template>
    <el-drawer
        v-model="visible"
        title="订单沟通记录"
        :size="drawerWidth"
        direction="rtl"
        :before-close="handleClose"
    >
        <div class="chat-container">
            <!-- 消息列表 -->
            <div class="message-list" ref="messageListRef">
                <div v-if="loading && messages.length === 0" class="empty-tip">
                    暂无沟通记录
                </div>
                <div
                    v-for="(msg, idx) in messages"
                    :key="msg.id || idx"
                    class="message-item"
                    :class="msg.isMe ? 'msg-me' : 'msg-other'"
                >
                    <el-avatar
                        :size="36"
                        :src="msg.isMe ? myAvatar : msg.sender_avatar"
                        class="msg-avatar"
                    >
                        {{ getAvatarText(msg.sender_nickname) }}
                    </el-avatar>

                    <div class="msg-body">
                        <div class="sender-name">
                            {{ msg.isMe ? (myNickname || '我') : (msg.sender_nickname || '未知') }}
                            <span class="sender-role">{{ getRoleTag(msg.sender_type) }}</span>
                        </div>
                        <div class="msg-bubble" :class="msg.isMe ? 'bubble-me' : 'bubble-other'">
                            <!-- 系统消息 -->
                            <span v-if="msg.message_type === 2" class="sys-msg">{{ msg.content }}</span>
                            <!-- 图片消息 -->
                            <el-image
                                v-else-if="msg.message_type === 3"
                                :src="getFullImageUrl(msg.image_url)"
                                :preview-src-list="[getFullImageUrl(msg.image_url)]"
                                fit="cover"
                                class="msg-img"
                                :max-scale="5"
                                :min-scale="0.2"
                            />
                            <!-- 文本消息 -->
                            <span v-else>{{ msg.content }}</span>
                        </div>
                        <div class="msg-time">{{ formatTime(msg.create_datetime) }}</div>
                    </div>
                </div>
            </div>

            <!-- 输入区 -->
            <div class="input-area">
                <el-input
                    v-model="inputText"
                    placeholder="输入消息..."
                    @keyup.enter="handleSend"
                    :disabled="sending"
                />
                <el-button type="primary" @click="handleSend" :loading="sending" :disabled="!inputText.trim()">
                    发送
                </el-button>
            </div>
        </div>
    </el-drawer>
</template>

<script setup lang="ts">
import { ref, watch, nextTick } from 'vue';
import { ElMessage } from 'element-plus';
import { GetChatMessages, SendChatMessage } from './chat-api';

interface ChatMessage {
    id: number;
    sender: number;
    sender_type: string;
    sender_nickname: string;
    sender_avatar: string;
    message_type: number;
    content: string;
    image_url?: string;
    create_datetime: string;
    isMe?: boolean;
}

const props = defineProps<{
    orderId: number | string | null;
    myUserId: number | string | null;
    myNickname?: string;
    myAvatar?: string;
}>();

const visible = ref(false);
const drawerWidth = ref('420px');
const messages = ref<ChatMessage[]>([]);
const loading = ref(false);
const sending = ref(false);
const inputText = ref('');
const lastMsgId = ref<number | null>(null);
const messageListRef = ref<HTMLElement | null>(null);
let pollingTimer: ReturnType<typeof setInterval> | null = null;

watch(visible, (val) => {
    if (val) {
        loadMessages(true);
        startPolling();
    } else {
        stopPolling();
    }
});

function open(orderId: number | string | null) {
    if (!orderId) return;
    visible.value = true;
}

function handleClose(done: () => void) {
    stopPolling();
    done();
}

async function loadMessages(initial = false) {
    if (!props.orderId) return;
    loading.value = true;
    try {
        const res: any = await GetChatMessages(props.orderId);
        // Web 后台 API 直接返回全部消息（不支持游标分页）
        const msgs: ChatMessage[] = (res?.data?.messages) || [];
        if (!msgs.length) { loading.value = false; return; }

        const enriched = msgs.map((m: any) => ({
            ...m,
            isMe: String(m.sender) === String(props.myUserId),
        }));

        if (initial) {
            messages.value = enriched;
        } else {
            const existingIds = new Set(messages.value.map(m => m.id));
            const newMsgs = enriched.filter((m: ChatMessage) => !existingIds.has(m.id));
            if (newMsgs.length) {
                messages.value = [...messages.value, ...newMsgs];
                scrollToBottom();
            }
        }

        if (messages.value.length) {
            lastMsgId.value = Math.max(...messages.value.map(m => m.id));
        }
    } catch (e: any) {
        console.error('loadMessages error', e);
    } finally {
        loading.value = false;
    }
}

function startPolling() {
    stopPolling();
    // Web 后台 API 不支持游标分页，每次全量拉取
    pollingTimer = setInterval(() => {
        loadMessages(false);
    }, 8000);
}

function stopPolling() {
    if (pollingTimer) {
        clearInterval(pollingTimer);
        pollingTimer = null;
    }
}

async function handleSend() {
    const content = inputText.value.trim();
    if (!content || !props.orderId) return;
    sending.value = true;

    const tempId = Date.now();
    const optimistic: ChatMessage = {
        id: tempId,
        sender: props.myUserId as number,
        sender_type: 'admin',
        sender_nickname: props.myNickname || '管理员',
        sender_avatar: props.myAvatar || '',
        message_type: 1,
        content,
        create_datetime: new Date().toISOString(),
        isMe: true,
    };
    messages.value.push(optimistic);
    inputText.value = '';
    scrollToBottom();

    try {
        const res: any = await SendChatMessage(props.orderId, { content, message_type: 1 });
        if (res?.data) {
            const idx = messages.value.findIndex(m => m.id === tempId);
            if (idx !== -1) {
                messages.value.splice(idx, 1, { ...res.data, isMe: true });
            }
            lastMsgId.value = Math.max(lastMsgId.value || 0, res.data.id);
        }
    } catch (e: any) {
        const idx = messages.value.findIndex(m => m.id === tempId);
        if (idx !== -1) messages.value.splice(idx, 1);
        ElMessage.error(e?.msg || e?.message || '发送失败');
        inputText.value = content;
    } finally {
        sending.value = false;
    }
}

function scrollToBottom() {
    nextTick(() => {
        if (messageListRef.value) {
            messageListRef.value.scrollTop = messageListRef.value.scrollHeight;
        }
    });
}

function getAvatarText(name?: string) {
    if (!name) return '?';
    return name.slice(-2);
}

function getRoleTag(type: string) {
    const map: Record<string, string> = {
        customer: '客户',
        hunter: '打手',
        system: '系统',
        admin: '管理员',
    };
    return map[type] || type;
}

function formatTime(datetime: string) {
    if (!datetime) return '';
    const d = new Date(datetime);
    const mo = d.getMonth() + 1;
    const day = d.getDate();
    const h = String(d.getHours()).padStart(2, '0');
    const m = String(d.getMinutes()).padStart(2, '0');
    return `${mo}/${day} ${h}:${m}`;
}

function getFullImageUrl(url?: string) {
    if (!url) return '';
    if (url.startsWith('http')) return url;
    return import.meta.env.VITE_APP_BASE_API.replace('/api', '') + url;
}

defineExpose({ open });
</script>

<style scoped>
.chat-container {
    display: flex;
    flex-direction: column;
    height: 100%;
}

.message-list {
    flex: 1;
    overflow-y: auto;
    padding: 16px;
}

.empty-tip {
    text-align: center;
    color: #999;
    padding: 60px 0;
    font-size: 14px;
}

.message-item {
    display: flex;
    gap: 10px;
    margin-bottom: 16px;
    align-items: flex-start;
}

.msg-me {
    flex-direction: row-reverse;
}

.msg-avatar {
    flex-shrink: 0;
    background: linear-gradient(135deg, #667eea, #764ba2);
    font-size: 12px;
}

.msg-other .msg-avatar {
    background: linear-gradient(135deg, #00B4D8, #00C853);
}

.msg-body {
    max-width: 70%;
    display: flex;
    flex-direction: column;
}

.msg-me .msg-body {
    align-items: flex-end;
}

.msg-other .msg-body {
    align-items: flex-start;
}

.sender-name {
    font-size: 12px;
    color: #999;
    margin-bottom: 4px;
    display: flex;
    align-items: center;
    gap: 6px;
}

.sender-role {
    background: #f0f0f0;
    border-radius: 4px;
    padding: 1px 4px;
    font-size: 10px;
    color: #666;
}

.msg-bubble {
    padding: 10px 14px;
    border-radius: 12px;
    font-size: 14px;
    line-height: 1.5;
    word-break: break-all;
}

.bubble-me {
    background: linear-gradient(135deg, #00B4D8, #0097B2);
    color: #fff;
    border-bottom-right-radius: 4px;
}

.bubble-other {
    background: #fff;
    color: #333;
    border: 1px solid #e8e8e8;
    border-bottom-left-radius: 4px;
}

.sys-msg {
    color: #999;
    font-size: 12px;
    display: block;
    text-align: center;
}

.msg-img {
    max-width: 200px;
    border-radius: 8px;
}

.msg-time {
    font-size: 11px;
    color: #bbb;
    margin-top: 4px;
}

.input-area {
    display: flex;
    gap: 8px;
    padding: 12px 16px;
    border-top: 1px solid #eee;
    background: #fff;
    flex-shrink: 0;
}
</style>
