<template>
    <div class="row no-gutters bg-light shadow-sm rounded-lg p-3 mb-3">
        <div class="col-11">
            <p class="m-0">{{todo.body}}</p>
        </div>
        <div class="col-1 align-self-center">
            <div class="btn-group">
                <button type="button" class="btn btn-danger px-2 rounded dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <box-icon name='menu' color="white"></box-icon>
                </button>
                <div class="dropdown-menu p-3 text-center">
                    <button class="dropdown-item bg-success my-2" @click="finishTodo">
                        <box-icon name='check' animation='tada' ></box-icon> Finish
                    </button>
                    <button class="dropdown-item bg-warning my-2">
                        <box-icon name='edit-alt' animation='tada' ></box-icon> Edit
                    </button>
                    <button class="dropdown-item bg-danger my-2" @click="deleteTodo">
                        <box-icon name='trash' animation='tada' ></box-icon> Delete
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import Swal from 'sweetalert2';
    export default {
        props: [
            'todo',
            'token'
        ],
        methods: {
            deleteTodo(){
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                        axios.delete('/api/todos/' + this.todo.id, {
                            headers: {
                                Authorization: 'Bearer ' + this.token
                            }
                        }).then(response => {
                            Swal.fire(
                            'Deleted!',
                            'Todo has been deleted.',
                            'success'
                            );
                            this.$emit('getTodos');
                        })
                        .catch(error => {
                            console.log(error.response)
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
                });
            },
            finishTodo () {
                axios.post('/api/todos/' + this.todo.id + '/finish', {
                    api_token: this.token
                }).then(response => {
                    Swal.fire(
                        'Success',
                        'Todo Finished',
                        'success'
                    );
                    this.$emit('getTodos');
                }).catch(error => {
                    console.log(error.response)
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

<style scoped>
    .dropdown-toggle::after{
        display: none;
    }
</style>