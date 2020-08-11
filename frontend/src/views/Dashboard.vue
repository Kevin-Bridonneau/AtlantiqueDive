<template>
    <div class="dasboard">
        <h1>Mon compte</h1>
        <div class="container">
            <div v-if="userData.type === 'admin'">
                <div class="card">
                    <h5 class="card-header">Management du site</h5>
                    <div class="card-body d-flex justify-content-between">
                        <a  @click="proposal()" class="btn btn-info">Soumission de site de plongée</a>
                        <a  @click="users()" class="btn btn-info">Utilisateurs</a>
                        <a  @click="diveSite()" class="btn btn-info">Sites de plongée</a>
                    </div>
                </div>
            </div>
            <div v-if="userData.type === 'plongeur'">
                <h3>{{ userData.type }}</h3>
                <h6><label>Nom</label></h6>
                <h6><input type="text" name="name" :placeholder="userData.name" v-model="name"></h6>
                <h6><label>Email</label></h6>
                <h6><input type="text" name="email" :placeholder="userData.email" v-model="email"></h6>
                <h6><label>Password</label></h6>
                <h6><input type="password" name="password" v-model="password"></h6>
                <h6><label>Password Comfirmation</label></h6>
                <h6><input type="password" name="passwordComfirme" v-model="passwordComfirme"></h6>
                <h6><button @click="update()">Mise à jour</button></h6>
            </div>
            <div v-if="userData.type === 'club'">
                <h3>{{ userData.type }}</h3>
                <h6><label>Nom</label></h6>
                <h6><input type="text" name="name" :placeholder="userData.name" v-model="name"></h6>
                <h6><label>Email</label></h6>
                <h6><input type="text" name="email" :placeholder="userData.email" v-model="email"></h6>
                <h6><label>Password</label></h6>
                <h6><input type="password" name="password" v-model="password"></h6>
                <h6><label>Password Comfirmation</label></h6>
                <h6><input type="password" name="passwordComfirme" v-model="passwordComfirme"></h6>
                <h6><label>Adresse du club</label></h6>
                <h6><input type="text" name="adress" :placeholder="userData.adress" v-model="adress"></h6>
                <h6><label>Telephone</label></h6>
                <h6><input type="text" name="phone" :placeholder="userData.phone" v-model="phone"></h6>
                <h6><label>Site internet</label></h6>
                <h6><input type="text" name="website" :placeholder="userData.website" v-model="website"></h6>
                <h6><button @click="update()">Mise à jour</button></h6>
            </div>
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification';
    export default {
        name: 'dasboard',
        components: {
        },
        data() {
                return {
                    userData: {},
                    name: "",
                    email: "",
                    password: "",
                    passwordComfirme: "",
                    adress: "",
                    phone: "",
                    website: "",
                }
        },
        beforeMount() {
            this.userData = this.$store.state.userData;

            if (this.userData.id === undefined) {
                this.$router.push({
                    path: '/login'
                })
            }
        },
        methods: {
            async update() {
                let body = {};
                if (this.userData.type === "plongeur") {
                    body = {
                        id: this.userData.id,
                        type: this.userData.type,
                        name: "",
                        email: "",
                        password: ""
                    };
                } else if (this.userData.type === "club") {
                    body = {
                        id: this.userData.id,
                        type: this.userData.type,
                        name: "",
                        email: "",
                        password: "",
                        adress: "",
                        phone: "",
                        website: ""
                    };
                    if (this.adress !== undefined) {
                        body.adress = this.adress;
                        this.$store.state.userData.adress = this.adress;
                    };
                    if (this.phone !== undefined) {
                        body.phone = this.phone;
                        this.$store.state.userData.phone = this.phone;
                    };
                    if (this.phone !== undefined) {
                        body.phone = this.phone;
                        this.$store.state.userData.phone = this.phone;
                    };
                    if (this.website !== undefined) {
                        body.website = this.website;
                        this.$store.state.userData.website = this.website;
                    }
                }
                if (this.password !== undefined && this.password === this.passwordComfirme) {
                    body.password = this.password;
                }
                if (this.name !== undefined) {
                    body.name = this.name;
                    this.$store.state.userData.name = this.name;
                }
                if (this.email !== undefined) {
                    body.email = this.email;
                    this.$store.state.userData.email = this.email;
                }

                const res = await auth.updateProfile(body);
                this.userData = this.$store.state.userData;
            },
            proposal(){
                console.log('proposal')
            },
            users(){
                console.log('users')
            },
            diveSite(){
                console.log('diveSite')
            },
        }
    }
</script>