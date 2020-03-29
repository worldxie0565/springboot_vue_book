import Vue from 'vue'
import './plugins/axios'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

Vue.config.productionTip = false


router.beforeEach((to, from, next) => {

    // set page title
    //if (to.meta.title) {
        document.title = to.meta.title
    //}
    next()

})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
