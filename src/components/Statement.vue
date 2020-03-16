<template>
  <div>
      <section>section1</section>
      <section>section2</section>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue, Watch } from 'vue-property-decorator';

@Component
export default class Statement extends Vue {
    private statement: object = {
        name: null,
        type: null,
        amount: null,
        amountAt: null,
    };
    private statementCollection: Array<object> = [];

    get statements(): Array<object> {
        return this.statementCollection;
    }
    set statements(newValue: Array<object>) {
        this.statementCollection.push(newValue);
    }

    @Watch('statement', {
        deep: true,
    })
    statementChanged(newVal: object, oldVal: object) {
        // TODO
    }

    public store(): void {
        // TODO
    }

    public destroy(index: number): void {
        // TODO
    }

    public index(): void {
        // TODO
    }

    public repository(): Array<object> {
        // TODO
        return [{}];
    }

    mounted() {
        this.index();
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
