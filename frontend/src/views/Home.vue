<template>
  <div class="home">
    <navbar />
    <gmap-map :options="{
        zoomControl: true,
        fullscreenControl: false,
        disableDefaultUi: true,
        streetViewControl:false,
        mapTypeId: `satellite`,
       }" :center="center" :zoom="6"
      style="width:100vw;  height: 90vh; top:0px; position: relative; z-index:20; border-bottom: 2px solid black">
      <gmap-marker :key="index" v-for="(m, index) in markers" :icon="customIcon" :position="m.position" @click="openWindow(m)">
      </gmap-marker>
      <gmap-info-window @closeclick="window_open=false" :opened="window_open" :position="infowindow" :options="{
          pixelOffset: {
            width: 0,
            height: -35
          }
        }">
        <div class="container mx-auto">
          <h2>{{ diveSiteName }}</h2>
          <h4>Profondeur: {{ diveSiteDepth }}m</h4>
          <h4>Latitude : {{ infowindow.lat }}</h4>
          <h4>Longitude : {{ infowindow.lng }}</h4>
          <button class="btn btn-info" @click="more">Plus d'infos</button>
        </div>
      </gmap-info-window>
      <div v-if="check === true">
      <gmap-marker :position="proposalPosition">
      </gmap-marker>
      </div>
    </gmap-map>
    <button class="proposalButton btn btn-grad" v-if="proposalButton === true" @click="submit">Proposez un nouveau site
      de
      plongée</button>
    <div v-if="check === true">
      <DiveSiteProposal />
    </div>
    <div class="container">
      <div class="row m-1 mt-5 mb-5 p-3" style="width:100%; background-color:white;border-radius: 25px; -webkit-box-shadow: 0px 10px 24px 0px rgba(0,0,0,0.75);
-moz-box-shadow: 0px 10px 24px 0px rgba(0,0,0,0.75);
box-shadow: 0px 10px 24px 0px rgba(0,0,0,0.75);">
        <h1 class="text text-center" style="width:100%">Êtes-vous un plongeur?</h1>
        <h3 class="text text-center" style="width:100%;color:#003045;">Explorez les sites de plongée</h3>
        <p class="text text-center" style="width:100%">Utilisez notre carte pour découvrir les sites de plongée en
          atlantique, vous y retrouverez toute les infos
          nécessaires pour vous y rendre ainsi que les coordonées des clubs proposant des sorties sur place !</p>
        <h3 class="text text-center" style="width:100%;color:#003045;">Vous connaissez déjà un site de plongée?</h3>
        <p class="text text-center" style="width:100%">Connectez-vous et donnez votre avis sur le site (espèces
          présentes, accéssibilité etc)</p>
        <h3 class="text text-center" style="width:100%;color:#003045;">Vous ne trouvez pas un site de plongée?</h3>
        <p class="text text-center" style="width:100%">Connectez-vous et proposez un site qui sera rapidement validé et
          placé sur la carte par nos experts !</p>
      </div>
      <div class="row m-1 mt-5 mb-5 p-3" style="width:100%; background-color:white; border-radius: 25px;-webkit-box-shadow: 0px 10px 24px 0px rgba(0,0,0,0.75);
-moz-box-shadow: 0px 10px 24px 0px rgba(0,0,0,0.75);
box-shadow: 0px 10px 24px 0px rgba(0,0,0,0.75);p">
        <h1 class="text text-center mt-2" style="width:100%">Êtes-vous un club ou une structure privée?</h1>
        <p class="text text-center" style="width:100%">Connectez-vous et ajoutez vos coordonées sur les différents sites de
          plongée pour devenir plus visible aux clients potentiels !</p>
      </div>
    </div>
    <div v-if="submissionProposal === true">
      <div id="pop" class="container-flex mx-4   mt-5 fixed-top">
        <div class="row justify-content-center">
          <div class="card  mb-3 align-item-center d-flex"
            style="max-width: 90vw; margin:20px; top:10px;position: absolute; z-index:10">
            <div class="card-header d-flex justify-content-between">
              <h4>Attention</h4>
              <button class="btn btn-danger ml-5" @click="close()">
                Fermer
              </button>
            </div>
            <div class="card-body text-center">
              <p>Votre proposition sera analisée par un administrateur et si elle est conforme vous pourez la trouver
                sur la carte</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import marker from '@/assets/logo.png';
  import auth from '@/services/authentification';
  import navbar from '@/components/Header.vue';
  import DiveSiteProposal from '@/components/DiveSiteProposal.vue';
  import GmapCustomMarker from 'vue2-gmap-custom-marker';

  export default {
    name: 'Home',
    components: {
      navbar,
      DiveSiteProposal,
      'gmap-custom-marker': GmapCustomMarker
    },
    data() {
      return {
        proposalPosition: {
          lat: 46.1667,
          lng: -1.15
        },
        customIcon: marker,
        check: false,
        center: {
          //center to La Rochelle city
          lat: 46.1667,
          lng: -1.15
        },
        markers: [],
        info_marker: null,
        infowindow: {
          lat: 0,
          lng: 0
        },
        window_open: false,

        diveSiteName: "",
        diveSiteDepth: 0,
        diveData: {},
        user: {},
        submissionProposal: false,
        proposalButton: false

      }
    },
    async mounted() {
      if (this.$parent.$store.state.userData.type === 'plongeur') {
        this.proposalButton = true;
      }
      this.user = this.$parent.$store.state.userData;
      if (this.$store.state.markers[0] !== undefined) {
        this.markers = this.$store.state.markers;
      } else {
        const res = await auth.getDiveSites();
        res.data.forEach(site => {
          this.markers.push({
            'id': site.id,
            'name': site.name,
            'description': site.description,
            'position': {
              'lat': parseFloat(site.lat),
              'lng': parseFloat(site.lng)
            },
            'depth': site.depth,
            'current': site.current,
            'visibility': site.visibility,
            'pathtopicture': site.pathtopicture
          })
        });
        this.$store.state.markers = this.markers;
      }

    },
    methods: {
      close() {
        this.submissionProposal = false;
      },
      openWindow(diveData) {
        this.infowindow.lat = diveData.position.lat;
        this.infowindow.lng = diveData.position.lng;
        this.diveSiteName = diveData.name;
        this.diveSiteDepth = diveData.depth;
        this.diveData = diveData;
        this.window_open = true;
      },
      more() {
        this.$router.push({
          name: 'DiveInfo',
          params: {
            diveData: this.diveData
          }
        })
      },
      submit() {
        this.check = true;
      }
    }
  }
</script>

<style>
  .proposalButton {


    margin: 10px;
    vertical-align: center;
    right: 0%;
    position: absolute;
    z-index: 200;
    display: flex;
    top: 150px;
  }

  .btn-grad {
    background-image: linear-gradient(to right, #2BC0E4 0%, #EAECC6 51%, #2BC0E4 100%)
  }
</style>