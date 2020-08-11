<template>
  <div id="DiveSiteProposal">
    <div id="pop" class="container-flex mx-4   mt-5 fixed-top">
      <div class="row justify-content-center">
        <div class="card  mb-3 align-item-center d-flex"
          style="max-width: 80%; margin:20px; top:10px;position: absolute; z-index:10">
          <h4 type="text" class="card-header text-center">Propostition d'un nouveau site de plongée</h4>
          <div class="card-body overflow-auto mx-auto" style="width:100%;height: 300px;">
            <form  @submit.prevent="submit">
              <div class="row">
                <label>Nom du site de plongée</label>
              </div>
              <div class="row">
                <input required v-model="name" type="text" placeholder="Nom" />
              </div>
              <div class="row">
                <label>Profondeur (en metres)</label>
              </div>
              <div class="row">
                <input required type="number" min="0" name="depth" v-model="depth">
              </div>
              <div class="row">
                <label>Description</label>
              </div>
              <div class="row">
                <textarea required class="text-info" placeholder="Description" v-model="description"></textarea>
              </div>
              <div class="row">
                <label>Visivilité</label>
              </div>
              <div class="row">
                <select required name="visibility" v-model="visibility">
                  <option value="">--Merci de choisir une option--</option>
                  <option value="Bonne">Bonne</option>
                  <option value="Moyenne">Moyenne</option>
                  <option value="Mauvaise">Mauvaise</option>
                </select>
              </div>
              <div class="row">
                <label>Courant marin</label>
              </div>
              <div class="row">
                <select required name="current" v-model="current">
                  <option value="">--Merci de choisir une option--</option>
                  <option value="Fort">Fort</option>
                  <option value="Moyen">Moyen</option>
                  <option value="Faible">Faible</option>
                </select>
              </div>
              <div class="row">
                <label>Photo</label>
              </div>
              <div class="row">
                <input type="file" @change="onFileChange">
              </div>
              <div class="row">
                <h5>GPS (exemple : lattitude = 41.65487 )</h5>
              </div>
              <div class="row">
                <label>Lattitude</label>
              </div>
              <div class="row">
                <input required type="number" step="any" name="lat" v-model="lat">
              </div>
              <div class="row">
                <label>Longitude</label>
              </div>
              <div class="row">
                <input required type="number" step="any" name="lng" v-model="lng">
              </div>
              <div class="row">
                <button type="submit" class="btn btn-info">
                  Envoi
                </button>
              </div>
            </form>
            <button type="submit" class="btn btn-danger" @click="cancel()">
              Annuler
            </button>
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
        lng: 0
      }
    },
    async mounted() {},
    methods: {
      async onFileChange(event){
        this.file = event.target.files[0];
      },
      async submit() {
        const body = {
          name: this.name,
          description: this.description,
          depth: parseInt(this.depth),
          visibility: this.visibility,
          current: this.current,
          picture: this.picture,
          lat:  parseFloat(this.lat),
          lng: parseFloat(this.lng),
          pathToPicture: "/image/test.jpg",
          verified: false

        }
        const res = await auth.addDiveSite(body);
        this.$parent.check = false;
      },
      cancel() {
        this.$parent.check = false;
      }
    }
  }
</script>