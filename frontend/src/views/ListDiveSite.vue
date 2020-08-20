<template>
    <div id="listDiveSite">
        <div class="card mt-3 mb-3 align-item-center d-flex mx-auto" style="width:90%;background-color:#f4f4f4e3;">
            <div class="card-header d-flex justify-content-between">
                <h4>Liste des site de plongée</h4>
                <button class="btn btn-warning" @click="createDiveSite">Création site de plongée</button>
            </div>
            <div class="card-body overflow-auto mx-auto" style="width:100%;">
                <div class="row mb-2 mt-2" style="width:100%;border-bottom:1px solid silver" v-for="diveSite in listDiveSite"
                    v-bind:key="diveSite.id">
                    <div class="row m-3 d-flex justify-content-between" style="width:100%;">
                        <h5 class="m-3"> <span style="font-style:italic;"></span> NOM : {{ diveSite.name }}</h5>
                    </div>
                    <button class="btn btn-success m-2" @click="updateDiveSite(diveSite)">Modifier</button>
                    <button class="btn btn-danger m-2" @click="deleteDiveSite(diveSite.id)">Supprimer</button>
                </div>
            </div>
        </div>
        <div v-if="createButton == true">
            <CreateDiveSite />
        </div>
        <div v-if="updateButton == true">
            <UpdateDiveSite />
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification'
    import CreateDiveSite from '@/components/CreateDiveSite.vue'
    import UpdateDiveSite from '@/components/UpdateDiveSite.vue'

    export default {
        name: 'listDiveSite',
        components: {
            CreateDiveSite,
            UpdateDiveSite,
        },
        data() {
            return {
                listDiveSite: [],
                createButton: false,
                updateButton: false,
                diveData: {}
            }
        },
        async mounted() {
            if (this.$store.state.userData.id === undefined || this.$store.state.userData.type !== "admin") {
                this.$router.push({
                    path: '/'
                })
            }
            const res = await auth.getDiveSites();
            this.listDiveSite = res.data;
        },
        methods: {
            async updateDiveSite(diveSite) {
                this.diveData = diveSite;
                this.updateButton = true;
            },

            async deleteDiveSite(id) {
                let res = await auth.deleteDiveSite(id);
                res = await auth.getDiveSites();
                this.listDiveSite = res.data;
                let markers = [];
                res.data.forEach(site => {
                    markers.push({
                        'id': site.id,
                        'name': site.name,
                        'description': site.description,
                        'position': {
                            'lat': parseFloat(site.lat),
                            'lng': parseFloat(site.lng)
                        },
                        'depth': site.depth,
                        'current': site.current,
                        'visibility': site.visibility,
                        'pathtopicture': site.pathtopicture
                    })
                });
                this.$store.state.markers = markers;
            },

            async createDiveSite() {
                this.createButton = true;
            }

        }
    }
</script>