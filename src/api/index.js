import axios from 'axios'

// create an axios instance
const api = axios.create({
    baseURL: import.meta.env.VITE_API_URL
})

export async function getInfluxDB() {
    return api({
        url: '/influxdb',
        method: 'get',
    })
}

export async function getForecast(data) {
    return api({
        url: '/forecast',
        method: 'get',
        params: data
    })

}
