<script setup>
import { ref, onMounted, onBeforeMount } from 'vue'
import axios from 'axios';

// const props = defineProps({
//   loading: false,
//   trips: null,
//   error: null,
// })

// const trips = [
//   {
//     assignee: "user_1",
//     owner: "user_1",
//   },
//   {
//     assignee: "user_1",
//     owner: "user_1",
//   }
// ]

// const trips = await fetch(`http://localhost:3000`)
//   .then((r) => r.json())

onBeforeMount(() => {
  console.log(`the component is onBeforeMount`);
  axios.get('http://localhost:3000')
    .then(function (response) {
      // handle
      console.log(`success!`);
      console.log(response);
      // props.trips = response.data
    })
    .catch(function (error) {
      // handle error
      console.error(`error!`);
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
  
  <!-- header row -->
  <!-- for attribute in tripProp -->


  <!-- for trip in UserTrips -->
  <!-- row data -->


  <div class="trip">
    Trip Review
    
    <div v-if="loading" class="loading">Loading...</div>

    <div v-if="error" class="error">{{ error }}</div>

    <div v-if="trips" class="content">
      Trip Content

      {{ trips }}
      <!-- <div v-for="trip in trips">
        Trip
        <p>{{ trip.assignee }}</p>
        <p>{{ trip.owner }}</p>
      </div> -->
    </div>
  </div>
</template>
