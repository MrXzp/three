// ================================================================
// 护送平台 - API 配置
// ================================================================

// 后端接口地址（开发环境）
const BASE_URL = 'http://127.0.0.1:18088'

// 后端媒体文件地址（开发环境）
const MEDIA_URL = 'http://127.0.0.1:18088'

// ================================================================
// 认证相关 API（App 端）
// ================================================================
const AUTH_API = {
  /** 微信登录（code + phone_code） */
  login: `${BASE_URL}/api/escort/app/login/`,
  /** 静默登录（仅 code） */
  silentLogin: `${BASE_URL}/api/escort/app/login/`,
}

// ================================================================
// 用户相关 API（App 端）
// ================================================================
const USER_API = {
  /** 获取当前用户信息 */
  current: `${BASE_URL}/api/escort/app/user/current/`,
  /** 更新用户信息 */
  updateInfo: `${BASE_URL}/api/escort/app/user/update_info/`,
  /** 申请成为陪玩达人 */
  applyHunter: `${BASE_URL}/api/escort/app/apply_hunter/`,
  /** 获取用户余额 */
  balance: `${BASE_URL}/api/escort/app/user/balance/`,
}

// ================================================================
// 文件上传 API（App 端）
// ================================================================
const UPLOAD_API = {
  /** 通用文件上传 */
  upload: `${BASE_URL}/api/escort/app/upload/`,
}

// ================================================================
// 服务相关 API（App 端）
// ================================================================
const SERVICE_API = {
  /** 服务分类列表 */
  categoryList: `${BASE_URL}/api/escort/app/service_category/`,
  /** 服务详情列表 */
  list: `${BASE_URL}/api/escort/app/service/`,
  /** 单个服务详情 */
  detail: (id) => `${BASE_URL}/api/escort/app/service/${id}/`,
}

// ================================================================
// 订单相关 API（App 端）
// ================================================================
const ORDER_API = {
  /** 订单列表（客户） */
  list: `${BASE_URL}/api/escort/app/order/`,
  /** 订单详情 */
  detail: (id) => `${BASE_URL}/api/escort/app/order/${id}/`,
  /** 创建订单 */
  create: `${BASE_URL}/api/escort/app/order/`,
  /** 确认支付 */
  confirmPayment: (id) => `${BASE_URL}/api/escort/app/order/${id}/confirm_payment/`,
  /** 查询支付状态 */
  queryPaymentStatus: (orderNo) => `${BASE_URL}/api/escort/app/order/query_payment_status/?order_no=${orderNo}`,
  /** 取消订单 */
  cancel: (id) => `${BASE_URL}/api/escort/app/order/${id}/cancel/`,
  /** 确认完成（客户最终确认，分配收益） */
  confirmComplete: (id) => `${BASE_URL}/api/escort/app/order/${id}/confirm_complete/`,
  /** 客户确认服务完成（中间步骤） */
  confirmServiceDone: (id) => `${BASE_URL}/api/escort/app/order/${id}/confirm_service_done/`,
  /** 评价订单 */
  review: (id) => `${BASE_URL}/api/escort/app/order/${id}/review/`,
  /** 打手接单 */
  accept: (id) => `${BASE_URL}/api/escort/app/order/${id}/accept/`,
  /** 打手完成服务（开始打单） */
  hunterComplete: (id) => `${BASE_URL}/api/escort/app/order/${id}/hunter_complete/`,
  /** 邀请搭子加入多人订单 */
  inviteBuddy: (id) => `${BASE_URL}/api/escort/app/order/${id}/invite_buddy/`,
  /** 打手获取已接订单列表 */
  my: `${BASE_URL}/api/escort/app/order/my/`,
  /** 客户获取自己下过的订单列表 */
  customerOrders: `${BASE_URL}/api/escort/app/order/customer_orders/`,
  /** 微信支付统一下单 */
  wxPay: `${BASE_URL}/api/escort/app/order/wx_pay/`,
  /** 聊天消息列表（游标分页） */
  chatMessages: (orderId) => `${BASE_URL}/api/escort/app/order/${orderId}/messages/`,
  /** 发送聊天消息 */
  chatSend: (orderId) => `${BASE_URL}/api/escort/app/order/${orderId}/messages/send/`,
}

// ================================================================
// 提现相关 API（App 端）
// ================================================================
const WITHDRAWAL_API = {
  /** 提现记录列表 */
  list: `${BASE_URL}/api/escort/app/withdrawal/`,
  /** 申请提现 */
  apply: `${BASE_URL}/api/escort/app/withdrawal/apply/`,
  /** 检查微信免确认授权状态 */
  checkAuth: `${BASE_URL}/api/escort/app/withdrawal/check_authorization/`,
  /** 请求微信免确认授权 */
  authorizeWx: `${BASE_URL}/api/escort/app/withdrawal/authorize_wx/`,
  /** 确认授权完成 */
  confirmAuth: `${BASE_URL}/api/escort/app/withdrawal/confirm_authorization/`,
}

// ================================================================
// 退款相关 API（App 端）
// ================================================================
const REFUND_API = {
  /** 提交退款申请 */
  apply: `${BASE_URL}/api/escort/app/refund/apply/`,
  /** 我的退款记录列表 */
  my: `${BASE_URL}/api/escort/app/refund/my/`,
  /** 查询退款详情 */
  detail: (id) => `${BASE_URL}/api/escort/app/refund/${id}/`,
  /** 检查订单退款状态 */
  check: (id) => `${BASE_URL}/api/escort/app/refund/${id}/check/`,
}

// ================================================================
// 搭子相关 API（App 端）
// ================================================================
const BUDDY_API = {
  /** 我的搭子列表 */
  my: `${BASE_URL}/api/escort/app/buddy/my/`,
  /** 生成邀请码 */
  generateCode: `${BASE_URL}/api/escort/app/buddy/generate_code/`,
  /** 绑定搭子 */
  bind: `${BASE_URL}/api/escort/app/buddy/bind/`,
  /** 删除搭子 */
  removeBuddy: (id) => `${BASE_URL}/api/escort/app/buddy/${id}/remove_buddy/`,
  /** 注销达人身份 */
  quitHunter: `${BASE_URL}/api/escort/app/user/quit_hunter/`,
}

// ================================================================
// Banner相关 API（App 端）
// ================================================================
const BANNER_API = {
  list: `${BASE_URL}/api/escort/app/banner/`,
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
  REFUND_API,
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
  REFUND_API,
  BANNER_API,
  BUDDY_API,
}
