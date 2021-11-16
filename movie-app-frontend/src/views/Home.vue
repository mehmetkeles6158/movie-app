<template>
  <div class="home">
    <h1>{{ message }}</h1>
    <p> {{ actors }}</p>
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
    }
  },
  created: function () {
    this.indexActors();
  },
  methods: {
    indexActors: function () {
      console.log("loading actors");
      axios.get("http://localhost:3000/actors").then((response) => {
        console.log(response.data);
        this.actors = response.data;
      });
    },
  },
};
</script>
