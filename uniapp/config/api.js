// ================================================================
// 护送平台 - API 配置
// ================================================================

// 后端接口地址（开发环境）
// 请根据实际情况修改为实际后端地址
const BASE_URL = 'http://127.0.0.1:18088'

// 后端媒体文件地址（开发环境）
// 请根据实际情况修改为实际后端地址，用于拼接图片等媒体文件的完整URL
const MEDIA_URL = 'http://127.0.0.1:18088'

// ================================================================
// 认证相关 API
// ================================================================
const AUTH_API = {
  /** 微信登录（code + phone_code） */
  login: `${BASE_URL}/api/escort/escort_user/wx_login/`,
  /** 静默登录（仅 code） */
  silentLogin: `${BASE_URL}/api/escort/escort_user/wx_login/`,
}

// ================================================================
// 用户相关 API
// ================================================================
const USER_API = {
  /** 获取当前用户信息 */
  current: `${BASE_URL}/api/escort/escort_user/current/`,
  /** 更新用户信息 */
  updateInfo: `${BASE_URL}/api/escort/escort_user/update_info/`,
  /** 申请成为陪玩达人 */
  applyHunter: `${BASE_URL}/api/escort/apply_hunter/`,
  /** 获取用户余额 */
  balance: `${BASE_URL}/api/escort/escort_user/balance/`,
}

// ================================================================
// 文件上传 API
// ================================================================
const UPLOAD_API = {
  /** 通用文件上传 */
  upload: `${BASE_URL}/api/escort/upload/`,
}

// ================================================================
// 服务相关 API
// ================================================================
const SERVICE_API = {
  /** 服务分类列表 */
  categoryList: `${BASE_URL}/api/escort/service_category/`,
  /** 服务详情列表 */
  list: `${BASE_URL}/api/escort/service/`,
  /** 单个服务详情 */
  detail: (id) => `${BASE_URL}/api/escort/service/${id}/`,
}

// ================================================================
// 订单相关 API
// ================================================================
const ORDER_API = {
  /** 订单列表（客户） */
  list: `${BASE_URL}/api/escort/order/`,
  /** 订单详情 */
  detail: (id) => `${BASE_URL}/api/escort/order/${id}/`,
  /** 创建订单 */
  create: `${BASE_URL}/api/escort/order/`,
  /** 确认支付 */
  confirmPayment: (id) => `${BASE_URL}/api/escort/order/${id}/confirm_payment/`,
  /** 查询支付状态 */
  queryPaymentStatus: (orderNo) => `${BASE_URL}/api/escort/order/query_payment_status/?order_no=${orderNo}`,
  /** 取消订单 */
  cancel: (id) => `${BASE_URL}/api/escort/order/${id}/cancel/`,
  /** 确认完成（客户最终确认，分配收益） */
  confirmComplete: (id) => `${BASE_URL}/api/escort/order/${id}/confirm_complete/`,
  /** 客户确认服务完成（中间步骤） */
  confirmServiceDone: (id) => `${BASE_URL}/api/escort/order/${id}/confirm_service_done/`,
  /** 评价订单 */
  review: (id) => `${BASE_URL}/api/escort/order/${id}/review/`,
  /** 打手接单 */
  accept: (id) => `${BASE_URL}/api/escort/order/${id}/accept/`,
  /** 打手完成服务（开始打单） */
  hunterComplete: (id) => `${BASE_URL}/api/escort/order/${id}/hunter_complete/`,
  /** 邀请搭子加入多人订单 */
  inviteBuddy: (id) => `${BASE_URL}/api/escort/order/${id}/invite_buddy/`,
  /** 打手获取已接订单列表 */
  my: `${BASE_URL}/api/escort/order/my/`,
  /** 微信支付统一下单 */
  wxPay: `${BASE_URL}/api/escort/order/wx_pay/`,
}

// ================================================================
// 提现相关 API
// ================================================================
const WITHDRAWAL_API = {
  /** 提现记录列表 */
  list: `${BASE_URL}/api/escort/withdrawal/`,
  /** 申请提现 */
  apply: `${BASE_URL}/api/escort/withdrawal/apply/`,
}

// ================================================================
// 搭子相关 API
// ================================================================
const BUDDY_API = {
  /** 我的搭子列表 */
  my: `${BASE_URL}/api/escort/buddy/my/`,
  /** 生成邀请码 */
  generateCode: `${BASE_URL}/api/escort/buddy/generate_code/`,
  /** 绑定搭子 */
  bind: `${BASE_URL}/api/escort/buddy/bind/`,
  /** 删除搭子 */
  removeBuddy: (id) => `${BASE_URL}/api/escort/buddy/${id}/remove_buddy/`,
  /** 注销达人身份 */
  quitHunter: `${BASE_URL}/api/escort/escort_user/quit_hunter/`,
}

// ================================================================
// Banner相关 API
// ================================================================
const BANNER_API = {
  list: `${BASE_URL}/api/escort/banner/`,
}

export {
  BASE_URL,
  MEDIA_URL,
  AUTH_API,
  USER_API,
  UPLOAD_API,
  SERVICE_API,
  ORDER_API,
  WITHDRAWAL_API,
  BUDDY_API,
}

export default {
  BASE_URL,
  MEDIA_URL,
  AUTH_API,
  USER_API,
  UPLOAD_API,
  SERVICE_API,
  ORDER_API,
  WITHDRAWAL_API,
  BANNER_API,
  BUDDY_API,
}
