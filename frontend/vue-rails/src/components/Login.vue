<script setup>
import axios from 'axios'
import { ref } from 'vue'

import router from '../router'

import { useDefaultStore } from '../stores/default'

const { getStoreCurrentUser, setStoreCurrentUser, resetStore } = useDefaultStore()

console.log(`getStoreCurrentUser()!: ${getStoreCurrentUser()}`);

const emailInput = ref("")

import VueCookies from 'vue-cookies'

function setCurrentUser(user){
  console.log(`setCurrentUser(user.email): ${user.email}!`);
  VueCookies.set("currentUser", user.email)
  setStoreCurrentUser(user);
}

function logIn(event){
  console.log(`logIn!`);
  console.log(`emailInput!: ${emailInput.value}`);

  axios.post("http://localhost:3000/login", {email: emailInput.value}) // user_1@utilizecore.com
    .then((resp) => {
      console.log(`logIn success!`);
      setCurrentUser(resp.data)
      router.push('/trips')
    })
    .catch((err) => {
      console.error(`logIn error`)
      resetStore()
    })
    .finally(() => {
      console.log(`getStoreCurrentUser().email: ${getStoreCurrentUser()?.email}`);
    })
}

</script>

<template>
  <div id="login">
    <label for="email-input">Email Address
    <input id="email-input" v-model="emailInput" placeholder="-">
    </label>
    <!-- Set Rails Current User upon POST -->
    <button @click="logIn($event)">Log In</button>
  </div>
</template>

<style lang="scss">

#login {
  background-color: white;
  height: 100vh;
  width: 100vw;
}
</style>