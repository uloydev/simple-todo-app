

<template>
    <div class="p-2">
        <button class="btn btn-block btn-info mb-3 text-white font-weight-bold" data-toggle="modal" data-target="#createTodo" @click="updateFormState(false)">Create New Todo</button>
        <todo-component 
            v-for="todo in todos" 
            :key="todo.id" 
            :todo="todo"
            @updateFormState="updateFormState"
            @showModal="showModal"
            @getTodos="getTodos"
            :token="user.api_token"
        ></todo-component>

        <div class="modal fade" id="createTodo" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="createTodoLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createTodoLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                    <div class="form-group">
                        <label for="inputBody">Todo</label>
                        <input type="text" class="form-control" id="inputBody" v-model="inputBody" required>
                    </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" @click="createTodo" v-show="!isUpdateForm">Submit</button>
                        <button type="button" class="btn btn-primary" @click="updateTodo" v-show="isUpdateForm">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import TodoComponent from './../components/TodoComponent';
    import Swal from 'sweetalert2';
    
    export default {
        mounted(){
            this.user = JSON.parse(localStorage.getItem('user'));
            this.apiData.api_token = this.user.api_token;
            this.getTodos();
        },
        data: function(){
            return {
                todos: [],
                inputBody: '',
                apiData: {
                    api_token: ''
                },
                user: null,
                isUpdateForm: false
            }
        },
        components: {
            TodoComponent
        },
        methods: {
            getTodos(){
                var data = this.apiData
                console.log(data);
                axios.get('/api/todos',{
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
            createTodo () {
                var data = this.apiData;
                data.body = this.inputBody;
                this.inputBody = '';
                $('#createTodo').modal('hide');
                axios.post('/api/todos',data)
                .then(response => {
                    this.getTodos();
                    Swal.fire('Success', response.data.message, 'success');
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
            updateTodo (todo) {

            },
            showModal () {

            },
            updateFormState (val) {
                this.isUpdateForm = val;
            }
        }
    }
</script>

<style scoped>
</style>