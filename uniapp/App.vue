<script>
export default {
  onLaunch: function () {
    console.log('App Launch - 护送平台')
  },
  onShow: function () {
    console.log('App Show')
  },
  onHide: function () {
    console.log('App Hide')
  }
}
</script>

<style lang="scss">
/* ================================================================
   护送平台 - 全局样式（浅色主题）
   ================================================================ */

/* 基础重置 */
page {
  background-color: #F5F5F5;
  color: #1A1A1A;
  font-size: 28rpx;
  line-height: 1.6;
  box-sizing: border-box;
}

/* 清除 button 默认样式 */
button::after {
  border: none;
}
button {
  margin: 0;
  padding: 0;
  background: transparent;
  border-radius: 0;
  font-size: inherit;
  line-height: inherit;
  color: inherit;
}

/* 清除 scroll-view 滚动条 */
::-webkit-scrollbar {
  display: none;
  width: 0;
  height: 0;
}

/* 安全区域适配 */
.safe-bottom {
  padding-bottom: env(safe-area-inset-bottom);
}
.safe-top {
  padding-top: env(safe-area-inset-top);
}

/* 通用工具类 */
.text-center { text-align: center; }
.text-left { text-align: left; }
.text-right { text-align: right; }
.text-primary { color: #00B4D8; }
.text-danger { color: #FF3366; }
.text-success { color: #00C853; }
.text-warning { color: #FF9800; }
.text-gray { color: #999999; }
.text-white { color: #FFFFFF; }
.text-bold { font-weight: 700; }

.mt-10 { margin-top: 10rpx; }
.mt-20 { margin-top: 20rpx; }
.mt-30 { margin-top: 30rpx; }
.mb-10 { margin-bottom: 10rpx; }
.mb-20 { margin-bottom: 20rpx; }
.mb-30 { margin-bottom: 30rpx; }
.p-20 { padding: 20rpx; }
.p-30 { padding: 30rpx; }
</style>
