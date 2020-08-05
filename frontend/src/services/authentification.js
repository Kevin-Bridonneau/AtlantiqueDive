import api from './api'

export default {
    // login(credentials){
    //     return api.post('/oauth/token',credentials)
    // },

    login(credentials){
        return api.post('/api/login',credentials)
    },

    register(credentials){
        return api.post('/api/register',credentials)
    },

}