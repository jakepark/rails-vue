<script setup>
  import ModalForm from './ModalForm.vue'
  defineEmits(['closeModal'])
</script>

<template>
  <ModalForm>

    <template #header>
      <h3 style="display: inline-block">Create New</h3>
      <button @click="$emit('closeModal')" style="float: right">X</button>
    </template>

    <template #body>
      <p>Custom Body1</p>
    </template>

    <template #footer>
      <button>Create</button>
    </template>
  </ModalForm>
</template>