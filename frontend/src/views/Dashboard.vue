<template>
    <div class="dasboard">
        <h1>Mon compte</h1>
        <div class="container">
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
    export default {
        name: 'dasboard',
        components: {
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
            update(){
                console.log(this.name)
            }
        }
    }
</script>