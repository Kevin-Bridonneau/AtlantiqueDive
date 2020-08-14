<template>
    <div id="listProposal">
        <div class="card  mb-3 align-item-center d-flex">
            <h4 type="text" class="card-header text-center">Liste des soumission de site de plongées</h4>
            <div class="card-body overflow-auto mx-auto" style="width:100%;">
                <div class="row justify-content-between mb-2 mt-2" v-for="proposal in listProposal"
                    v-bind:key="proposal.id">
                    <h5 class="mr-2"> <span style="font-style:italic;"></span> NOM :{{ proposal.name }}</h5>
                    <p class="mr-2">Description : {{ proposal.description }}</p>
                    <p class="mr-2">GPS : lat:{{ proposal.lat }}| Lng:{{ proposal.lng }}</p>
                    <p class="mr-2">Profondeur : {{ proposal.depth }}m</p>
                    <p class="mr-2">Current : {{ proposal.current }}</p>
                    <p class="mr-2">Visibility : {{ proposal.visibility }}</p>
                    <p class="mr-2">Photo : {{ proposal.pathtopicture }}</p>
                    <button class="btn btn-success mr-2" @click="accept(proposal.id)">Valider</button>
                    <button class="btn btn-danger mr-2" @click="refuse(proposal.id)">Refuser</button>
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
                listProposal: []
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
        },
        methods: {
            async accept(id) {
                const body = {
                    id: id
                }
                let res = await auth.acceptProposal(body);
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