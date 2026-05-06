<template>
  <view class="theme-toggle" @click="toggleTheme">
    <view class="toggle-icon" :class="{ dark: isDark }">
      <text class="icon-sun">☀️</text>
      <text class="icon-moon">🌙</text>
    </view>
  </view>
</template>

<script>
import { getCurrentTheme, toggleTheme, ThemeType } from '@/utils/theme.js'

export default {
  data() {
    return {
      isDark: false
    }
  },
  onLoad() {
    this.isDark = getCurrentTheme() === ThemeType.DARK

    // 监听主题变化
    uni.$on('themeChange', (theme) => {
      this.isDark = theme === ThemeType.DARK
    })
  },
  onUnload() {
    uni.$off('themeChange')
  },
  methods: {
    toggleTheme() {
      const newTheme = toggleTheme()
      this.isDark = newTheme === ThemeType.DARK
    }
  }
}
</script>

<style scoped>
.theme-toggle {
  width: 60rpx;
  height: 60rpx;
  display: flex;
  align-items: center;
  justify-content: center;
}

.toggle-icon {
  width: 48rpx;
  height: 48rpx;
  position: relative;
  transform: rotate(0deg);
  transition: transform 0.3s ease;
}

.toggle-icon.dark {
  transform: rotate(180deg);
}

.icon-sun,
.icon-moon {
  position: absolute;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 36rpx;
  transition: opacity 0.3s ease;
}

.toggle-icon .icon-sun {
  opacity: 1;
}

.toggle-icon.dark .icon-sun {
  opacity: 0;
}

.toggle-icon .icon-moon {
  opacity: 0;
}

.toggle-icon.dark .icon-moon {
  opacity: 1;
}
</style>
