<template>
    <div id="listProposal">
        <div class="card mt-3  mb-3 align-item-center d-flex mx-auto" style="width:90%;background-color:#f4f4f4e3;">
            <h4 type="text" class="card-header text-center">Liste des soumission de site de plongées</h4>
            <div class="card-body overflow-auto mx-auto" style="width:100%;">
                <div v-if="nothing === true">
                    <h5 class="text text-center text-info">Aucune proposition actuellement</h5>
                </div>
                <div class="row mb-2 mt-2" style="width:100%;border-bottom:1px solid silver" v-for="proposal in listProposal"
                    v-bind:key="proposal.id">
                    <div class="row m-3 d-flex justify-content-between" style="width:100%;">
                        <h5 class="m-2"> <span style="font-style:italic;"></span> NOM :{{ proposal.name }}</h5>
                    </div>
                    <div class="row m-3 d-flex justify-content-between" style="width:100%;">
                        <p class="m-2">Description : {{ proposal.description }}</p>
                    </div>
                    <div class="row m-3 d-flex justify-content-between" style="width:100%;">
                        <p class="m-2">GPS : lat:{{ proposal.lat }}| Lng:{{ proposal.lng }}</p>
                    </div>
                    <div class="row m-3 d-flex justify-content-between" style="width:100%;">
                        <p class="m-2">Profondeur : {{ proposal.depth }}m</p>
                    </div>
                    <div class="row m-3 d-flex justify-content-between" style="width:100%;">
                        <p class="m-2">Current : {{ proposal.current }}</p>
                    </div>
                    <div class="row m-3 d-flex justify-content-between" style="width:100%;">
                        <p class="m-2">Visibility : {{ proposal.visibility }}</p>
                    </div>
                    <div class="row m-3 d-flex justify-content-between" style="width:100%;">
                        <p class="m-2">Photo : {{ proposal.pathtopicture }}</p>
                    </div>               
                    <button class="btn btn-success m-2" @click="accept(proposal.id)">Valider</button>
                    <button class="btn btn-danger m-2" @click="refuse(proposal.id)">Refuser</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification'

    export default {
        name: 'listProposal',
        data() {
            return {
                listProposal: [],
                nothing:false
            }
        },
        async mounted() {
            if (this.$store.state.userData.id === undefined || this.$store.state.userData.type !== "admin") {
                this.$router.push({
                    path: '/'
                })
            }
            const res = await auth.listProposal();
            this.listProposal = res.data.listProposal;
            if(this.listProposal === undefined){
                this.nothing = true;
            }
        },
        methods: {
            async accept(id) {
                const body = {
                    id: id
                }
                let res = await auth.acceptProposal(body);
                res = await auth.listProposal();
                this.listProposal = res.data.listProposal;
                if(this.listProposal === undefined){
                this.nothing = true;
                }
                res = await auth.getDiveSites();
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

            async refuse(id) {
                let res = await auth.refuseProposal(id);
                res = await auth.listProposal();
                this.listProposal = res.data.listProposal;
                res = await auth.getDiveSites();
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
            }

        }
    }
</script>