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
  <div class="trips">
    Trip Review
    
    <div v-if="trips">
      <table >
        <thead>
          <tr>
            <th v-for="value in Object.keys(trips[0])">
              {{ value }}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(trip, i ) in trips" :key="i">
            <td v-for="(attr, j) in trip" :key="j">
              {{attr}}
            </td>
          </tr>
        </tbody>
      </table>
      
    </div>
    <div v-if="!trips" class="text-center">
      no trips found :(
    </div>
  </div>
</template>