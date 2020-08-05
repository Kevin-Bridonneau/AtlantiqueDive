<template>
    <div id="register">
        <h1>Register</h1>
        <div class="container">
            <select name="type" v-model="type">
                <option value="plongeur">plongeur</option>
                <option value="club">club</option>
            </select><br>
            <div v-if="type === 'plongeur'">
                <label>Nom</label>
                <input type="text" name="name" placeholder="name" v-model="name">
                <label>Email</label>
                <input type="text" name="email" placeholder="email" v-model="email">
                <label>Password</label>
                <input type="password" name="password" v-model="password">
                <label>Password Comfirmation</label>
                <input type="password" name="passwordComfirme" v-model="passwordComfirme">
                <button @click="register()">Envoi</button>
            </div>
            <div v-if="type === 'club'">
                <label>Nom du club</label>
                <input type="text" name="name" placeholder="name" v-model="name">
                <label>Email</label>
                <input type="text" name="email" placeholder="email" v-model="email">
                <label>Password</label>
                <input type="password" name="password" v-model="password">
                <label>Password Comfirmation</label>
                <input type="password" name="passwordComfirme" v-model="passwordComfirme">
                <label>Adresse du club</label>
                <input type="text" name="adress" placeholder="adress" v-model="adress">
                <label>Telephone</label>
                <input type="text" name="phone" placeholder="phone" v-model="phone">
                <label>Site internet</label>
                <input type="text" name="website" placeholder="website" v-model="website">
                <button @click="register()">Envoi</button>
            </div>
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification'

    export default {
        name: 'Register',
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
        async mounted() {
            if (this.$store.state.userData.id != undefined) {
                this.$router.push({
                    path: '/home'
                })
            }
        },
        methods: {
            async register() {
                if (this.type === "plongeur") {
                    if (this.password !== "" && this.password === this.passwordComfirme) {
                        const body = {
                            type: this.type,
                            name: this.name,
                            email: this.email,
                            password: this.password
                        }

                        const res = await auth.register(body);
                        this.$router.push({
                            path: '/login'
                        })
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
                            phone: this.password,
                            website: this.website
                        }

                        const res = await auth.register(body);
                        this.$router.push({
                            path: '/login'
                        })
                    } else {
                        console.log('password don\'t match')
                    }
                }

            }
        }
    }
</script>