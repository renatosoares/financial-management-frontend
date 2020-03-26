<template>
  <div>
          <!-- <div>
        <section>
            <input autofocus autocomplete="off" placeholder="name" v-model="statement.name">
            <input autofocus autocomplete="off" placeholder="type" v-model="statement.type">
            <input autocomplete="off" placeholder="amount" v-model="statement.amount">
            <input autocomplete="off" placeholder="amount_at" v-model="statement.amountAt">
            <button  @click="store()" type="submit">Adicionar</button>
        </section>
        <section>
            <div v-for="(statement, index) in statements" :key="statement.name">
                <p>
                    <span class="statement">{{ statement.name }}</span>
                    <button @click="destroy(index)">Remover</button>
                </p>
            </div>
        </section>
    </div> -->
      <section>section1</section>
      <section>section2</section>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue, Watch } from 'vue-property-decorator';

interface StatementInterface {
    name: string|null;
    type: string|null;
    amount: string|null;
    amountAt: string|null;
}

interface StorageLocalRepositoryInterface {
    save(key: string, value: Array<StatementInterface>): void;
    update(key: string, value: Array<StatementInterface>): void;
    all(): Array<StatementInterface>;
    find(key: string): StatementInterface;
}

class Statement implements StatementInterface {
    name: string|null;
    type: string|null;
    amount: string|null;
    amountAt: string|null;

    constructor() {
        this.name = null;
        this.type = null;
        this.amount = null;
        this.amountAt = null;
    }
}

class StorageLocal implements StorageLocalRepositoryInterface {
    save(key: string, value: StatementInterface[]): void {
        const parsed = JSON.stringify(value);
        localStorage.setItem(key, parsed);
    }

    update(key: string,value: StatementInterface[]): void {
        // TODO
        throw new Error("Method not implemented.");
    }

    all(): StatementInterface[] {
        // TODO
        throw new Error("Method not implemented.");
    }

    find(key: string): StatementInterface {
        throw new Error("Method not implemented.");
        // TODO
        // if (localStorage.getItem(key)) {
        //     try {
        //         return JSON.parse(localStorage.getItem(key));
        //     } catch (error) {
        //         localStorage.removeItem(key);
        //         return [];
        //     }
        // }
    }
}

@Component
export default class StatementHome extends Vue {
    private statement: Statement;

    private statementCollection: Array<object>;

    constructor() {
        super();

        this.statement = new Statement();
        this.statementCollection = [];
    }

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
        if (!this.statement.name) return;
        const storageLocal = new StorageLocal();
        const data = Object.assign(new Statement(), this.statement);

        this.statements = [data];

        this.statement.name = null;
        this.statement.type = null;
        this.statement.amount = null;
        this.statement.amountAt = null;

        storageLocal.save('statements', this.statements);
    }

    public destroy(index: number): void {
        // TODO
        // this.statements.splice(index, 1);
        // this.repository().storageLocal.save('statements', this.statements);
    }

    public index(): void {
        // TODO
        // const self = this;

        // self.repository()
        //     .storageLocal
        //     .list('statements')
        //     .forEach(function (element) {
        //         self.statements = element;
        //     });
    }

    mounted() {
        this.index();
    }
}
</script>

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

