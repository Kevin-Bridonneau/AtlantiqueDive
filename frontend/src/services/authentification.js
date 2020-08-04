import api from './api'

export default {
    login(credentials){
        return api.post('/api/login',credentials)
    },

}