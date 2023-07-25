<script setup>
import { ref, onMounted, onBeforeMount } from 'vue'
import axios from 'axios';
import '@/assets/trips.css'

import StatusUnstarted from './StatusUnstarted.vue'
import StatusComplete from './StatusComplete.vue'
import StatusOverdue from './StatusOverdue.vue'
import StatusInProgress from './StatusInProgress.vue'

const trips = ref(null);
const trip_header = ["Assignee", "Owner", "ETA", "ETC", "Status", "Actions"];
const headerHash = {
  "assignee_id": "Assignee", 
  "owner_id": "Owner", 
  "ETA": "ETA", 
  "ETC": "ETC", 
  "status_id": "Status", 
  "action_id": "Actions"
}

import { useDefaultStore } from '../stores/default'
const { getStoreCurrentUser, setStoreCurrentUser, resetStore } = useDefaultStore()
import VueCookies from 'vue-cookies'

const currentUser = ref(null)

function getTrips (){
  fetch(`http://localhost:3000`)
    .then(response => response.json())
    .then(data => trips.value = data)
    .catch(function(err){
      console.error(`> Rails error response: ${err}`)
    })
}


const statusHash = {
  1: "StatusUnstarted",
  2: "StatusComplete",
  3: "StatusOverdue",
  4: "StatusInProgress",
}

getTrips()

import CreateTrip from './CreateTrip.vue'
// import { ref } from 'vue';

const showModal = ref(false)

function handleToggleModal() {
  showModal.value = !showModal.value
  getTrips()
}

onMounted(() => {
  currentUser.value = getStoreCurrentUser() || VueCookies.get("currentUser")
  console.log(`currentUser.value.email!: ${currentUser.value?.email}`);
})


</script>

<template>
  <div class="trips clearfix">

    <div class="button-modal clearfix">
      <button id="show-modal" @click="handleToggleModal">
        <div class="icon-add">
          <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 20 20" fill="none">
            <g clip-path="url(#clip0_101_95406)">
              <path d="M15.8333 10.8334H10.8333V15.8334H9.16666V10.8334H4.16666V9.16669H9.16666V4.16669H10.8333V9.16669H15.8333V10.8334Z" fill="white"/>
            </g>
            <defs>
              <clipPath id="clip0_101_95406">
                <rect width="20" height="20" fill="white"/>
              </clipPath>
            </defs>
          </svg>
        </div>
      </button>
      <CreateTrip  v-if="showModal" v-model="showModal" @close-modal="handleToggleModal">
      </CreateTrip>
    </div>

    <div v-if="trips">
      <table class="clearfix">
        <thead>
          <tr>
            <th v-for="column_label in trip_header">
              <span>{{ column_label }}</span>
              
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(trip, i ) in trips" :key="i">
            <td v-for="(attr, j) in trip" :key="j">
              <span v-if="j !== 'id' && j !== 'status_id'">{{attr}}</span>


              <StatusUnstarted v-if="j == 'status_id' && statusHash[attr] == 'StatusUnstarted'"></StatusUnstarted>
              <StatusComplete v-if="j == 'status_id' && statusHash[attr] == 'StatusComplete'"></StatusComplete>
              <StatusOverdue v-if="j == 'status_id' && statusHash[attr] == 'StatusOverdue'"></StatusOverdue>
              <StatusInProgress v-if="j == 'status_id' && statusHash[attr] == 'StatusInProgress'"></StatusInProgress>
            </td>
          </tr>
        </tbody>
      </table>
      
    </div>
    <div v-if="!trips" class="text-center">
      no trips found :(
    </div>

    <div class="status-label">
      <h3>
        Status Label Guide
      </h3>
      
      <StatusUnstarted></StatusUnstarted>
      <StatusComplete></StatusComplete>
      <StatusOverdue></StatusOverdue>
      <StatusInProgress></StatusInProgress>
    </div>


  </div>

</template>

<style lang="scss" scoped>

.button-modal {
  margin: 0;
  padding: 10px 0;
  background-color: #E4EDFE;
  border: none;
}

button {
  cursor: pointer;
  border: none;
  background-color: inherit;
  float: right;
}

.icon-add {
  background: #1A6EFB;
  width: 30px; 
  height: 30px;
  border-radius: 100px;
}

.status-label {
  

  h3 { color: black;}

  color: white;

  display: flex;
  padding: 4px 8px;
  align-items: center;
  gap: 8px;

}


.unstarted {
  width: 100px;
  border-radius: 4px;
  background: #6994DE;
}
.complete {
  width: 100px;
  border-radius: 4px;
  background: #4CAF4F;
  
}
.overdue {
  width: 100px;
  border-radius: 4px;
  background: #FF5252;
}
.in-progress {
  width: 100px;
  border-radius: 4px;
  background: #FFA525;
}

.checkin, .checkout {
  background: #1A6EFB;
}

</style>