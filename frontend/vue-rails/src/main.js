import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'

const app = createApp(App)

import ModalForm from './components/ModalForm.vue'
app.component("ModalForm", ModalForm)

import router from './router'

app.use(router).mount('#app')
