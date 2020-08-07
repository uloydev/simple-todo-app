<template>
    <div class="container my- p-3">
        <h2 class="text-center ">Register</h2>
        <hr>
        <form @submit.prevent="register">
            <div class="form-group">
                <label for="inputName">Name</label>
                <input type="text" class="form-control" id="inputName" v-model="name">
            </div>
            <div class="form-group">
                <label for="inputEmail">Email</label>
                <input type="email" class="form-control" id="inputEmail" v-model="email">
            </div>
            <div class="form-group">
                <label for="inputPassword">Password</label>
                <input type="password" class="form-control" id="inputPassword" v-model="password">
            </div>
            <div class="form-group">
                <label for="inputPasswordAgain">Password Again</label>
                <input type="password" class="form-control" id="inputPasswordAgain" v-model="passwordAgain">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
            <div class="text-right mt-3">Already have account ? 
                <router-link class="font-weight-bold " :to="{name: 'login'}">Login Now</router-link>
            </div>
        </form>
    </div>
</template>

<script>

    export default {
        data: function (){
            return { 
                name: '',
                email: '',
                password: '',
                passwordAgain: ''
            }
        },
        components: {
        },
        methods: { 
            register: function () {
                console.log(this.email);
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>