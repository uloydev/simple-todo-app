import Vue from 'vue';
import VueRouter from 'vue-router';

import Login from './views/Login';
import Register from './views/Register';
import Home from './views/Home';
import History from './views/History';
import Profile from './views/Profile';

Vue.use(VueRouter);

export const router = new VueRouter({
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
            path: '/profile',
            name: 'profile',
            component: Profile
        },
        {
            path: '/history',
            name: 'history',
            component: History
        },
        {
            path: '/',
            name: 'home',
            component: Home
        }
    ]
});