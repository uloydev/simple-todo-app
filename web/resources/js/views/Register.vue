<template>
    <div class="container my- p-3">
        <h2 class="text-center ">Register</h2>
        <hr>
        <form @submit.prevent="register">
            <div class="form-group">
                <label for="inputName">Name</label>
                <input type="text" class="form-control" id="inputName" v-model="name" required>
            </div>
            <div class="form-group">
                <label for="inputEmail">Email</label>
                <input type="email" class="form-control" id="inputEmail" v-model="email" required>
            </div>
            <div class="form-group">
                <label for="inputPassword">Password</label>
                <input type="password" class="form-control" id="inputPassword" v-model="password" required>
            </div>
            <div class="form-group">
                <label for="inputPasswordAgain">Password Again</label>
                <input type="password" class="form-control" :class="{'is-invalid' : !isPasswordSame}" id="inputPasswordAgain" v-model="passwordAgain" required @input="checkPassword" aria-describedby="passwordAgainCheck">
                <div class="invalid-feedback" id="passwordAgainCheck">
                    password must be same!
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
            <div class="text-right mt-3">Already have account ? 
                <router-link class="font-weight-bold " :to="{name: 'login'}">Login Now</router-link>
            </div>
        </form>
    </div>
</template>

<script>
    import Swal from 'sweetalert2';

    export default {
        data: function (){
            return { 
                name: '',
                email: '',
                password: '',
                passwordAgain: '',
                isPasswordSame: true
            }
        },
        components: {
        },
        methods: { 
            register: function () {
                let data = {
                    name : this.name,
                    email : this.email,
                    password : this.password
                };
                if (!this.isPasswordSame){
                    Swal.fire({
                        title: 'Error',
                        text: 'password must be same!',
                        icon: 'error'
                    });
                }else{
                    axios.post('/api/register', data)
                    .then(response => {
                        if (response.status !== 201){
                            Swal.fire('Error', 'can not register user!', 'error');
                        }else {
                            localStorage.setItem('user', JSON.stringify(response.data.data));
                            Swal.fire('Success', 'register success!', 'success');
                            this.$emit('updateNav', false);
                            this.$router.replace('/');
                        }
                    })
                    .catch(error => {
                        console.log(error.response);
                        let errors = error.response.data.errors;
                        let html = '<ul class="text-danger">';
                        errors.forEach(item => {
                            html += '<li>' + item + '</li>';
                        });
                        html += '</ul>';
                        Swal.fire('Error', html, 'error');
                    });
                }
            },
            checkPassword: function () {
                this.isPasswordSame = this.password == this.passwordAgain;
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>