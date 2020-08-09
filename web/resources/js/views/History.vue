<template>
    <div class="p-2">
        <todo-history-component v-for="todo in todos" :key="todo.id" :todo="todo" :token="user.api_token" @getTodos="getTodos"></todo-history-component>
    </div>
</template>

<script>
    import TodoHistoryComponent from './../components/TodoHistoryComponent';
    import Swal from 'sweetalert2';

    export default {
        mounted(){
            this.user = JSON.parse(localStorage.getItem('user'));
            this.getTodos();
        },
        data(){
            return {
                todos: [],
                user: null
            };
        },
        components: {
            TodoHistoryComponent
        },
        methods: {
            getTodos(){
                var data = this.apiData
                axios.get('/api/todos/finished',{
                    headers: {
                        Authorization: 'Bearer ' + this.user.api_token
                    }
                })
                .then(response => {
                    this.todos = response.data.data;
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
            },
        }
    }
</script>

<style lang="scss" scoped>

</style>