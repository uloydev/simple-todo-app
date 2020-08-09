<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="container p-3">
                        <div class="row p-2 no-gutters bg-primary rounded-lg">
                            <div class="col">
                                <h3 class="text-bold text-white font-weight-bold m-0">Simple TODO App - {{$route.name}}</h3>
                            </div>
                        </div>
                        <div class="container my-3  ">
                            <router-view @updateNav="updateNav"></router-view>
                        </div>
                        <div class="row p-2 rounded-lg no-gutters" v-if="!authPage">
                            <div class="col-4 pr-2">
                                <router-link tag="button" class="btn btn-primary btn-block rounded-pill" :to="{ name:'home' }">Home</router-link>
                            </div>
                            <div class="col-4">
                                <router-link tag="button" class="btn btn-success btn-block rounded-pill" :to="{ name:'history' }">History</router-link>
                            </div>
                            <div class="col-4 pl-2">
                                <router-link tag="button" class="btn btn-danger btn-block rounded-pill" :to="{ name:'profile' }">Profile</router-link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data: function () {
        return {
            authPage: false
        };
    },
    created(){
        if (!localStorage.getItem('user')){
            if (this.$router.currentRoute.path != '/register'){
                this.$router.replace('/login');
            }
            this.authPage = true;
        }else {
            var authRoutes = ['/login', '/register'];
            if( authRoutes.includes(this.$router.currentRoute.path)){
                this.$router.replace('/');
            }
        }
    },
    methods: {
        updateNav: function (val) {
            this.authPage = val;
        }
    }
}
</script>

<style>
    .card{
        max-height: 100vh;
        overflow: auto;
    }
</style>