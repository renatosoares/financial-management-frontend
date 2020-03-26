<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <statement-home></statement-home>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import StatementHome from './components/StatementHome.vue';

@Component({
  components: {
    StatementHome,
  },
});

export default class App extends Vue {}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
