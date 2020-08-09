<template>
    <div class="row no-gutters bg-light shadow-sm rounded-lg p-3 mb-3">
        <div class="col-11">
            <p class="m-0">{{todo.body}}</p>
        </div>
        <div class="col-1 align-self-center">
            <button class="btn btn-danger" @click="deleteTodo">
                <box-icon name='trash' animation='tada' color="white"></box-icon>
            </button>
        </div>
    </div>
</template>s

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
        },
    }
</script>

<style scoped>
</style>