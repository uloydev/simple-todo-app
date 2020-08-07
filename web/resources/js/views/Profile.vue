<template>
    <div class="p-2">
        <div class="row">
            <div class="col">
                <img src="https://via.placeholder.com/150" width="150" alt="avatar" class="avatar d-block mx-auto rounded-circle img-thumbnail shadow-sm">
            </div>
        </div>
        <div class="container bg-light py-3 my-4 rounded-lg">
            <profile-item fieldName="Name" value="UloyDev"></profile-item>
            <profile-item fieldName="Email" value="uloydev@gmail.com"></profile-item>
            <profile-item fieldName="Joined At" value="1-1-2020"></profile-item>
            <profile-item fieldName="TodosCreated" value="293"></profile-item>
            <profile-item fieldName="TodosFinished" value="268"></profile-item>
        </div>
    </div>
</template>

<script>
    import ProfileItem from './../components/ProfileItem';
    export default {
        components: {
            ProfileItem
        }
    }
</script>

<style lang="scss" scoped>

</style>