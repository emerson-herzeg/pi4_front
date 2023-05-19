import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import bootstrap from 'bootstrap/dist/css/bootstrap.min.css'
import { boostraspJS } from 'bootstrap/dist/js/bootstrap.min'
const app = createApp(App)

app.use(bootstrap)
app.use(boostraspJS)
app.use(router)

app.mount('#app')
