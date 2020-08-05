<template>
  <div class="home">
    <gmap-map :center="center" :zoom="6" style="width:100%;  height: 400px;">
      <gmap-marker :key="index" v-for="(m, index) in markers" :position="m.position" @click="popInfo(m.name)" >
      </gmap-marker>
    </gmap-map>
  </div>
</template>

<script>
  export default {
    name: 'Home',
    components: {},
    data() {
      return {
        diveSite: {},
        center: {
          //center to La Rochelle city
          lat: 46.1667,
          lng: -1.15
        },
         markers: [
          {
            name: "Epave du cimcour",
            description: "description 1",
            date_build: "",
            position: {lat: 46.03333333333333, lng: -2.1666666666666665}
          },
        ],
      }
    },
    async mounted() {
      
    },
    methods: {
      async popInfo(name){
        console.log(name)
      }
    }
  }
</script>