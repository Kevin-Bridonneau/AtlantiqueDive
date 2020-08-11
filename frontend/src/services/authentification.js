import api from './api'

export default {


    login(credentials){
        return api.post('/api/login',credentials)
    },

    register(credentials){
        return api.post('/api/register',credentials)
    },

    updateProfile(credentials){
        return api.post('/api/updateProfile',credentials)
    },

    getDiveSites(){
        return api.get('/api/divesites')
    },

    addNotice(credentials){
        return api.post('/api/notice', credentials)
    },

    getNotice(credentials){
        return api.get('/api/notice',{params:{ 'dive_id':credentials }})
    },

    getPresence(credentials){
        return api.get('/api/presence',{params:{ 'dive_id':credentials }})
    },

    addPresence(credentials){
        return api.post('/api/presence', credentials)
    },

    addDiveSite(credentials){
        return api.post('/api/divesite',credentials)
    }

}