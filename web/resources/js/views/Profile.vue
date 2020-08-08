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
            <profile-item fieldName="TodosCreated" value="293"></profile-item>
            <profile-item fieldName="TodosFinished" value="268"></profile-item>
            <button class="btn btn-danger d-block mx-auto" @click="logout">Logout</button>
        </div>
    </div>
</template>

<script>
    import ProfileItem from './../components/ProfileItem';
    export default {
        created(){
            this.user = JSON.parse(localStorage.getItem('user'));
        },
        data: function () {
            return {
                user: null,
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
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>