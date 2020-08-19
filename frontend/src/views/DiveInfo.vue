<template>
  <div id="diveInfo">
    <div class="container">
      <div class="card mt-3 mb-3" style="background-color:#f4f4f4e3;">
        <div class="card-header">
          <h1 class="text-center">{{ diveData.name }}</h1>
        </div>
        <div class="card-body justify-content-center">
          <div id="diveImg" style="max-width:100%" >
          </div>
          <div class="row mt-2">
            <h3 style="color:black!important">Description :</h3>
          </div>
          <div class="row mt-2 d-flex">
            <p >{{ diveData.description }}</p>
          </div>
          <div class="row mt-2 justify-content-between">
            <p>Profondeur: {{ diveData.depth }}m</p>
            <p>Visibilité: {{ diveData.visibility }}</p>
            <p>Courrant: {{ diveData.current }}</p>
            <p>GPS: {{ diveData.position.lat }} LAT | {{ diveData.position.lng }} LON</p>
          </div>
          <div class="row mt3 justify-content-between">
            <div class="card m-2" style="width: 47%">
              <div class="card-header d-flex justify-content-between">
                <h5>Avis</h5>
                <button v-if="addNoticeButton === true" type="submit" class="btn btn-danger ml-5" @click="addNotice">
                  Donner mon avis
                </button>
              </div>
              <div class="card-body overflow-auto">
                <div class="row ml-1 mt-1 d-flex justify-content-between" style="border-bottom:1px solid silver;"
                  v-for="notice in notices" :key="notice.id">
                  <div class="row">
                    <p><span style="font-weight: bold;"><a
                          :href="`mailto:${notice.email}`"></a>{{ notice.name }}</span>: {{ notice.msg }} <span
                        style="font-size:12px;font-style: italic;">{{ notice.created_at }}</span></p>
                  </div>
                  <div class="row mr-1">
                    <p>Note: {{ notice.rate }}</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="card m-2" style="width: 47%">
              <div class="card-header d-flex justify-content-between">
                <h5>Structures</h5>
                <button v-if="addPresenceButton === true" type="submit" class="btn btn-danger ml-5"
                  @click="addPresence">
                  Ma structure propose ce site
                </button>
              </div>
              <div class="card-body overflow-auto">
                <div class="row mt-2 justify-content-between" style="border-bottom:1px solid silver;"
                  v-for="presence in presences" :key="presence.id">
                  <p><span style="font-weight: bold;"><a
                        :href="`mailto:${presence.email}`"></a>{{ presence.name }}</span>: {{ presence.phone }} <span
                      style="font-size:12px;font-style: italic;"><a
                        :href="`${presence.website}`">{{ presence.website }}</a></span></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div v-if="check === true">
        <addNotice />
      </div>
    </div>
  </div>
</template>

<script>
  import AddNotice from '@/components/AddNotice.vue'
  import auth from '@/services/authentification';
  export default {
    name: 'diveInfo',
    props: [
      'diveData',
    ],
    components: {
      AddNotice,
    },
    data() {
      return {
        img:"data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7",
        notices: [],
        presences: [],
        check: false,
        addNoticeButton: false,
        addPresenceButton: false,
      }
    },
    async beforeMount() {
      if (this.diveData === undefined) {
        this.$router.push({
          path: '/'
        })
      }
      const body = {
        dive_id: this.diveData.id,
      }
      let blob;
      let data;
      await auth.getDiveImg(body).then((res) => blob = res.data)
      .catch(err => console.log(err));
      this.img = data;
      var image = document.createElement('img');
      let reader=new FileReader();
      reader.addEventListener('loadend',()=>{
        let contents=reader.result
        image.src = contents
        let selector = document.querySelector('#diveImg');
        selector.appendChild(image);
      })
      if(blob instanceof Blob) reader.readAsDataURL(blob)

      let res = await auth.getNotice(this.diveData.id);
      this.notices = res.data;


      res = await auth.getPresence(this.diveData.id);
      this.presences = res.data;

      if (this.$store.state.userData.type === 'plongeur') {
        if (this.notices.length <= 0) {
          this.addNoticeButton = true;
        } else {
          this.notices.forEach(notice => {
            if (notice.user_id !== this.$store.state.userData.id) {
              this.addNoticeButton = true;
            } else {
              this.addNoticeButton = false
            }
          });
        }

      }
      if (this.$store.state.userData.type === 'club') {
        if (this.presences.length <= 0) {
          this.addPresenceButton = true;;
        } else {
          this.presences.forEach(presence => {
          if (presence.club_id !== this.$store.state.userData.id) {
            this.addPresenceButton = true;
          } else {
            this.addPresenceButton = false
            }
          });
        }
      }
    },
    methods: {
      getImg(){
        return this.img;
      },
      async addNotice() {
        this.check = true;
      },
      async addPresence() {
        const body = {
          dive_id: this.diveData.id,
          club_id: this.$store.state.userData.id
        }
        const res = await auth.addPresence(body);
        this.$router.push({
          path: '/'
        })
      }

    }
  }
</script>