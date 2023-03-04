import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    uname:localStorage.getItem('uname')
  },
  getters: {
  },
  mutations: {
    getuname(state,uname){
      state.uname = uname
      localStorage.setItem('uname',uname)
    },
    logout(){
      localStorage.clear()
    }
  },
  actions: {
  },
  modules: {
  }
})
