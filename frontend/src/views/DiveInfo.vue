<template>
  <div id="diveInfo">
    {{ diveData }}
  </div>
</template>

<script>

  export default {
    name: 'diveInfo',
    props: [
        'diveData',
    ],
    data() {
      return {
      }
    },
    async mounted(){
      if(this.diveData === undefined){
        this.$router.push({ path: '/' })
      }
    },
    methods: {
    }
  }
</script>