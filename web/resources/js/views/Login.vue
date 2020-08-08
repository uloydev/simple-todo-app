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
    import Swal from 'sweetalert2';

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
                let data = {
                    email : this.email,
                    password : this.password
                };
                axios.post('/api/login', data)
                .then(response => {
                    if (response.status !== 200){
                        Swal.fire('Error', 'can not login user!', 'error');
                    }else {
                        localStorage.setItem('user', JSON.stringify(response.data.data));
                        Swal.fire('Success', 'login success!', 'success');
                        this.$emit('updateNav', false);
                        this.$router.replace('/');
                    }
                })
                .catch(error => {
                    if (error.response.data.errors){
                        let errors = error.response.data.errors;
                        let html = '<ul class="text-danger">';
                        errors.forEach(item => {
                            html += '<li>' + item + '</li>';
                        });
                        html += '</ul>';
                        Swal.fire('Error', html, 'error');
                    }
                });
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>