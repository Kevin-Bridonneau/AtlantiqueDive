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
                        <div class="row mb-3 justify-content-center" v-if="info === true">
                            <span class="text-danger " v-if="msg.general">{{ msg.general }}</span>
                        </div>
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
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.name">{{msg.name}}</span>
                            </div>
                            <div class="row justify-content-center">
                                <h4>Email</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="email" placeholder="email" v-model="email">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.email">{{msg.email}}</span>
                            </div>
                            <div class="row justify-content-center">
                                <h4>Mot de passe</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="password" name="password" v-model="password">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.password">{{msg.password}}</span>
                            </div>
                            <div class="row justify-content-center">
                                <h4>Comfirmation du mot de passe</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="password" name="passwordComfirme" v-model="passwordComfirme">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.passwordComfirme">{{msg.passwordComfirme}}</span>
                            </div>
                        </div>
                        <div v-if="type === 'club'">
                            <div class="row justify-content-center">
                                <h4>Nom du club</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="name" placeholder="name" v-model="name">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.name">{{msg.name}}</span>
                            </div>
                            <div class="row justify-content-center">
                                <h4>Email</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="email" placeholder="email" v-model="email">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.email">{{msg.email}}</span>
                            </div>
                            <div class="row justify-content-center">
                                <h4>Mot de passe</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="password" name="password" v-model="password">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.password">{{msg.password}}</span>
                            </div>
                            <div class="row justify-content-center">
                                <h4>Comfirmation du mot de passe</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="password" name="passwordComfirme" v-model="passwordComfirme">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.passwordComfirme">{{msg.passwordComfirme}}</span>
                            </div>
                            <div class="row justify-content-center">
                                <h4>Adresse du club</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="adress" placeholder="adress" v-model="adress">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.adress">{{msg.adress}}</span>
                            </div>
                            <div class="row justify-content-center">
                                <h4>Telephone</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="phone" placeholder="phone" v-model="phone">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.phone">{{msg.phone}}</span>
                            </div>
                            <div class="row justify-content-center">
                                <h4>Site internet</h4>
                            </div>
                            <div class="row justify-content-center">
                                <input type="text" name="website" placeholder="website" v-model="website">
                            </div>
                            <div class="row mt-3 justify-content-center">
                                <span class="text-danger" v-if="msg.website">{{msg.website}}</span>
                            </div>
                        </div>
                        <button class="btn btn-success mt-2 mb-2" style="width:100%" @click="submit()">Submit</button>
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
                msg: [],
                validator: [],
                info: false,
                badRequest: false,
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
        async mounted() {},
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
            async submit() {
                if (this.type === "plongeur" || this.type === "admin") {
                    if (this.validator.name === true && this.validator.email === true && this.validator.password === true) {
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
                        this.info = true;
                        this.msg['general'] = "Merci de controler votre formulaire";
                    }
                } else if (this.type === "club") {
                    if (this.validator.name === true && this.validator.email === true && this.validator.passwordComfirme ===true && this.validator.adress === true && this.validator.phone === true && this.validator.website === true ) {
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
                        this.info = true;
                        this.msg['general'] = "Merci de controler votre formulaire";
                    }
                }
                else {
                        this.info = true;
                        this.msg['general'] = "Merci de controler votre formulaire";
                    }
            },

            cancel() {
                this.$parent.createButton = false;
            }
        }
    }
</script>