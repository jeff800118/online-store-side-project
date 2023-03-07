import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(VueAxios,axios)

import md5 from 'js-md5';
Vue.prototype.$md5 = md5

Vue.config.productionTip = false

axios.defaults.baseURL = '/user'

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
