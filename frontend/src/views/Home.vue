<template>
  <div class="home">
    <navbar />
    <gmap-map :options="{zoomControl: false,fullscreenControl: false,disableDefaultUi: true}" :center="center" :zoom="6"
      style="width:100vw;  height: 90vh; top:0px; position: fixed; z-index:1; border-bottom: 2px solid black">
      <gmap-marker :key="index" v-for="(m, index) in markers" :position="m.position" @click="openWindow(m)">
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
    </gmap-map>
    <button class="proposalButton btn btn-grad" v-if="proposalButton === true" @click="submit">Proposer un nouveau site
      de
      plongée</button>
    <div v-if="check === true">
      <DiveSiteProposal />
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
      close(){
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
    position: fixed;

    z-index: 1;
  }

  .btn-grad {
    background-image: linear-gradient(to right, #2BC0E4 0%, #EAECC6 51%, #2BC0E4 100%)
  }
</style>