<template>
  <div id="diveInfo">
    <h1>Info Site de Plongée</h1>
    {{ diveData }}
    <h1>Avis</h1>
    <div v-for="notice in notices" :key="notice.id">
          {{ notice }}
    </div>
    <div v-if="addNoticeButton === true" >
      <button @click="addNotice">Donner mon avis</button>
    </div>
    <div v-else-if="this.$store.state.userData.type === 'plongeur'">
      <h5>Vous avez déja donner votre avis sur cette plongée</h5>
    </div>
    <h1>Clubs</h1>
    {{ presences }}
    <div v-if="this.$store.state.userData.type === 'club' " >
      <!-- ajout d'un 2eme if a faire pour controller si club déja ajouté sur site -->
        <button>Ma structure propose ce site de plongée</button>
    </div>
    <div v-if="check === true" >
      <addNotice/>
    </div>
  </div>
</template>

<script>
  import AddNotice from '@/components/AddNotice.vue'
  import auth from '@/services/authentification';
  export default {
    name: 'diveInfo',
    props: [
        'diveData',
    ],
    components: {
      AddNotice,
    },
    data() {
      return {
        notices: [],
        presences: [],
        check: false,
        addNoticeButton: false,
      }
    },
    async beforeMount(){
      if(this.diveData === undefined){
        this.$router.push({ path: '/' })
      }

      const body = {
          dive_id : this.diveData.id,
      }
      //get notices data
      let res = await auth.getNotice(this.diveData.id);
      this.notices = res.data;

      //get presence data
      res = await auth.getPresence(this.diveData.id);
      this.presences = res.data;

      if(this.$store.state.userData.type === 'plongeur'){
        
        this.notices.forEach(notice => {
          if(notice.user_id !== this.$store.state.userData.id){
            this.addNoticeButton = true;  
          }
          else{
            this.addNoticeButton = false
          }
        });
      
      }
      
    },
    methods: {
        async addNotice(){
          this.check = true;
      }
    }
  }
</script>