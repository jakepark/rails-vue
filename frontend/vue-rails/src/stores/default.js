import { defineStore } from 'pinia'

// main is the name of the store. It is unique across your application
// and will appear in devtools
export const useDefaultStore = defineStore({
  id: "default",
  state: () => ({
    currentUser: null,
  }),
  getters: {
    currentUserEmail: (state) => state.currentUser.email,
  },
  actions: {

    getStoreCurrentUser() {
      return this.currentUser;
    },

    setStoreCurrentUser(user) {
      return this.currentUser = user;
    },

    resetStore() {
      return this.currentUser = null;
    },
  },
})