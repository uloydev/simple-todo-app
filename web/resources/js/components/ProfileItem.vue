<template>
        <div class="row my-2">
            <div class="col-6 text-right font-weight-bold">
                {{fieldName}}
            </div>
            <div class="col-6">{{value}}</div>
        </div>
</template>

<script>
    export default {
        props: [
            'fieldName',
            'value'
        ]
    }
</script>

<style lang="scss" scoped>

</style>