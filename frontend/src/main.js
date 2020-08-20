import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import * as VueGoogleMaps from 'vue2-google-maps';
import BootstrapVue from 'bootstrap-vue/dist/bootstrap-vue.esm';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

Vue.config.productionTip = false
Vue.use(BootstrapVue);
Vue.use(VueGoogleMaps, {
  load: {
    key: 'PUT YOUR API KEY HERE',
    libraries: 'places',
  },
});

new Vue({
  router,
  store,
  beforeCreate(){ this.$store.commit('initStore');},
  created: function (){
    document.title = 'Je plonge en Atlantique !';
  },
  render: function (h) { return h(App) }
}).$mount('#app')
