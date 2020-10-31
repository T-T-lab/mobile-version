import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/home.vue'
import Me from '../views/me.vue'
import Family from '../views/family.vue'
import Shopcart from '../views/shopcart.vue'
import Details from '../views/details.vue'
import Register from '../views/register.vue'
import Login from '../views/login.vue'
import Searchs from '../views/searchs.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path:'/sea',
    component:Searchs
  },
  {
    path:'/login',
    component:Login
  },
  {
    path:'/reg',
    component:Register
  },
  {
    path: '/details/:pid',
    component: Details,
    props:true
  },
  {
    path:'/me',
    component:Me
  },
  {
    path:'/family',
    component:Family
  },
  {
    path:'/shopcart',
    component:Shopcart
  },
]

const router = new VueRouter({
  routes
})

export default router
