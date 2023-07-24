<script setup>
import { ref, onMounted, onBeforeMount } from 'vue'
import axios from 'axios';

const trips = ref(null);

fetch(`http://localhost:3000`)
  .then(response => response.json())
  .then(data => trips.value = data)
  .catch(function(err){
    console.error(`> Rails error response: ${err}`)
  })


onBeforeMount(() => {
  console.log(`the component is onBeforeMount`);
})

onMounted(() => {
  console.log(`the component is now mounted.`)

})


</script>

<template>
  
  <!-- header row -->
  <!-- for attribute in tripProp -->


  <!-- for trip in UserTrips -->
  <!-- row data -->


  <div class="trips">
    Trip Review
    
    <div v-if="loading" class="loading">Loading...</div>

    <div v-if="error" class="error">{{ error }}</div>

    <div v-if="trips">
      <h5>trips</h5>
      <ul class="mb-0">
        <li v-for="trip in trips" :key="trip.id">{{trip.owner_id}}</li>
      </ul>
    </div>
    <div v-if="!trips" class="text-center">
      <!-- <div class="spinner-border spinner-border-sm"></div> -->
    </div>
  </div>
</template>
