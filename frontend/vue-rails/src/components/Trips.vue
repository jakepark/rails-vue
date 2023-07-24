<script setup>
import WelcomeItem from './WelcomeItem.vue'
import { onMounted, onBeforeMount } from 'vue'
import axios from 'axios';


onBeforeMount(() => {
  console.log(`the component is onBeforeMount`);

  axios.get('http://localhost:3000')
    .then(function (response) {
      // handle success
      console.log(response);
    })
    .catch(function (error) {
      // handle error
      console.log(error);
    })
    .finally(function () {
      // always executed
    });
  
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
