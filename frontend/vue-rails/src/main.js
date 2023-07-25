import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'

const app = createApp(App)

import ModalForm from './components/ModalForm.vue'
app.component("ModalForm", ModalForm)

import router from './router'
app.use(router)

// Vue Store
import { createPinia } from 'pinia'
const pinia = createPinia()
app.use(pinia)

import { useDefaultStore } from './stores/default'

const defaultStore = useDefaultStore()

app.mount('#app')
