import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Login from '../views/Login.vue'
import Reg from '../views/Reg.vue'
import ProductList from '../views/ProductList.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/productlist/:type',
    name: 'ProductList',
    component: ProductList
  },
  {
    path: '/reg',
    name: 'Reg',
    component: Reg
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
