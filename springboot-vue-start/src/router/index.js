import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Page1 from '../components/Page1.vue'
import Page2 from '../components/Page2.vue'
import Page3 from '../components/Page3.vue'


Vue.use(VueRouter)

const routes = [
    {
        path:'/',
        name: "图书管理",
        redirect: "/page1",
        component: Home,
        meta: {
            title: '图书管理'
        },
        children:[
            {
                path: "/page1",
                name: "查询书籍",
                show: true,
                component: Page1,
                meta: {
                    title: '查询书籍'
                }
            },
            {
                path: "/page2",
                name: "添加书籍",
                show: true,
                component: Page2,
                meta: {
                    title: '添加书籍'
                }
            },
            {
                path: "/page3",
                name: "编辑图书",
                show: false,
                component: Page3,
                meta: {
                    title: '编辑图书'
                }
            }
        ]
    }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
