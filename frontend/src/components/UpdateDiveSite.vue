<template>
    <div id="updateDiveSite">
        <div id="pop" class="container-flex mx-4   mt-5 fixed-top">
            <div class="row justify-content-center">
                <div class="card align-item-center d-flex "
                    style="width:100%;height: 80vh;position: absolute; z-index:10">
                    <div class="card-header d-flex justify-content-between">
                        <h4>Création d'un site de plongée</h4>
                        <button class="btn btn-warning" @click="cancel">Annulation</button>
                    </div>
                    <div class="card-body overflow-auto">
                        <div class="row mb-3 justify-content-center" v-if="info === true">
                            <span class="text-danger " v-if="msg.general">{{ msg.general }}</span>
                        </div>
                        <div class="row">
                            <label>Nom du site de plongée</label>
                        </div>
                        <div class="row mt-2">
                            <input style="width:100%" required v-model="name" type="text" placeholder="Nom" />
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.name">{{ msg.name }}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Profondeur (en metres)</label>
                        </div>
                        <div class="row mt-2">
                            <input style="width:100%" required type="number" min="0" name="depth" v-model="depth">
                        </div>
                        <div class="row mt-2">
                            <label>Description</label>
                        </div>
                        <div class="row mt-2">
                            <textarea style="width:100%" required class="text-info" placeholder="Description"
                                v-model="description"></textarea>
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.description">{{ msg.description }}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Visivilité</label>
                        </div>
                        <div class="row mt-2">
                            <select style="width:100%" required name="visibility" v-model="visibility">
                                <option value="">--Merci de choisir une option--</option>
                                <option value="Bonne">Bonne</option>
                                <option value="Moyenne">Moyenne</option>
                                <option value="Mauvaise">Mauvaise</option>
                            </select>
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.visibility">{{ msg.visibility }}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Courant marin</label>
                        </div>
                        <div class="row mt-2">
                            <select style="width:100%" required name="current" v-model="current">
                                <option value="">--Merci de choisir une option--</option>
                                <option value="Fort">Fort</option>
                                <option value="Moyen">Moyen</option>
                                <option value="Faible">Faible</option>
                            </select>
                        </div>
                        <div class="row mt-3">
                            <span class="text-danger" v-if="msg.current">{{ msg.current }}</span>
                        </div>
                        <div class="row mt-2">
                            <label>Photo</label>
                        </div>
                        <div class="row mt-2">
                            <input type="file" @change="onFileChange">
                        </div>
                        <div class="row mt-2">
                            <label>GPS (exemple : lattitude = 41.65487 )</label>
                        </div>
                        <div class="row mt-2">
                            <label>Lattitude</label>
                        </div>
                        <div class="row mt-2">
                            <input style="width:100%" required type="number" step="any" name="lat" v-model="lat">
                        </div>
                        <div class="row mt-2">
                            <label>Longitude</label>
                        </div>
                        <div class="row mt-2">
                            <input style="width:100%" required type="number" step="any" name="lng" v-model="lng">
                        </div>
                        <div class="row mt-2">
                            <button style="width:100%" class="btn btn-info" @click="update">
                                Envoi
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification';
    import axios from 'axios';
    export default {
        name: 'updateDiveSite',
        data() {
            return {
                description: "",
                name: "",
                depth: 0,
                visibility: "",
                current: "",
                file: null,
                lat: 0,
                lng: 0,
                msg: [],
                validator: [],
                info: false,
                checkFile: false
            }
        },
        watch: {
            name(value) {
                this.name = value;
                this.validateName(value);
            },
            description(value) {
                this.description = value;
                this.validateDescription(value);
            },
            visibility(value) {
                this.visibility = value;
                this.validateVisibility(value);
            },
            current(value) {
                this.current = value;
                this.validateCurrent(value);
            },
        },
        async mounted() {
            this.validator['name'] = false;
            this.validator['description'] = false;
            this.validator['visibility'] = false;
            this.validator['current'] = false;
            this.name = this.$parent.diveData.name;
            this.description = this.$parent.diveData.description;
            this.depth = this.$parent.diveData.depth;
            this.visibility = this.$parent.diveData.visibility;
            this.current = this.$parent.diveData.current;
            this.lat = this.$parent.diveData.lat;
            this.lng = this.$parent.diveData.lng;
        },
        methods: {
            validateName(value) {
                if (/^[a-zA-Z]+(?:[ '-][a-zA-Z]+)*/.test(value)) {
                    this.msg['name'] = '';
                    this.validator['name'] = true;
                } else {
                    this.msg['name'] = 'Le nom du site doit contenir au moin une lettre';
                    this.validator['name'] = false;
                }
            },
            validateDescription(value) {
                if (/^[a-zA-Z0-9 ,.!'’çêâéèà@;'":€)(-]{10,5000}$/.test(value)) {
                    this.msg['description'] = '';
                    this.validator['description'] = true;
                } else {
                    this.msg['description'] = 'La description doit contenir au moin 10 caractères';
                    this.validator['description'] = false;
                }
            },
            validateVisibility(value) {
                if (this.visibility === 'Bonne' || this.visibility === 'Moyenne' || this.visibility === 'Mauvaise') {
                    this.msg['visibility'] = '';
                    this.validator['visibility'] = true;
                } else {
                    this.msg['visibility'] = 'Merci de choisir la visibilité général du site';
                    this.validator['visibility'] = false;
                }
            },
            validateCurrent(value) {
                if (this.current === 'Fort' || this.current === 'Moyen' || this.current === 'Faible') {
                    this.msg['current'] = '';
                    this.validator['current'] = true;
                } else {
                    this.msg['current'] = 'Merci de choisir le courant moyen sur place';
                    this.validator['current'] = false;
                }
            },
            async onFileChange(event) {
                this.file = event.target.files[0];
                this.checkFile = true;
            },
            async update() {
                // let body = {
                //     id: this.$parent.diveData.id,
                // };
                let formData = new FormData();
                formData.append('id', this.$parent.diveData.id);
                if (this.validator['name'] === true && this.name !== this.$parent.diveData.name) {
                    formData.append('name', this.name);
                }
                else{
                    formData.append('name', this.$parent.diveData.name);
                }
                if (this.validator['description'] === true && this.description !== this.$parent.diveData
                    .description) {
                    formData.append('description', this.description);
                };
                if (this.depth !== this.$parent.diveData.depth) {
                    formData.append('depth', this.depth);
                };
                if (this.validator['current'] === true && this.current !== this.$parent.diveData.current) {
                    formData.append('current', this.current);
                };
                if (this.validator['visibility'] === true && this.visibility !== this.$parent.diveData.visibility) {
                    formData.append('visibility', this.visibility);
                };
                if (this.lat !== this.$parent.diveData.lat) {
                    formData.append('lat', parseFloat(this.lat));
                };
                if (this.lng !== this.$parent.diveData.lng) {
                    formData.append('lng', parseFloat(this.lng));
                };
                if (this.checkFile === true) {
                    formData.append('pathToPicture', this.file);
                };
                // if(!Object.keys(formData).length){
                //     this.info = true;
                //     this.msg['general'] = "Aucun changement effectué";
                // }
                // else{
                    this.info = false;
                    axios.post('/api/admin/updateDiveSite',
                            formData,
                        )
                        .catch(function () {
                            console.log('FAILURE!!');
                        });
                    // let requestStatus;

                    // let res = await auth.updateDiveSite(body).catch(error => {
                    //     requestStatus = error.response.status
                    // });
                    let res = await auth.getDiveSites();
                    this.$parent.listDiveSite = res.data;
                    this.$parent.updateButton = false;
                // }


            },
            cancel() {
                this.$parent.updateButton = false;
            }
        }
    }
</script>