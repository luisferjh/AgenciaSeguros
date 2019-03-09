import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Categoria from './components/Categoria.vue'
import Producto from './components/Producto.vue'
import Cliente from './components/Cliente.vue'
import AsesorVenta from './components/AsesorVenta.vue'
import Compania from './components/Compania.vue'
import Venta from './components/Venta.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/categorias',
      name: 'categorias',
      component: Categoria
    },
    {
      path: '/productos',
      name: 'productos',
      component: Producto
    },
    {
      path: '/clientes',
      name: 'clientes',
      component: Cliente
    },
    {
      path: '/asesores',
      name: 'asesores',
      component: AsesorVenta
    },
    {
      path: '/compañias',
      name: 'compañias',
      component: Compania
    },
    {
      path: '/ventas',
      name: 'ventas',
      component: Venta
    }
  ]
})
