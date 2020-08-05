import './bootstrap';
import Vue from 'vue';
import App from './components/ExampleComponent';
import router from './router';

const vue = new Vue({
    router,
    el: '#app',
    render: h => h(App)
});
