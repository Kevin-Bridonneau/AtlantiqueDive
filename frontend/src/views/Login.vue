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






// OAUTH 2 token
        // const body = {
        //   grant_type : "password",
        //   client_id: "2",
        //   client_secret: "xeT5tQPiyL1RdAqOiS5jbDRYF2opipYj5ei5BHU9",
        //   username: this.email,
        //   password: this.password
        // }
        // const res = await auth.login(body)
        // this.$store.state.Api_Bearer_token = res.data.access_token
        // this.$store.state.Api_Refresh_token = res.data.refresh_token
        // console.log(res)