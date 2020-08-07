<template>
    <div class="container my- p-3">
        <h2 class="text-center ">Login</h2>
        <hr>
        <form @submit.prevent="login">
            <div class="form-group">
                <label for="inputEmail">Email</label>
                <input type="email" class="form-control" id="inputEmail" v-model="email">
            </div>
            <div class="form-group">
                <label for="inputPassword">Password</label>
                <input type="password" class="form-control" id="inputPassword" v-model="password">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
            <div class="text-right mt-3">Don't have account ? 
                <router-link class="font-weight-bold " :to="{name: 'register'}">Register Now</router-link>
            </div>
        </form>
    </div>
</template>

<script>

    export default {
        data: function () {
            return {
                email:'',
                password:''
            }
        }, 
        components: {
        },
        methods: { 
            login: function () {
                console.log(this.email + "   ---   " + this.password);
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>