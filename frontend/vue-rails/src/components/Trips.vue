<script setup>
import { ref, onMounted, onBeforeMount } from 'vue'
import axios from 'axios';
import '@/assets/trips.css'

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
    
    <div v-if="trips">
      <table >
        <thead>
          <tr>
            <th>
              {{ Object.keys(trips[0]) }}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(trip, i ) in trips" :key="i">
            {{i}}
            <!-- {{ trips[i] }} -->
            <!-- {{trip}} -->
            <td v-for="(attr, j) in trip" :key="j">
              <!-- {{ trip[attr] }} -->
              {{j}}
            </td>
          </tr>
        </tbody>
      </table>
      
    </div>
    <div v-if="!trips" class="text-center">
      no trips fetched
    </div>
  </div>
</template>