<template>
  <div id="diveInfo">
    <h1>Info Site de Plongée</h1>
    {{ diveData }}
    <h1>Avis</h1>
    {{ notices }}
    <h1>Clubs</h1>
    {{ presences }}
  </div>
</template>

<script>
  import auth from '@/services/authentification';
  export default {
    name: 'diveInfo',
    props: [
        'diveData',
    ],
    data() {
      return {
        notices: [],
        presences: [],
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
      
    },
    methods: {
    }
  }
</script>