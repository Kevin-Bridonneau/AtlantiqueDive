<template>
  <div class="home">
    <navbar/>
    <gmap-map :center="center" :zoom="6" style="width:100%;  height: 400px;">
      <gmap-marker :key="index" v-for="(m, index) in markers" :position="m.position" @click="openWindow(m)">
      </gmap-marker>
      <gmap-info-window @closeclick="window_open=false" :opened="window_open" :position="infowindow" :options="{
          pixelOffset: {
            width: 0,
            height: -35
          }
        }">
        <h2>{{ diveSiteName }}</h2>
        <h4>Profondeur: {{ diveSiteDepth }}m</h4>
        <h4>Latitude : {{ infowindow.lat }}</h4> 
        <h4>Longitude : {{ infowindow.lng }}</h4>
        <button @click="more">Plus d'infos</button>
      </gmap-info-window>
    </gmap-map>
    <button v-if="this.$store.state.userData.name != undefined" @click="submit">Proposer un nouveau site de plongée</button>
    <div v-if="check === true">
      <DiveSiteProposal/>
    </div>
    
  </div>
</template>

<script>
  import auth from '@/services/authentification';
  import navbar from '@/components/Header.vue';
  import DiveSiteProposal from '@/components/DiveSiteProposal.vue'

  export default {
    name: 'Home',
    components: {
      navbar,
      DiveSiteProposal,
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
        infowindow: {lat: 0, lng: 0},
        window_open: false,

        diveSiteName: "",
        diveSiteDepth: 0,
        diveData:{},
        user: {},  

      }
    },
    async mounted() {
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
      openWindow(diveData) {
        this.infowindow.lat = diveData.position.lat;
        this.infowindow.lng = diveData.position.lng;
        this.diveSiteName = diveData.name;
        this.diveSiteDepth = diveData.depth;
        this.diveData = diveData;
        this.window_open = true;
      },
      more(){
        this.$router.push({ name: 'DiveInfo', params: {diveData: this.diveData }})
      },
      submit(){
        this.check = true;
      }
    }
  }
</script>