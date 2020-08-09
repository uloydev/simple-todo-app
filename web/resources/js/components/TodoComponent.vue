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
                    <button class="dropdown-item bg-success my-2">
                        <box-icon name='check' animation='tada' ></box-icon> Finish
                    </button>
                    <button class="dropdown-item bg-warning my-2">
                        <box-icon name='edit-alt' animation='tada' ></box-icon> Edit
                    </button>
                    <button class="dropdown-item bg-danger my-2">
                        <box-icon name='trash' animation='tada' ></box-icon> Delete
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: [
            'todo'
        ]
    }
</script>

<style scoped>
    .dropdown-toggle::after{
        display: none;
    }
</style>