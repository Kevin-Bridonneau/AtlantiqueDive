<template>
  <div class="home">
    <gmap-map :center="center" :zoom="6" style="width:100%;  height: 400px;">
      <gmap-marker :key="index" v-for="(m, index) in markers" :position="m.position" @click="popInfo(m)" >
      </gmap-marker>
    </gmap-map>
  </div>
</template>

<script>
import auth from '@/services/authentification'

  export default {
    name: 'Home',
    components: {},
    data() {
      return {
        center: {
          //center to La Rochelle city
          lat: 46.1667,
          lng: -1.15
        },
         markers: [],
      }
    },
    async mounted() {
      if(this.$store.state.markers[0] !== undefined){
        this.markers = this.$store.state.markers;
      }
      else{
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
      async popInfo(diveData){
        console.log(diveData)
      }
    }
  }
</script>