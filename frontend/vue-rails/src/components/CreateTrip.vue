<script setup>
  import ModalForm from './ModalForm.vue'
  defineEmits(['closeModal'])

  import axios from 'axios';
  import { ref } from 'vue'

  const selectAssignee = ref("")
  const dateEta = ref("")
  const dateEtc = ref("")

  function handleClick(){
    console.log(`handleClick!`);
    axios.post("http://localhost:3000/trip", {
      userId: selectAssignee,
      dateEta: dateEta,
      dateEtc: dateEtc,
    })
    .then((resp) => {
      console.log(`logIn success!`);
      
      // router.push('/trips')
    })
    .catch((err) => {
      console.error(`logIn error`)
    })
    .finally(() => {
    })
  }


</script>

<template>
  <ModalForm>

    <template #header>
      <h3 style="display: inline-block">Create New</h3>
      <button @click="$emit('closeModal')" style="float: right">X</button>
    </template>

    <template #body>
      
      <label for="">Assignee</label>
      <input list="select-assignee" v-model="selectAssignee">
      <datalist id="select-assignee">
        <option value="1"></option>
        <option value="2"></option>
        <option value="3"></option>
        <option value="4"></option>
        <option value="6"></option>
      </datalist>
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