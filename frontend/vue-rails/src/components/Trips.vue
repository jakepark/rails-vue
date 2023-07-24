<script setup>
import WelcomeItem from './WelcomeItem.vue'
import { onMounted, onBeforeMount } from 'vue'

onBeforeMount(() => {
  console.log(`the component is onBeforeMount`);
  
})

onMounted(() => {
  console.log(`the component is now mounted.`)
})


</script>

<template>
  <WelcomeItem>
    <template #heading>Trips</template>

    
    <!-- header row -->
    <!-- for attribute in tripProp -->


    <!-- for trip in UserTrips -->
    <!-- row data -->

  </WelcomeItem>

</template>
