<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <div v-for="actor in actors">
      <p>
        {{ actor.first_name }}
      </p>
      <p><button v-on:click="showActor(actor)">More Info</button></p>
    </div>
    <dialog id="show-actor">
      <form method="dialog">
        <p>
          <b>First Name:</b>
          <input type="text" v-model="currentActor.first_name" />
        </p>
        <p>
          <b>Last Name:</b>
          <input type="text" v-model="currentActor.last_name" />
        </p>
        <p>
          <b>Know For:</b>
          <input type="text" v-model="currentActor.known_for" />
        </p>
      </form>
    </dialog>
  </div>
</template>

<style></style>

<script>
import axios from "axios";
export default {
  data: function () {
    return {
      message: "Welcome to Movie-app!",
      actors: [],
      currenActor: {},
    };
  },
  created: function () {
    this.indexActors();
  },
  methods: {
    indexActors: function () {
      console.log("loading actors");
      axios.get("/actors").then((response) => {
        console.log(response.data);
        this.actors = response.data;
      });
    },
    showActor: function (theActor) {
      console.log(theActor);
      this.currentActor = theActor;
      console.log("opening modal...");
      document.querySelector("#show-actor").showModal();
    },
  },
};
</script>
