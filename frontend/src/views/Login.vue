<template>
  <div id="login">
    <form class="login" @submit.prevent="login">
      <div class="container">
        <div class="card mt-3" style="background-color:#f4f4f4e3;">
          <div class="card-header">
            <h1>Connexion</h1>
          </div>
          <div class="card-body mx-auto">
            <div class="row">
              <label>Adresse Email</label>
            </div>
            <div class="row mt-3">
              <input required v-model="email" type="text" placeholder="Email" />
            </div>
            <div class="row mt-3">
              <span class="text-danger" v-if="msg.email">{{msg.email}}</span>
            </div>
            <div class="row mt-3">
              <label>Mot de passe</label>
            </div>
            <div class="row mt-3">
              <input required v-model="password" type="password" placeholder="Password" />
            </div>
            <div class="row mt-3">
              <span class="text-danger" v-if="msg.general">{{msg.general}}</span>
            </div>
            <div class="row mt-3">
              <button type="submit" class="btn btn-info">Connexion</button>
            </div>
          </div>
        </div>
      </div>
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
        password: "",
        msg: []
      }
    },
    async mounted() {
      if (this.$store.state.userData.id != undefined) {
        this.$router.push({
          path: '/'
        });
      }
    },
    watch: {
      email(value) {
        this.email = value;
        this.validateEmail(value);
      }
    },
    methods: {
      validateEmail(value) {
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value)) {
          this.msg['email'] = '';
        } else {
          this.msg['email'] = 'Adresse Email incorecte';
        }
      },
      async login() {
        let body = {
          email: this.email,
          password: this.password
        }
        let requestStatus;
        let res = await auth.login(body).catch(error => {
          requestStatus = error.response.status
        });
        if (requestStatus === 535) {
          this.msg['general'] = "Identifiant et/ou mot de passe incorect"
        } else {
          this.$store.state.userData = res.data;
          localStorage.setItem('UserData',JSON.stringify(res.data));
          this.$router.push({
            path: '/dashboard'
          })
        }
      }
    }
  }
</script>