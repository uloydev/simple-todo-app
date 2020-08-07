import './bootstrap';
import Vue from 'vue';
import App from './layouts/App';
import {router} from './router';
import 'boxicons';

const vue = new Vue({
    router,
    el: '#app',
    render: h => h(App)
});
