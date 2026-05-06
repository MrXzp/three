// ================================================================
// 护送平台 - 通用工具函数
// ================================================================

// ================================================================
// 配置相关
// ================================================================
import { MEDIA_URL } from '@/config/api.js'

/**
 * 处理图片URL，拼接完整前缀
 * @param {string} url 图片相对路径或完整URL
 * @returns {string} 完整的图片URL
 */
function getImageUrl(url) {
  if (!url) return '/static/logo.png'
  // 如果已经是完整URL，直接返回
  if (url.startsWith('http://') || url.startsWith('https://')) {
    return url
  }
  // 将 Windows 路径的反斜杠转换为正斜杠
  url = url.replace(/\\/g, '/')
  // 拼接 MEDIA_URL 前缀
  return MEDIA_URL + '/' + url
}

// ================================================================
// 存储相关
// ================================================================

const STORAGE_KEYS = {
  TOKEN: 'escort_token',
  USER_INFO: 'escort_user_info',
  OPENID: 'escort_openid',
  ESCORT_PHONE: 'escort_phone',
}

function getToken() {
  return uni.getStorageSync(STORAGE_KEYS.TOKEN) || ''
}

function setToken(token) {
  uni.setStorageSync(STORAGE_KEYS.TOKEN, token)
}

function getUserInfo() {
  return uni.getStorageSync(STORAGE_KEYS.USER_INFO) || null
}

function setUserInfo(userInfo) {
  uni.setStorageSync(STORAGE_KEYS.USER_INFO, userInfo)
}

function clearAuth() {
  uni.removeStorageSync(STORAGE_KEYS.TOKEN)
  uni.removeStorageSync(STORAGE_KEYS.USER_INFO)
  uni.removeStorageSync(STORAGE_KEYS.OPENID)
  uni.removeStorageSync(STORAGE_KEYS.ESCORT_PHONE)
}

function checkLogin() {
  return !!getToken()
}

function getEscortPhone() {
  return uni.getStorageSync(STORAGE_KEYS.ESCORT_PHONE) || ''
}

// ================================================================
// 格式化函数
// ================================================================

/**
 * 格式化金额
 */
function formatMoney(amount) {
  if (!amount && amount !== 0) return '0.00'
  return parseFloat(amount).toFixed(2)
}

/**
 * 格式化时间（YYYY-MM-DD HH:mm）
 */
function formatTime(time) {
  if (!time) return ''
  const date = new Date(time)
  const pad = (n) => String(n).padStart(2, '0')
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())} ${pad(date.getHours())}:${pad(date.getMinutes())}`
}

/**
 * 格式化日期（YYYY-MM-DD）
 */
function formatDate(time) {
  if (!time) return ''
  const date = new Date(time)
  const pad = (n) => String(n).padStart(2, '0')
  return `${date.getFullYear()}-${pad(date.getMonth() + 1)}-${pad(date.getDate())}`
}

/**
 * 相对时间（刚刚、几分钟前等）
 */
function formatRelativeTime(dateStr) {
  if (!dateStr) return ''
  const date = new Date(dateStr.replace('T', ' '))
  const now = new Date()
  const diff = Math.floor((now - date) / 1000)
  if (diff < 60) return '刚刚'
  if (diff < 3600) return `${Math.floor(diff / 60)}分钟前`
  if (diff < 86400) return `${Math.floor(diff / 3600)}小时前`
  if (diff < 604800) return `${Math.floor(diff / 86400)}天前`
  return formatDate(dateStr)
}

// ================================================================
// 订单状态
// ================================================================

const ORDER_STATUS = {
  0: { label: '待支付', color: '#ff9500', type: 'warning' },
  1: { label: '待接单', color: '#1890ff', type: 'primary' },
  2: { label: '已接单', color: '#1890ff', type: 'primary' },
  3: { label: '已拒绝', color: '#999', type: 'info' },
  4: { label: '服务中', color: '#52c41a', type: 'success' },
  5: { label: '待确认', color: '#ff9500', type: 'warning' },
  6: { label: '已完成', color: '#52c41a', type: 'success' },
  7: { label: '已取消', color: '#999', type: 'info' },
  8: { label: '退款中', color: '#ff4d4f', type: 'error' },
}

function getOrderStatusInfo(status) {
  return ORDER_STATUS[status] || { label: '未知', color: '#999', type: 'default' }
}

// ================================================================
// UI 辅助
// ================================================================

function showToast(title, icon = 'none', duration = 2000) {
  uni.showToast({ title, icon, duration })
}

function showLoading(title = '加载中...') {
  uni.showLoading({ title, mask: true })
}

function hideLoading() {
  uni.hideLoading()
}

function showModal(options) {
  return new Promise((resolve) => {
    uni.showModal({
      ...options,
      success: (res) => resolve(res),
      fail: () => resolve({ cancel: true }),
    })
  })
}

// ================================================================
// 其他
// ================================================================

function debounce(fn, delay = 500) {
  let timer = null
  return function (...args) {
    if (timer) clearTimeout(timer)
    timer = setTimeout(() => fn.apply(this, args), delay)
  }
}

function throttle(fn, delay = 500) {
  let lastTime = 0
  return function (...args) {
    const now = Date.now()
    if (now - lastTime >= delay) {
      fn.apply(this, args)
      lastTime = now
    }
  }
}

/**
 * 图片预览
 */
function previewImage(current, urls) {
  uni.previewImage({ current, urls })
}

/**
 * 拨打电话
 */
function makePhoneCall(phoneNumber) {
  uni.makePhoneCall({ phoneNumber })
}

/**
 * 复制文本
 */
function copyText(text) {
  uni.setClipboardData({
    data: text,
    success: () => showToast('复制成功'),
  })
}

// ================================================================
// 导出
// ================================================================

export {
  STORAGE_KEYS,
  getToken,
  setToken,
  getUserInfo,
  setUserInfo,
  clearAuth,
  checkLogin,
  getEscortPhone,
  getImageUrl,
  formatMoney,
  formatTime,
  formatDate,
  formatRelativeTime,
  ORDER_STATUS,
  getOrderStatusInfo,
  showToast,
  showLoading,
  hideLoading,
  showModal,
  debounce,
  throttle,
  previewImage,
  makePhoneCall,
  copyText,
}

export default {
  STORAGE_KEYS,
  getToken,
  setToken,
  getUserInfo,
  setUserInfo,
  clearAuth,
  checkLogin,
  getEscortPhone,
  getImageUrl,
  formatMoney,
  formatTime,
  formatDate,
  formatRelativeTime,
  ORDER_STATUS,
  getOrderStatusInfo,
  showToast,
  showLoading,
  hideLoading,
  showModal,
  debounce,
  throttle,
  previewImage,
  makePhoneCall,
  copyText,
}
