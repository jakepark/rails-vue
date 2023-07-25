import { defineStore } from 'pinia'

// main is the name of the store. It is unique across your application
// and will appear in devtools
export const useMainStore = defineStore({
  id: "mainStore",
  state: () => ({
    counter: 0,
    currentUser: null,
  }),
  getters: {
    doubleCounter: (state) => state.counter * 2,
    currentUserEmail: (state) => state.currentUser.email,
  },
  actions: {
    setStoreCurrentUser(user) {
      this.currentUser = user;
    },

    reset() {
      this.counter = 0;
      this.currentUser = null;
    },
  },
})