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
    methods: {
      async login() {

        const body = {
          // grant_type : "password",
          // client_id: "2",
          // client_secret: "xeT5tQPiyL1RdAqOiS5jbDRYF2opipYj5ei5BHU9",
          username: this.email,
          password: this.password
        }

        const res = await auth.login(body)

        console.log(res)
      }
    }
  }
</script>