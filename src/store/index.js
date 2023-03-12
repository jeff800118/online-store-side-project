import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    uname:localStorage.getItem('uname'),
    goods_num:localStorage.getItem('goods_num')
  },
  getters: {
  },
  mutations: {
    getuname(state,uname){
      state.uname = uname
      localStorage.setItem('uname',uname)
    },
    logout(state){
      localStorage.setItem('uname',"")
    },
    addToCart(state,goods_num){
      state.goods_num = goods_num
      localStorage.setItem('goods_num',goods_num)
    }
  },
  actions: {
  },
  modules: {
  }
})
