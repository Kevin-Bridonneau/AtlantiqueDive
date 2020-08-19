<template>
    <div id="listUser">
        <div class="card mt-3 mb-3 align-item-center d-flex mx-auto" style="width:90%;background-color:#f4f4f4e3;">
            <div class="card-header d-flex justify-content-between">
                <h4>Liste des utilisateurs</h4>
                <button class="btn btn-warning" @click="createUser">Création Utilisateur</button>
            </div>
            <div class="card-body overflow-auto mx-auto" style="width:100%;">
                <div class="row justify-content-between mb-2 mt-2" v-for="user in listUser" v-bind:key="user.id">
                    <h5 class="mr-2"> <span style="font-style:italic;"></span> NOM : {{ user.name }}</h5>
                    <p class="mr-2">Type: {{ user.type }} </p>

                    <button class="btn btn-success mr-2" @click="updateUser(user)">Modifier</button>
                    <button class="btn btn-danger mr-2" @click="deleteUser(user.id)">Supprimer</button>
                </div>
            </div>
        </div>
        <div v-if="createButton == true">
            <CreateUser/>
        </div>
        <div v-if="updateButton == true">
            <UpdateUser/>
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification';
    import CreateUser from '@/components/CreateUser.vue';
    import UpdateUser from '@/components/UpdateUser.vue';

    export default {
        name: 'listUser',
        components: {
            CreateUser,
            UpdateUser,
        },
        data() {
            return {
                listUser: [],
                createButton: false,
                updateButton: false,
                userData: {}
            }
        },
        async mounted() {
            if (this.$store.state.userData.id === undefined || this.$store.state.userData.type !== "admin") {
                this.$router.push({
                    path: '/'
                })
            }
            let token = this.$store.state.userData.remember_token
            let id = this.$store.state.userData.id
            let body = {
                id: id,
                token: token
            }
            let res = await auth.listUser(body);
            this.listUser = res.data.list;
        },
        methods: {
            async updateUser(user) {
                this.userData = user;
                this.updateButton = true;
            },

            async deleteUser(id) {
                let res = await auth.deleteUser(id);
                res = await auth.listUser();
                this.listUser = res.data.list;
            },

            createUser() {
                this.createButton = true;
            }

        }
    }
</script>