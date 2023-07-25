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

<script>
import CreateTrip from './CreateTrip.vue'
// import { ref } from 'vue';

const showModal = ref(false)

function toggleModal() {
  console.log(`toggleModal!`);
  showModal.value = !showModal.value
}

export default {
  data() {
    return {
      showModal: false
    }
  }
}
</script>

<template>
  <div class="trips">
    <div class="icon-add">
      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
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

    <div class="status-label">
      <h3>
        Status Label Guide
      </h3>
      <div class="unstarted">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="17" viewBox="0 0 16 17" fill="none">
          <g clip-path="url(#clip0_101_95470)">
            <path d="M15.3332 8.00001L13.7065 6.14667L13.9332 3.69334L11.5265 3.14667L10.2665 1.02667L7.99984 2.00001L5.73317 1.02667L4.47317 3.14667L2.0665 3.68667L2.29317 6.14001L0.666504 8.00001L2.29317 9.85334L2.0665 12.3133L4.47317 12.86L5.73317 14.98L7.99984 14L10.2665 14.9733L11.5265 12.8533L13.9332 12.3067L13.7065 9.85334L15.3332 8.00001ZM8.6665 11.3333H7.33317V10H8.6665V11.3333ZM8.6665 8.66667H7.33317V4.66667H8.6665V8.66667Z" fill="white"/>
          </g>
          <defs>
            <clipPath id="clip0_101_95470">
              <rect width="16" height="16" fill="white" transform="translate(0 0.5)"/>
            </clipPath>
          </defs>
        </svg>
        Unstarted
      </div>
      <div class="complete">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="17" viewBox="0 0 16 17" fill="none">
          <g clip-path="url(#clip0_101_95685)">
            <path d="M15.75 8.5C15.75 12.7802 12.2802 16.25 8 16.25C3.71978 16.25 0.25 12.7802 0.25 8.5C0.25 4.21978 3.71978 0.75 8 0.75C12.2802 0.75 15.75 4.21978 15.75 8.5ZM7.10356 12.6036L12.8536 6.85356C13.0488 6.65831 13.0488 6.34172 12.8536 6.14647L12.1465 5.43937C11.9512 5.24409 11.6346 5.24409 11.4393 5.43937L6.75 10.1287L4.56065 7.93934C4.3654 7.74409 4.04881 7.74409 3.85353 7.93934L3.14644 8.64644C2.95119 8.84169 2.95119 9.15828 3.14644 9.35353L6.39644 12.6035C6.59172 12.7988 6.90828 12.7988 7.10356 12.6036Z" fill="white"/>
          </g>
          <defs>
            <clipPath id="clip0_101_95685">
              <rect width="16" height="16" fill="white" transform="translate(0 0.5)"/>
            </clipPath>
          </defs>
        </svg>
        Complete
      </div>
      <div class="overdue">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="17" viewBox="0 0 16 17" fill="none">
          <g clip-path="url(#clip0_101_95615)">
            <path d="M15.75 8.5C15.75 12.7812 12.2799 16.25 8 16.25C3.72009 16.25 0.25 12.7812 0.25 8.5C0.25 4.22134 3.72009 0.75 8 0.75C12.2799 0.75 15.75 4.22134 15.75 8.5ZM8 10.0625C7.20609 10.0625 6.5625 10.7061 6.5625 11.5C6.5625 12.2939 7.20609 12.9375 8 12.9375C8.7939 12.9375 9.4375 12.2939 9.4375 11.5C9.4375 10.7061 8.7939 10.0625 8 10.0625ZM6.63522 4.89544L6.86703 9.14544C6.87787 9.34431 7.04231 9.5 7.24147 9.5H8.75853C8.95769 9.5 9.12212 9.34431 9.13297 9.14544L9.36478 4.89544C9.3765 4.68063 9.20547 4.5 8.99034 4.5H7.00962C6.7945 4.5 6.6235 4.68063 6.63522 4.89544Z" fill="white"/>
          </g>
          <defs>
            <clipPath id="clip0_101_95615">
              <rect width="16" height="16" fill="white" transform="translate(0 0.5)"/>
            </clipPath>
          </defs>
        </svg>
        Overdue
      </div>
      <div class="in-progress">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="17" viewBox="0 0 16 17" fill="none">
          <g clip-path="url(#clip0_101_95544)">
            <path d="M8 1.83334C4.32 1.83334 1.33333 4.82001 1.33333 8.50001C1.33333 12.18 4.32 15.1667 8 15.1667C11.68 15.1667 14.6667 12.18 14.6667 8.50001C14.6667 4.82001 11.68 1.83334 8 1.83334ZM8.66666 13.1667H7.33333V11.8333H8.66666V13.1667ZM10.0467 8.00001L9.44666 8.61334C8.96666 9.10001 8.66666 9.50001 8.66666 10.5H7.33333V10.1667C7.33333 9.43334 7.63333 8.76668 8.11333 8.28001L8.94 7.44001C9.18666 7.20001 9.33333 6.86668 9.33333 6.50001C9.33333 5.76668 8.73333 5.16668 8 5.16668C7.26666 5.16668 6.66666 5.76668 6.66666 6.50001H5.33333C5.33333 5.02668 6.52666 3.83334 8 3.83334C9.47333 3.83334 10.6667 5.02668 10.6667 6.50001C10.6667 7.08668 10.4267 7.62001 10.0467 8.00001Z" fill="white"/>
          </g>
          <defs>
            <clipPath id="clip0_101_95544">
              <rect width="16" height="16" fill="white" transform="translate(0 0.5)"/>
            </clipPath>
          </defs>
        </svg>
        In Progress
      </div>
    </div>

    <div class="button-modal">

      <button id="show-modal" @click="toggleModal">Checkin</button>
      <CreateTrip  v-if="showModal" v-model="showModal" @close-modal="toggleModal">
      </CreateTrip>

    </div>
  </div>

</template>

<style lang="scss" scoped>
.status-label {
  

  h3 { color: black;}

  color: white;

  display: flex;
  padding: 4px 8px;
  align-items: center;
  gap: 8px;

  .unstarted {
    border-radius: 4px;
    background: #6994DE;
  }
  .complete {
    border-radius: 4px;
    background: #4CAF4F;
    
  }
  .overdue {
    border-radius: 4px;
    background: #FF5252;
  }
  .in-progress {
    border-radius: 4px;
    background: #FFA525;
  }
}

.icon-add {
  background: #1A6EFB;
  width: 20px; 
  height: 20px;
  border-radius: 100px;
}

.checkin, .checkout {
  background: #1A6EFB;
}

</style>