<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <p>{{ errors }}</p>
    <p>
      <b>First Name:</b>
      <input type="text" v-model="newActor.first_name" />
    </p>
    <p>
      <b>Last Name:</b>
      <input type="text" v-model="newActor.last_name" />
    </p>
    <p>
      <b>Known_for:</b>
      <input type="text" v-model="newActor.known_for" />
    </p>
    <p>
      <b>Movie id:</b>
      <input type="text" v-model="newActor.movie_id" />
    </p>
    <button v-on:click="addActor">Add New Actor</button>

    <h1>Actors</h1>
    <div v-for="actor in actors">
      <p>{{ actor.first_name }} {{ actor.last_name }}</p>
      <p><button v-on:click="showActor(actor)">More Info</button></p>
      <hr />
    </div>
    <dialog id="show-actor">
      <form method="dialog">
        <p>
          <b>First Name:</b>
          {{ currentActor.first_name }}
          <!-- <input type="text" v-model="currentActor.first_name" /> -->
        </p>
        <p>
          <b>Last Name:</b>
          {{ currentActor.last_name }}
          <!-- <input type="text" v-model="currentActor.last_name" /> -->
        </p>
        <p>
          <b>Known_for:</b>
          {{ currentActor.known_for }}
          <!-- <input type="text" v-model="currentActor.known_for" /> -->
        </p>
        <button>Close</button>
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
      newActor: {},
      currentActor: {},
      errors: [],
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
    addActor: function () {
      console.log("adding new actor!");
      axios
        .post("/actors", {
          first_name: this.newActor.first_name,
          last_name: this.newActor.last_name,
          known_for: this.newActor.known_for,
          movie_id: this.newActor.movie_id,
        })
        .then((response) => {
          console.log(response.data);
          console.log(this.newContact);
        })
        .catch((error) => {
          console.log(error.response.data.errors);
          this.errors = error.response.data.errors;
        });
    },
    showActor: function (theActor) {
      console.log("Show Actor!");
      this.currentActor = theActor;
      document.querySelector("#show-actor").showModal();
    },
  },
};
</script>
