import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    'baseURL' : "http://localhost:8000/",
    'Api_Bearer_token': "",
  },
  mutations: {},
  actions: {
  },
  modules: {}
})