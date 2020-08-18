<template>
  <div id="app">
    <div class="navbar  navbar-expand-lg justify-content-between">
      <h1 class="navbar-brand">
        Moi je plonge à l'ouest !
      </h1>
      <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button> -->
      <!-- <div class="collapse navbar-collapse" id="navbarNav"> -->
      <ul class="navbar-nav">
        <div v-if="this.$store.state.userData.name == undefined" class="d-flex">
          <li class="nav-item mr-2">
            <a class="nav-link" @click="home">Home</a>
          </li>
          <li class="nav-item mr-2">
            <a class="nav-link" @click="connexion">Connexion</a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" @click="register">Inscription</a>
          </li>
        </div>
        <div v-else class="d-flex">
          <li class="nav-item mr-2">
            <a class="nav-link" @click="home">Home</a>
          </li>
          <li class="nav-item mr-2">
            <a class="nav-link" @click="dashboard">Mon compte</a>
          </li>
        </div>
      </ul>
    </div>
    <!-- </div> -->
    <router-view />
  </div>
</template>

<script>
  export default {
    methods: {
      home() {
        this.$router.push({
          path: '/'
        });
      },
      connexion() {
        this.$router.push({
          path: '/login'
        });
      },
      register() {
        this.$router.push({
          path: '/register'
        });
      },
      dashboard() {
        this.$router.push({
          path: '/dashboard'
        });
      },
    }
  }
</script>


<style>
  a {
    color: white !important;
  }
  a:hover{
    cursor:  pointer!important;
  }

  .navbar {
    z-index: 10;
    position: fixed;
    background-color: rgba(0, 4, 255, 0.746) !important;
  }

  .navbar-brand {
    color: white;
  }

  router-link {
    text-decoration: none;
  }

  h3 {
    color: white;
    margin: 20px;

  }

  body {
    background-image: url("./assets/bg.jpg");
    background-repeat: no-repeat;
    background-size: 2000px;
  }

  .card-body {
    background-color: rgba(255, 255, 255, 0);
  }
</style>