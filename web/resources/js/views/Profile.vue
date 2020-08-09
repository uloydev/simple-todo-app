<template>
    <div class="p-2">
        <div class="row">
            <div class="col">
                <img src="https://via.placeholder.com/150" width="150" alt="avatar" class="avatar d-block mx-auto rounded-circle img-thumbnail shadow-sm">
            </div>
        </div>
        <div class="container bg-light py-3 my-4 rounded-lg">
            <profile-item fieldName="Name" :value="user.name"></profile-item>
            <profile-item fieldName="Email" :value="user.email"></profile-item>
            <profile-item fieldName="Joined At" :value="dateString(user.created_at)"></profile-item>
            <profile-item fieldName="TodosCreated" :value="todoCreated"></profile-item>
            <profile-item fieldName="TodosFinished" :value="todoFinished"></profile-item>
            <button class="btn btn-danger d-block mx-auto" @click="logout">Logout</button>
        </div>
    </div>
</template>

<script>
    import ProfileItem from './../components/ProfileItem';
    export default {
        created(){
            this.user = JSON.parse(localStorage.getItem('user'));
            getStats();
        },
        data: function () {
            return {
                user: null,
                todoCreated: 0,
                todoFinished: 0,
            };
        },
        components: {
            ProfileItem
        },
        methods: { 
            logout : function () {
                localStorage.removeItem('user');
                this.$emit('updateNav', true);
                this.$router.replace('/login');
            },
            dateString (text) {
                return new Date(text).toDateString()
            },
            getStats () {
                var data = {
                    api_token: user.api_token
                };
                axios.get('/api/todos/stats', data).
                then(response => {
                    this.todoCreated = response.data.data.todoCount;
                    this.todoFinished = response.data.data.finishedCount;
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