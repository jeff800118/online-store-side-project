import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Login from '../views/Login.vue'
import Daily from '../views/Daily.vue'
import Electric from '../views/Electric.vue'
import Cosmetic from '../views/Cosmetic.vue'
import Outfit from '../views/Outfit.vue'
import Furniture from '../views/Furniture.vue'
import Reg from '../views/Reg.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/reg',
    name: 'Reg',
    component: Reg
  },
  {
    path: '/furniture',
    name: 'Furniture',
    component: Furniture
  },
  {
    path: '/cosmetic',
    name: 'Cosmetic',
    component: Cosmetic
  },
  {
    path: '/outfit',
    name: 'Outfit',
    component: Outfit
  },
  {
    path: '/electric',
    name: 'Electric',
    component: Electric
  },
  {
    path: '/daily',
    name: 'Daily',
    component: Daily
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
