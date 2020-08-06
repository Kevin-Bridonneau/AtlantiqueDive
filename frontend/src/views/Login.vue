<template>
  <div id="login">
    <form class="login" @submit.prevent="login">
      <h1>Sign in</h1>
      <label>User name</label>
      <input required v-model="email" type="text" placeholder="Email" />
      <label>Password</label>
      <input required v-model="password" type="password" placeholder="Password" />
      <hr />
      <button type="submit">Login</button>
    </form>
  </div>
</template>

<script>
  import auth from '@/services/authentification'

  export default {
    name: 'Login',
    data() {
      return {
        email: "",
        password: ""
      }
    },
    async mounted(){
      if(this.$store.state.userData.id != undefined){
        this.$router.push({ path: '/home' })
      }
    },
    methods: {
      async login() {
        const body = {
          email: this.email,
          password: this.password
        }
        const res = await auth.login(body);
        this.$store.state.userData = res.data;
        this.$router.push({ path: '/dashboard' })
      }
    }
  }
</script>