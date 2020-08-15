<template>
  <div id="DiveSiteProposal">
    <div id="pop" class="container-flex mx-4   mt-5 fixed-top">
      <div class="row justify-content-center">
        <div class="card  mb-3 align-item-center d-flex"
          style="max-width: 90vw; margin:20px; top:10px;position: absolute; z-index:10">
          <div class="card-header d-flex justify-content-between">
            <h4>Proposition site de plongée</h4>
            <button type="submit" class="btn btn-danger ml-5" @click="cancel()">
              Annuler
            </button>
          </div>
          <div class="card-body overflow-auto mx-auto" style="width:100%;height: 300px;">
            <form @submit.prevent="submit">
              <div class="row mt-3" v-if="info === true">
                <span class="text-danger" v-if="msg.general">{{ msg.general }}</span>
              </div>
              <div class="row">
                <label>Nom du site de plongée</label>
              </div>
              <div class="row mt-2">
                <input required v-model="name" type="text" placeholder="Nom" />
              </div>
              <div class="row mt-3">
                <span class="text-danger" v-if="msg.name">{{ msg.name }}</span>
              </div>
              <div class="row mt-2">
                <label>Profondeur (en metres)</label>
              </div>
              <div class="row mt-2">
                <input required type="number" min="0" name="depth" v-model="depth">
              </div>
              <div class="row mt-2">
                <label>Description</label>
              </div>
              <div class="row mt-2">
                <textarea required class="text-info" placeholder="Description" v-model="description"></textarea>
              </div>
              <div class="row mt-3">
                <span class="text-danger" v-if="msg.description">{{ msg.description }}</span>
              </div>
              <div class="row mt-2">
                <label>Visivilité</label>
              </div>
              <div class="row mt-2">
                <select required name="visibility" v-model="visibility">
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
                <select required name="current" v-model="current">
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
                <input required type="number" step="any" name="lat" v-model="lat">
              </div>
              <div class="row mt-2">
                <label>Longitude</label>
              </div>
              <div class="row mt-2">
                <input required type="number" step="any" name="lng" v-model="lng">
              </div>
              <div class="row mt-2">
                <button type="submit" class="btn btn-info">
                  Envoi
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import auth from '@/services/authentification';
  export default {
    name: 'DiveSiteProposal',
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
        info: false

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
        if (/^[a-zA-Z0-9_]{10,5000}$/.test(value)) {
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
      },
      async submit() {
        if (this.validator.name === true && this.validator.description === true && this.validator.visibility ===
          true && this.validator.current === true) {
          let body = {
            name: this.name,
            description: this.description,
            depth: parseInt(this.depth),
            visibility: this.visibility,
            current: this.current,
            picture: this.picture,
            lat: parseFloat(this.lat),
            lng: parseFloat(this.lng),
            pathToPicture: "/image/test.jpg",
            verified: false
          }
          const res = await auth.addDiveSite(body).catch(error => {
            requestStatus = error.response.status
          });
          this.$parent.check = false;
        } else {
          this.info = true;
          this.msg['general'] = "Informations manquante dans le formulaire";
        }
      },
      cancel() {
        this.$parent.check = false;
      }
    }
  }
</script>