import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'

const app = createApp(App)

import ModalForm from './components/ModalForm.vue'
app.component("ModalForm", ModalForm)

app.mount('#app')
