<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <p>
      <b>First Name:</b>
      <input type="text" v-model="newActor.first_name" />
    </p>
    <p>
      <b>Last Name:</b>
      <input type="text" v-model="newActor.last_name" />
    </p>
    <p>
      <b>known_for:</b>
      <input type="text" v-model="newActor.known_for" />
    </p>
    <button v-on:click="addActor">Add New Actor</button>

    <h1>Actors</h1>
    <div v-for="actor in actors">
      <p>{{ actor.first_name }} {{actor.last_name}}</p>
    </div>
      </p>
    </div>
    
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
    }
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
    addActor: function() {
      console.log("adding new actor!");
      axios.post("/actors", {
        first_name: this.newActor.first_name,
        last_name: this.newActor.last_name,
        known_for: this.newActor.known_for,
      }).then((response)=>{
        console.log(response.data);
        console.log(this.newContact);
      })
    }
  },
};
</script>
