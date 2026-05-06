// ================================================================
// 护送平台 - HTTP 请求封装
// 支持 Vue 2 / Vue 3 uni-app 小程序
// ================================================================

// Storage Keys
const STORAGE_KEYS = {
  TOKEN: 'escort_token',
  USER_INFO: 'escort_user_info',
}

// ================================================================
// 内部请求函数
// ================================================================

/**
 * 获取 JWT Token
 */
function getToken() {
  return uni.getStorageSync(STORAGE_KEYS.TOKEN) || ''
}

/**
 * 设置 Token
 */
function setToken(token) {
  uni.setStorageSync(STORAGE_KEYS.TOKEN, token)
}

/**
 * 清除 Token
 */
function clearToken() {
  uni.removeStorageSync(STORAGE_KEYS.TOKEN)
  uni.removeStorageSync(STORAGE_KEYS.USER_INFO)
}

/**
 * 处理业务错误
 */
function handleBizError(data) {
  const msg = data && (data.msg || data.message || '请求失败')
  uni.showToast({ title: msg, icon: 'none', duration: 2000 })
}

/**
 * 处理 HTTP 错误
 */
function handleHttpError(statusCode, data) {
  let msg = '请求失败'
  switch (statusCode) {
    case 401:
      msg = '登录已过期，请重新登录'
      clearToken()
      uni.reLaunch({ url: '/pages/login/login' })
      break
    case 403:
      msg = '无权限访问'
      break
    case 404:
      msg = '请求地址不存在'
      break
    case 500:
      msg = '服务器错误'
      break
    default:
      msg = data && (data.msg || data.message || '网络异常')
  }
  uni.showToast({ title: msg, icon: 'none', duration: 2000 })
}

/**
 * 通用请求函数
 * @param {string} url 完整 URL
 * @param {string} method HTTP 方法
 * @param {object} data 请求数据
 * @param {boolean} needAuth 是否需要认证
 */
function request(url, method = 'GET', data = {}, needAuth = true) {
  return new Promise((resolve, reject) => {
    const header = { 'Content-Type': 'application/json' }
    if (needAuth) {
      const token = getToken()
      if (token) {
        header['Authorization'] = `JWT ${token}`
      }
    }

    uni.request({
      url,
      method,
      data,
      header,
      timeout: 30000,
      success: (res) => {
        const { statusCode, data: responseData } = res

        // HTTP 状态码非 2xx
        if (statusCode < 200 || statusCode >= 300) {
          handleHttpError(statusCode, responseData)
          reject(responseData || { msg: '网络请求失败' })
          return
        }

        // 业务状态码检查
        const d = responseData
        if (d && d.code !== undefined) {
          // 成功码：0 / 200 / 2000 / 4000 均视为成功，其余显示错误并 reject
          const successCodes = [0, 200, 2000, 4000]
          if (!successCodes.includes(d.code)) {
            handleBizError(d)
            reject(d)
            return
          }
        }

        // 成功响应：如果有 data 字段则返回 data，否则返回完整响应
        if (d && d.data !== undefined) {
          resolve(d.data)
        } else {
          resolve(d)
        }
      },
      fail: (err) => {
        uni.showToast({ title: '网络请求失败', icon: 'none' })
        reject(err)
      },
    })
  })
}

// ================================================================
// 导出便捷方法
// ================================================================

/**
 * GET 请求
 * @param {string} url - 完整 URL（已含 BASE_URL）
 * @param {object} data - query 参数
 * @param {boolean} needAuth - 是否需要认证
 */
function get(url, data = {}, needAuth = true) {
  return request(url, 'GET', data, needAuth)
}

/**
 * POST 请求
 * @param {string} url - 完整 URL
 * @param {object} data - body 数据
 * @param {boolean} needAuth - 是否需要认证
 */
function post(url, data = {}, needAuth = true) {
  return request(url, 'POST', data, needAuth)
}

/**
 * PUT 请求
 */
function put(url, data = {}, needAuth = true) {
  return request(url, 'PUT', data, needAuth)
}

/**
 * DELETE 请求
 */
function del(url, data = {}, needAuth = true) {
  return request(url, 'DELETE', data, needAuth)
}

// 导出默认 request 实例方法（向后兼容）
export default {
  get,
  post,
  put,
  del,
  request,
  getToken,
  setToken,
  clearToken,
  STORAGE_KEYS,
}

// 命名导出
export { get, post, put, del, request, getToken, setToken, clearToken, STORAGE_KEYS }
