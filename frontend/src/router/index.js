import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Dashboard from '../views/Dashboard.vue'
import DiveInfo from '../views/DiveInfo.vue'
import ListProposal from '../views/ListProposal.vue'
import ListUser from '../views/ListUser.vue'
import ListDiveSite from '../views/ListDiveSite.vue'

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/register',
    name: 'Register',
    component: Register
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard
  },
  {
    path: '/diveInfo',
    name: 'DiveInfo',
    component: DiveInfo,
    props: true
  },
  {
    path: '/admin/listProposal',
    name: 'listProposal',
    component: ListProposal
  },
  {
    path: '/admin/listUser',
    name: 'listUser',
    component: ListUser
  },
  {
    path: '/admin/listDiveSite',
    name: 'listDiveSite',
    component: ListDiveSite
  },
  {
    path: '*',
    redirect: to => {
      return '/';
    },
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
