import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'

const app = createApp(App)

import Modal from './components/Modal.vue'
// app.component("modal", {
//   template: "#modal-template"
// });

app.component("Modal", Modal)
app.mount('#app')
