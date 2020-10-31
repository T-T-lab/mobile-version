import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vant from 'vant'
import Search from './components/search.vue'
//引入axios 
import axios from 'axios'
//引入mint-ui
import MintUI from 'mint-ui';
import 'mint-ui/lib/style.min.css';
Vue.component('search',Search)

Vue.use(MintUI);
Vue.use(vant);
Vue.config.productionTip = false
axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.prototype.axios = axios;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
