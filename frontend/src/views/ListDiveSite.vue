<template>
    <div id="listDiveSite">
        <div class="card mt-3 mb-3 align-item-center d-flex mx-auto" style="width:90%;background-color:#f4f4f4e3;">
            <div class="card-header d-flex justify-content-between">
                <h4>Liste des site de plongée</h4>
                <button class="btn btn-warning" @click="createDiveSite">Création site de plongée</button>
            </div>
            <div class="card-body overflow-auto mx-auto" style="width:100%;">
                <div class="row justify-content-between mb-2 mt-2" v-for="diveSite in listDiveSite"
                    v-bind:key="diveSite.id">
                    <h5 class="mr-2"> <span style="font-style:italic;"></span> NOM :  {{ diveSite.name }}</h5>
                    <button class="btn btn-success mr-2" @click="updateDiveSite(diveSite)">Modifier</button>
                    <button class="btn btn-danger mr-2" @click="deleteDiveSite(diveSite.id)">Supprimer</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification'

    export default {
        name: 'listDiveSite',
        data() {
            return {
                listDiveSite: []
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
            async updateDiveSite(diveSite){
                console.log(diveSite)
            },

            async deleteDiveSite(id){
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

            async createDiveSite(){
                
            }

        }
    }
</script>