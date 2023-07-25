<script setup>
import axios from 'axios'
import { ref } from 'vue'

import { storeToRefs } from 'pinia'
import { useDefaultStore } from '../stores/default'

const { currentUser } = storeToRefs(useDefaultStore())
const { getStoreCurrentUser, setStoreCurrentUser } = useDefaultStore()

console.log(`getStoreCurrentUser()!: ${getStoreCurrentUser()}`);

defineProps(['emailInput'])
defineEmits(['update:emailInput'])


function setCurrentUser(user){
  console.log(`setCurrentUser(user.email): ${user.email}!`);
  setStoreCurrentUser(user);
}

function logIn(event){
  console.log(`logIn!`);
  let emailInput = event.target.parentElement.firstChild.lastChild.value; // messy..
  console.log(`emailInput!: ${emailInput}`);

  axios.post("http://localhost:3000/login", {email: emailInput}) // user_1@utilizecore.com
    .then((resp) => {
      console.log(`logIn success!`);
      setCurrentUser(resp.data)
    })
    .catch((err) => {
      console.error(`logIn error`)
    })
    .finally(() => {
      console.log(`getStoreCurrentUser().email: ${getStoreCurrentUser()?.email}`);
    })
}

</script>

<script>



  export default {
    data() {
      return {
        email: null
      }
    }
  }

</script>

<template>
  <div id="login">
    <label for="email-input">Email Address
    <input id="email-input" :value="emailInput" placeholder="-"
      @input="$emit('update:emailInput', $event.target.value)"
    >
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