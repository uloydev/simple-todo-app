

<template>
    <div class="p-2">
        <todo-component></todo-component>
        <todo-component></todo-component>
        <todo-component></todo-component>
    </div>
</template>

<script>
    import TodoComponent from './../components/TodoComponent'  
    
    export default {
        components: {
            TodoComponent
        }
    }
</script>

<style scoped>
</style>