<template>
  <div id="app">
    <div class="navbar">
      <h1 class="navbar-brand">
        Moi je plonge à l'ouest !
      </h1>
      <div v-if="this.$store.state.userData.name == undefined" class="d-flex">
        <router-link to="/"><h3>Home</h3></router-link>
        <router-link to="/login"><h3>Connexion</h3></router-link>
        <router-link to="/register"><h3>Inscription</h3></router-link>
      </div>
      <div v-else class="d-flex">
        <router-link to="/"><h3>Home</h3></router-link>
        <router-link to="/dashboard"><h3>Mon compte</h3></router-link>
      </div>
    </div>
    <router-view />
  </div>
</template>

<style>
.navbar{
  z-index: 10;
  position: fixed;
  background-color: rgba(0, 4, 255, 0.746)!important;
}
.navbar-brand{
  color:white;
}
router-link{
  text-decoration: none;
}
h3{
  color: white;
  margin: 20px;

}

body{
  background-image: url("./assets/bg.jpg") ;
  background-repeat: no-repeat; 
  background-size: 2000px;
}

</style>