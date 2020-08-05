import Vue from 'vue';
import VueRouter from 'vue-router';

import Login from './views/Login';
import Register from './views/Register';
import Home from './views/Home';

Vue.use(VueRouter);

const router = new VueRouter({
    mode: 'history',
    routes: [
        {
            path: '/login',
            name: 'login',
            component: Login
        },
        {
            path: '/register',
            name: 'register',
            component: Register
        },
        {
            path: '/',
            name: 'home',
            component: Home
        }
    ]
});