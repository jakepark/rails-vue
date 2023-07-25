<script setup>
  import ModalForm from './ModalForm.vue'
  const emit = defineEmits(['closeModal', 'tripCreated'])

  import axios from 'axios';
  import { ref, onMounted, onBeforeMount } from 'vue'

  const selected = ref("A")
  const options = ref([
    { text: 'User One', value: 1 },
    { text: 'User Two', value: 2 },
  ])
  const dateEta = ref("")
  const dateEtc = ref("")
  
  import { useDefaultStore } from '../stores/default'
  const { getStoreCurrentUser, setStoreCurrentUser, resetStore } = useDefaultStore()
  import VueCookies from 'vue-cookies'

  const currentUser = ref(null)

  const emitUpdates = (event) => {
    console.log(`emitUpdates!`);
    emit('tripCreated')
    emit('closeModal')
  }

  function handleClick(){
    console.log(`handleClick!`);
    
    axios.post("http://localhost:3000/trip", {
      trip: {
        assignee_id: selected.value,
        owner_id: currentUser.value?.id,
        ETA: dateEta.value,
        ETC: dateEtc.value,
      }
    })
    .then((resp) => {
      console.log(`createTrip success!`);
      
    })
    .catch((err) => {
      console.error(`createTrip error`)
    })
    .finally(() => {
      // $emit('closeModal')
      emitUpdates()
    })
  }

  onMounted(() => {
    currentUser.value = getStoreCurrentUser() || VueCookies.get("currentUser")
    console.log(`currentUser.value.email!: ${currentUser.value?.email}`);
  })


</script>

<template>
  <ModalForm>

    <template #header>
      <h3 style="display: inline-block">Create New</h3>
      <button @click="$emit('closeModal')" style="float: right">X</button>
    </template>

    <template #body>
      
      <select id="select-assignee" v-model="selected" required>
        <option :value="null" disabled selected hidden>Select Assignee</option>

        <option v-for="option in options" :key="option.value" :value="option.value">
          {{ option.text }}
        </option>
      </select>

      <br>
      <label for="">ETA</label>
      <input type="date" v-model="dateEta">
      <label for="">ETC</label>
      <input type="date" v-model="dateEtc">



    </template>

    <template #footer>
      <button id="create-trip" @click="handleClick()">CREATE</button>
    </template>
  </ModalForm>
</template>

<style scoped>


option {
  display: block !important; /* the one time i have had to use !important */
}


#create-trip {
  background-color: #1A6EFB;
  border-radius: 5px;
  color: white;
  margin: 0 auto;

}
h3 {
  color: black;
}

button {
  border: none;
  background-color: inherit;
  cursor: pointer;
  padding: 10px 20px;
  font-weight: bold;;
}



input, datalist {
  display: block;
}

option {
  display: none
}

</style>