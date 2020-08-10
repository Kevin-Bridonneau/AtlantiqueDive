import api from './api'

export default {


    login(credentials){
        return api.post('/api/login',credentials)
    },

    register(credentials){
        return api.post('/api/register',credentials)
    },

    getDiveSites(){
        return api.get('/api/divesites')
    },

    getNotice(credentials){
        return api.get('/api/notice',{params:{ 'dive_id':credentials }})
    },

    getPresence(credentials){
        return api.get('/api/presence',{params:{ 'dive_id':credentials }})
    },

    addDiveSite(credentials){
        return api.post('/api/divesite',credentials)
    }

}