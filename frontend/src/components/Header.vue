<template>
  <div id="navbar">
  </div>
</template>

<script>

  export default {
    name: 'navbar',
    data() {
      return {
          connected: false,
      }
    },
    computed: {
        currentUser() {
         return this.$parent.$store.state.userData;
    }
    },
    async mounted(){
    },
    methods: {
    }
  }
</script>


