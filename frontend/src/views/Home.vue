<template>
  <div class="home">
  </div>
</template>

<script>


export default {
  name: 'Home',
  components: {
  },
  async mounted() {
    await console.log(this.$store.state.userData)
  },
}
</script>
