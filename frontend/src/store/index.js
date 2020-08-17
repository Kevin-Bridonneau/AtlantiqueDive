import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    // 'baseURL' : "http://localhost:8000/",
    // 'Api_Bearer_token': "",
    // 'Api_Refresh_token': "",
    'userData': {},
    'markers' : [],
    'key': ""
  },
  mutations: {
    initStore(state){
      if(localStorage.getItem('UserData')){
        state.userData = JSON.parse(localStorage.getItem('UserData'));
      }
    }
  },
  actions: {},
  getters: {
    getUserData: state => {
      return state.userData;
    },
  },
  modules: {}
})