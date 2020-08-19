<template>
    <div id="register">
        <div class="container">
            <div class="card mt-3" style="background-color:#f4f4f4e3;">
                <div class="card-header">
                    <h1>Inscription</h1>
                </div>
                <div class="card-body mx-auto">
                    <div class="row mt-3" v-if="info === true">
                        <span class="text-danger" v-if="msg.general">{{ msg.general }}</span>
                    </div>
                    <div class="row mt-2">
                        <label>Selectionner un type d'utilisateur</label>
                    </div>
                    <div class="row mt-3">
                        <select name="type" v-model="type">
                            <option value="">--Merci de choisir une option--</option>
                            <option value="plongeur">plongeur</option>
                            <option value="club">club</option>
                        </select>
                    </div>
                    <div v-if="type === 'plongeur'">
                        <div class="row mt-2">
                            <label>Nom</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="name" required placeholder="name" v-model="name">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.name">{{msg.name}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Email</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="email" required placeholder="email" v-model="email">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.email">{{msg.email}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Password</label>
                        </div>
                        <div class="row mt-2">
                            <input type="password" name="password" required v-model="password">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.password">{{msg.password}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Password Comfirmation</label>
                        </div>
                        <div class="row mt-2">
                            <input type="password" name="passwordComfirme" required v-model="passwordComfirme">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.passwordComfirme">{{msg.passwordComfirme}}</span>
                        </div>
                    </div>
                    <div v-if="type === 'club'">
                        <div class="row mt-2">
                            <label>Nom du club</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="name" placeholder="name" required v-model="name">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.name">{{msg.name}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Email</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="email" placeholder="email" required v-model="email">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.email">{{msg.email}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Password</label>
                        </div>
                        <div class="row mt-2">
                            <input type="password" name="password" required v-model="password">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.password">{{msg.password}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Password Comfirmation</label>
                        </div>
                        <div class="row mt-2">
                            <input type="password" name="passwordComfirme" required v-model="passwordComfirme">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.passwordComfirme">{{msg.passwordComfirme}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Adresse du club (ville)</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="adress" placeholder="adress" required v-model="adress">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.adress">{{msg.adress}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Telephone</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="phone" placeholder="phone" required v-model="phone">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.phone">{{msg.phone}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Site internet</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="website" placeholder="website" required v-model="website">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.website">{{msg.website}}</span>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <button class="btn btn-info" @click="register()">Envoi</button>
                    </div>
                </div>
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
                msg: [],
                validator: [],
                info: false,
            }
        },
        watch: {
            email(value) {
                this.email = value;
                this.validateEmail(value);
            },
            name(value) {
                this.name = value;
                this.validateName(value);
            },
            password(value) {
                this.password = value;
                this.validatePassword(value);
            },
            passwordComfirme(value) {
                this.passwordComfirme = value;
                this.validatePasswordComfirme(value);
            },
            adress(value) {
                this.adress = value;
                this.validateAdress(value);
            },
            phone(value) {
                this.phone = value;
                this.validatePhone(value);
            },
            website(value) {
                this.website = value;
                this.validateWebsite(value);
            },
        },
        async mounted() {
            if (this.$store.state.userData.id != undefined) {
                this.$router.push({
                    path: '/home'
                })
            }
            this.validator['email'] = false;
            this.validator['name'] = false;
            this.validator['password'] = false;
            this.validator['adress'] = false;
            this.validator['phone'] = false;
            this.validator['website'] = false;

        },
        methods: {
            validateEmail(value) {
                if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value)) {
                    this.msg['email'] = '';
                    this.validator['email'] = true;
                } else {
                    this.msg['email'] = 'Adresse Email incorecte';
                    this.validator['email'] = false;
                }
            },
            validateName(value) {
                if (/^[a-zA-Z0-9_]{3,16}$/.test(value)) {
                    this.msg['name'] = '';
                    this.validator['name'] = true;
                } else {
                    this.msg['name'] = 'Votre nom doit contenir entre 3 et 16 caractere et ou chiffre';
                    this.validator['name'] = false;
                }
            },
            validatePassword(value) {
                if (/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W).{8,}$/.test(value)) {
                    this.msg['password'] = '';
                } else {
                    this.msg['password'] =
                        'Votre mot de passe doit posseder minimum 8 caracteres (1 majuscule, 1 minuscule, 1 chiffre, 1 caractere spécial au minimum)';
                }
            },
            validatePasswordComfirme(value) {
                if (this.password === this.passwordComfirme) {
                    this.msg['passwordComfirme'] = '';
                    this.validator['password'] = true;
                } else {
                    this.msg['passwordComfirme'] = 'Comfirmation differente du mot de passe';
                    this.validator['password'] = false;
                }
            },
            validateAdress(value) {
                if (/[a-zA-Z]+(?:[ '-][a-zA-Z]+)*/.test(value)) {
                    this.msg['adress'] = '';
                    this.validator['adress'] = true;
                } else {
                    this.msg['adress'] =
                        'Votre Adresse doit commencer par une lettre suivie, ou pas, d\'une ou plusieurs lettres pouvant être précédée(s) par un caractère spécial';
                    this.validator['adress'] = false;
                }
            },
            validatePhone(value) {
                if (/^(\d\d\s){4}(\d\d)$/.test(value)) {
                    this.msg['phone'] = '';
                    this.validator['phone'] = true;
                } else {
                    this.msg['phone'] = 'Votre numero doit etre sous la forme 00 00 00 00 00';
                    this.validator['phone'] = false;
                }
            },
            validateWebsite(value) {
                if (/^((https?|ftp|smtp):\/\/)?(www.)?[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$/.test(value)) {
                    this.msg['website'] = '';
                    this.validator['website'] = true;
                } else {
                    this.msg['website'] = 'Url incorect';
                    this.validator['website'] = false;
                }
            },
            async register() {
                if (this.type === "plongeur") {
                    if (this.validator.name === true && this.validator.email === true && this.validator.password ===
                        true) {
                        let body = {
                            type: this.type,
                            name: this.name,
                            email: this.email,
                            password: this.password
                        }
                        let requestStatus;
                        let res = await auth.register(body).catch(error => {
                            requestStatus = error.response.status
                        });
                        if (requestStatus === 500) {
                            this.info = true;
                            this.msg['general'] = "Compte existant pour " + this.email;
                        } else {
                            body = {
                                email: this.email,
                                password: this.password
                            }
                            res = await auth.login(body);
                            this.$store.state.userData = res.data[0];
                            localStorage.setItem('UserData',JSON.stringify(res.data[0]));
                            this.$router.push({
                                path: '/dashboard'
                            })
                        }
                    } else {
                        this.info = true;
                        this.msg['general'] = "Informations manquante dans le formulaire";
                    }
                } else if (this.type === "club") {
                    if (this.validator.name === true && this.validator.email === true && this.validator.password ===
                        true && this.validator.adress && this.validator.phone && this.validator.website) {
                        let body = {
                            type: this.type,
                            name: this.name,
                            email: this.email,
                            password: this.password,
                            adress: this.adress,
                            phone: this.phone,
                            website: this.website
                        }
                        let requestStatus;
                        let res = await auth.register(body).catch(error => {
                            requestStatus = error.response.status
                        });
                        if (requestStatus === 500) {
                            this.info = true;
                            this.msg['general'] = "Compte existant pour " + this.email;
                        } else {
                            body = {
                                email: this.email,
                                password: this.password
                            }
                            res = await auth.login(body);
                            this.$store.state.userData = res.data[0];
                            localStorage.setItem('UserData',JSON.stringify(res.data[0]));
                            this.$router.push({
                                path: '/dashboard'
                            })
                        }
                    }
                } else {
                    this.info = true;
                    this.msg['general'] = "Informations manquante dans le formulaire";
                }

            }
        }
    }
</script>