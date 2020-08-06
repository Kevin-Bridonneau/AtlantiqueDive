import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    // 'baseURL' : "http://localhost:8000/",
    // 'Api_Bearer_token': "",
    // 'Api_Refresh_token': "",
    'userData': {},
    'markers' : []
  },
  plugins: [createPersistedState()],
  mutations: {},
  actions: {},
  getters: {
    getUserData: state => {
      return state.userData;
    },
  },
  modules: {}
})