<template>
    <div class="dasboard">
        <div class="container">
            <div v-if="userData.type === 'admin'">
                <div class="card mt-3" style="background-color:#f4f4f4e3;">
                    <div class="card-header d-flex justify-content-between">
                        <h5>Management du site</h5>
                        <button type="submit" class="btn btn-danger ml-5" @click="logout()">
                            Déconnexion
                        </button>
                    </div>
                    <div class="card-body d-flex justify-content-between">
                        <a @click="proposal()" class="btn btn-info">Soumission de site de plongée</a>
                        <a @click="users()" class="btn btn-info">Utilisateurs</a>
                        <a @click="diveSite()" class="btn btn-info">Sites de plongée</a>
                    </div>
                </div>
            </div>
            <div v-if="userData.type === 'plongeur'">
                <div class="card mt-3" style="background-color:#f4f4f4e3;">
                    <div class="card-header d-flex justify-content-between">
                        <h5>Mon compte</h5>
                        <button type="submit" class="btn btn-danger" @click="logout()">
                            Déconnexion
                        </button>
                    </div>
                    <div class="card-body mx-auto">
                        <div class="row mb-3" v-if="info === true">
                            <span class="text-success" v-if="msg.general">{{ msg.general }}</span>
                        </div>
                        <div class="row mb-3" v-if="badRequest === true">
                            <span class="text-danger" v-if="msg.general">{{ msg.general }}</span>
                        </div>
                        <div class="row">
                            <label style="text-transform:uppercase">{{ userData.type }}</label>
                        </div>
                        <div class="row mt-2">
                            <label>Nom</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="name" :placeholder="userData.name" v-model="name">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.name">{{msg.name}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Email</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="email" :placeholder="userData.email" v-model="email">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.email">{{msg.email}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Password</label>
                        </div>
                        <div class="row mt-2">
                            <input type="password" name="password" v-model="password">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.password">{{msg.password}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Password Comfirmation</label>
                        </div>
                        <div class="row mt-2">
                            <input type="password" name="passwordComfirme" v-model="passwordComfirme">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.passwordComfirme">{{msg.passwordComfirme}}</span>
                        </div>
                        <div class="row mt-2">
                            <button class="btn btn-success" @click="update()">Mise à jour</button>
                        </div>
                    </div>
                </div>
            </div>
            <div v-if="userData.type === 'club'">
                <div class="card mt-3" style="background-color:#f4f4f4e3;">
                    <div class="card-header d-flex justify-content-between">
                        <h5>Mon compte</h5>
                        <button type="submit" class="btn btn-danger" @click="logout()">
                            Déconnexion
                        </button>
                    </div>
                    <div class="card-body mx-auto">
                        <div class="row mb-3" v-if="info === true">
                            <span class="text-success" v-if="msg.general">{{ msg.general }}</span>
                        </div>
                        <div class="row mb-3" v-if="badRequest === true">
                            <span class="text-danger" v-if="msg.general">{{ msg.general }}</span>
                        </div>
                        <div class="row">
                            <label style="text-transform:uppercase">type: {{ userData.type }}</label>
                        </div>
                        <div class="row mt-2">
                            <label>Nom de la structure</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="name" :placeholder="userData.name" v-model="name">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.name">{{msg.name}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Email</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="email" :placeholder="userData.email" v-model="email">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.email">{{msg.email}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Password</label>
                        </div>
                        <div class="row mt-2">
                            <input type="password" name="password" v-model="password">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.password">{{msg.password}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Password Comfirmation</label>
                        </div>
                        <div class="row mt-2">
                            <input type="password" name="passwordComfirme" v-model="passwordComfirme">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.passwordComfirme">{{msg.passwordComfirme}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Adresse de la structure</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="adress" :placeholder="userData.adress" v-model="adress">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.adress">{{msg.adress}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Telephone</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="phone" :placeholder="userData.phone" v-model="phone">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.phone">{{msg.phone}}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Site internet</label>
                        </div>
                        <div class="row mt-2">
                            <input type="text" name="website" :placeholder="userData.website" v-model="website">
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.website">{{msg.website}}</span>
                        </div>
                        <div class="row mt-2">
                            <button class="btn btn-success" @click="update()">Mise à jour</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification';
    export default {
        name: 'dasboard',
        components: {},
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
                msg: [],
                validator: [],
                info: false,
                badRequest:false,
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
        beforeMount() {
            this.userData = this.$store.state.userData;

            if (this.userData.id === undefined) {
                this.$router.push({
                    path: '/login'
                })
            }
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
            logout() {
                this.userData = {};
                this.$store.state.userData = {};
                localStorage.removeItem('UserData');
                this.$router.push({
                    path: '/'
                })
            },
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
                    if (this.validator.adress === true) {
                        body.adress = this.adress;
                        this.$store.state.userData.adress = this.adress;
                    };
                    if (this.validator.phone === true) {
                        body.phone = this.phone;
                        this.$store.state.userData.phone = this.phone;
                    };
                    if (this.validator.website === true) {
                        body.website = this.website;
                        this.$store.state.userData.website = this.website;
                    }
                }
                if (this.validator.password === true) {
                    body.password = this.password;
                }
                if (this.validator.name === true) {
                    body.name = this.name;
                    this.$store.state.userData.name = this.name;
                }
                if (this.validator.email === true) {
                    body.email = this.email;
                    this.$store.state.userData.email = this.email;
                }
                let requestStatus;
                let res = await auth.updateProfile(body).catch(error => {
                    requestStatus = error.response.status
                });
                if (requestStatus === 500) {
                    this.badRequest = true;
                    this.info = false;
                    this.msg['general'] = "Merci de controler votre formulaire";
                } else {
                    this.userData = this.$store.state.userData;
                    this.msg.general = "Compte mis à jour";
                    this.info = true;
                    this.badRequest = false;
                }
            },
            proposal() {
                this.$router.push({
                    path: '/admin/listProposal'
                })
            },
            users() {
                this.$router.push({
                    path: '/admin/listUser'
                })
            },
            diveSite() {
                this.$router.push({
                    path: '/admin/listDiveSite'
                })
            },
        }
    }
</script>