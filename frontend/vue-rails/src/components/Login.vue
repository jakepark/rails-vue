<script setup>
import WelcomeItem from './WelcomeItem.vue'
import DocumentationIcon from './icons/IconDocumentation.vue'
import ToolingIcon from './icons/IconTooling.vue'
import EcosystemIcon from './icons/IconEcosystem.vue'
import CommunityIcon from './icons/IconCommunity.vue'
import SupportIcon from './icons/IconSupport.vue'
import axios from 'axios'
</script>

<script>

  function logIn(){
    axios.post("http://localhost:3000/login", {email: "user_0@utilizecore.com"})
      .then((resp) => {
        console.log(`logIn success!`);
      })
      .catch((err) => {
        console.error(`logIn error: ${err}`)
      })
  }

</script>

<template>
  <WelcomeItem>
    <template #heading>Login</template>

    <input type="text">Email Address
    <!-- Set Rails Current User upon POST -->
    <button @click="logIn">Log In</button>
  </WelcomeItem>

</template>
