console.log(`index.js!`);
import { createRouter, createWebHashHistory } from 'vue-router'

// 1. Define route components.
import Login from '../components/Login.vue'
import Trips from '../components/Trips.vue'

// 2. Define some routes
const routes = [
  {
    path: "/",
    component: Login
  },
  {
    path: "/trips",
    component: Trips,
    beforeEnter: [isAuthenticated]
  },
];

// 3. Create the router instance and pass the `routes` option
// You can pass in additional options here, but let's
// keep it simple for now.
const router = createRouter({
  // 4. Provide the history implementation to use. We are using the hash history for simplicity here.
  history: createWebHashHistory(),
  routes, // short for `routes: routes`
})


import VueCookies from 'vue-cookies'

function isAuthenticated(to) {
  console.log(`isAuthenticated: [${!!VueCookies.get("currentUser")}]`);
  return !!VueCookies.get("currentUser") // default false, main.js sets cookie after
} 

export default router;