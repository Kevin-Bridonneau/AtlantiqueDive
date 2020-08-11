<template>
    <div id="AddNotice">
        <div id="pop" class="container-flex mx-4   mt-5 fixed-top">
            <div class="row justify-content-center">
                <div class="card  mb-3 align-item-center d-flex"
                    style="max-width: 80%; margin:20px; top:10px;position: absolute; z-index:10">
                    <h4 type="text" class="card-header text-center">Donnez votre avis</h4>
                    <div class="card-body overflow-auto mx-auto" style="width:100%;">
                        <form @submit.prevent="submit">
                            <div class="row">
                                <label>Avis</label>
                            </div>
                            <div class="row">
                                <textarea required class="text-info" placeholder="Avis" v-model="msg"></textarea>
                            </div>
                            <div class="row">
                                <label>Note (sur 5)</label>
                            </div>
                            <div class="row">
                                <select name="rate" size="1" v-model="rate">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </div>
                            <div class="row">
                                <button type="submit" class="btn btn-info">
                                    Envoi
                                </button>
                            </div>
                        </form>
                        <button type="submit" class="btn btn-danger" @click="cancel()">
                            Annuler
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import auth from '@/services/authentification';

    export default {
        name: 'AddNotice',
        data() {
            return {
                msg: "",
                dive_id: this.$parent.diveData.id,
                user_id: this.$store.state.userData.id,
                rate: 0
            }
        },
        async mounted() {},
        methods: {
            async submit() {
                const body = {
                    dive_id: this.dive_id,
                    user_id: this.user_id,
                    msg: this.msg,
                    rate: parseInt(this.rate)
                }
                const res = await auth.addNotice(body);
                this.$parent.check = false;
            },
            cancel() {
                this.$parent.check = false;
            }
        }
    }
</script>