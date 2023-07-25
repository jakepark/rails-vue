<script setup>
import axios from 'axios'

defineProps(['emailInput'])
defineEmits(['update:emailInput'])

</script>

<script>

  function logIn(){
    axios.post("http://localhost:3000/login", {email: emailInput})
      .then((resp) => {
        console.log(`logIn success!`);
      })
      .catch((err) => {
        console.error(`logIn error: ${err}`)
      })
  }

  export default {
    data: function() {
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
    <button @click="logIn">Log In</button>
  </div>
</template>

<style lang="scss">

#login {
  background-color: white;
  height: 100vh;
  width: 100vw;
}
</style>