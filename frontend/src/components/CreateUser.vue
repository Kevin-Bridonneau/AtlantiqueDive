<template>
    <div id="createUser">
        <div id="pop" class="container-flex mx-4   mt-5 fixed-top">
            <div class="row justify-content-center">
                <div class="card align-item-center d-flex "
                    style="width:100%;height: 80vh;position: absolute; z-index:10">
                    <div class="card-header d-flex justify-content-between">
                        <h4>Création d'utilisateur</h4>
                        <button class="btn btn-warning" @click="cancel">Annulation</button>
                    </div>
                    <div class="card-body overflow-auto">
                        <div class="row justify-content-center">
                            <h4>Selectionner le type d'utilisateur</h4>
                        </div>
                        <div class="row justify-content-center">
                            <select name="type" v-model="type">
                                <option value="plongeur">plongeur</option>
                                <option value="club">club</option>
                                <option value="admin">administrateur</option>
                            </select>
                        </div>
                        <div v-if="type === 'plongeur' || type === 'admin'">
                            <div class="row justify-content-center">
                                <h4>Nom</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="name" placeholder="name" v-model="name">
                            </div>
                            <div class="row justify-content-center">
                                <h4>Email</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="email" placeholder="email" v-model="email">
                            </div>
                            <div class="row justify-content-center">
                                <h4>Mot de passe</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="password" name="password" v-model="password">
                            </div>
                            <div class="row justify-content-center">
                                <h4>Comfirmation du mot de passe</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="password" name="passwordComfirme" v-model="passwordComfirme">
                            </div>
                        </div>
                        <div v-if="type === 'club'">
                            <div class="row justify-content-center">
                                <h4>Nom du club</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="name" placeholder="name" v-model="name">
                            </div>
                            <div class="row justify-content-center">
                                <h4>Email</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="email" placeholder="email" v-model="email">
                            </div>
                            <div class="row justify-content-center">
                                <h4>Mot de passe</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="password" name="password" v-model="password">
                            </div>
                            <div class="row justify-content-center">
                                <h4>Comfirmation du mot de passe</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="password" name="passwordComfirme" v-model="passwordComfirme">
                            </div>
                            <div class="row justify-content-center">
                                <h4>Adresse du club</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="adress" placeholder="adress" v-model="adress">
                            </div>
                            <div class="row justify-content-center">
                                <h4>Telephone</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="phone" placeholder="phone" v-model="phone">
                            </div>
                            <div class="row justify-content-center">
                                <h4>Site internet</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="website" placeholder="website" v-model="website">
                            </div>
                        </div>
                        <button class="btn btn-success" @click="submit()">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification';

    export default {
        name: 'createUser',
        data() {
            return {
                type: "",
                name: "",
                email: "",
                password: "",
                passwordComfirme: "",
                adress: "",
                phone: "",
                website: "",
            }
        },
        async mounted() {},
        methods: {
            async submit(){
                if (this.type === "plongeur" || this.type === "admin") {
                    if (this.password !== "" && this.password === this.passwordComfirme) {
                        const body = {
                            type: this.type,
                            name: this.name,
                            email: this.email,
                            password: this.password
                        }
                        let res = await auth.createUser(body);
                        res = await auth.listUser();
                        this.$parent.listUser = res.data.list;
                        this.$parent.createButton = false;

                    } else {
                        console.log('password don\'t match')
                    }
                } else if (this.type === "club") {
                    if (this.password !== "" && this.password === this.passwordComfirme) {
                        const body = {
                            type: this.type,
                            name: this.name,
                            email: this.email,
                            password: this.password,
                            adress: this.adress,
                            phone: this.phone,
                            website: this.website
                        }

                        let res = await auth.createUser(body);
                        res = await auth.listUser();
                        this.$parent.listUser = res.data.list;
                        this.$parent.createButton = false;

                    } else {
                        console.log('password don\'t match')
                    }
                }
            },

            cancel(){
                this.$parent.createButton = false;
            }
        }
    }
</script>