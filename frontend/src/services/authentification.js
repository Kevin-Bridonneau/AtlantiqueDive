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
    }

}