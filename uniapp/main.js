import Vue from 'vue'
import App from './App.vue'
import CustomNavbar from './components/custom-navbar/custom-navbar.vue'
import CustomTabbar from './components/custom-tabbar/custom-tabbar.vue'

Vue.config.productionTip = false

Vue.component('custom-navbar', CustomNavbar)
Vue.component('custom-tabbar', CustomTabbar)

App.mpType = 'app'

const app = new Vue({
  ...App,
})
app.$mount()
