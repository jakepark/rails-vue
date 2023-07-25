<script setup>
import WelcomeItem from './WelcomeItem.vue'
import DocumentationIcon from './icons/IconDocumentation.vue'
import ToolingIcon from './icons/IconTooling.vue'
import EcosystemIcon from './icons/IconEcosystem.vue'
import CommunityIcon from './icons/IconCommunity.vue'
import SupportIcon from './icons/IconSupport.vue'
</script>

<script>

  function logIn(){
    console.log(`logIn!`);
    fetch("http://localhost:3000/login")
      .then((resp) => {
        debugger
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
