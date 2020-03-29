<template>
  <div>
        <section>
            <input autofocus autocomplete="off" placeholder="name" v-model="statement.name">
            <input autocomplete="off" placeholder="type" v-model="statement.type">
            <input autocomplete="off" placeholder="amount" v-model="statement.amount">
            <input autocomplete="off" placeholder="amount_at" v-model="statement.amountAt">
            <button  @click="store()" type="submit">Adicionar</button>
        </section>
        <section>
            <div v-for="(statement, index) in statements" :key="statement.name">
                <p>
                    <span class="statement">{{ statement.name }}</span>
                    <button @click="destroy(index)">Remover</button>
                    <button @click="edit(index)">Editar</button>
                </p>
            </div>
        </section>
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

interface RepositoryInterface {
    all(): Statement[]|undefined;
    destroy(index: number): void;
    find(index: number): StatementInterface;
    save(value: Array<StatementInterface>): void;
    update(index: number, value: Array<StatementInterface>): void;
}

class Statement implements StatementInterface {
    public name: string|null;
    public type: string|null;
    public amount: string|null;
    public amountAt: string|null;

    constructor() {
        this.name = null;
        this.type = null;
        this.amount = null;
        this.amountAt = null;
    }

    public clear(): void {
        this.name = null;
        this.type = null;
        this.amount = null;
        this.amountAt = null;
    }
}

class StorageLocal implements RepositoryInterface {
    private _table: string;

    constructor(table: string) {
        this._table = table;
    }

    public get table(): string {
        return this._table;
    }

    public set table(table: string) {
        this._table = table;
    }

    public save(value: Statement[]): void {
        const parsed = JSON.stringify(value);
        localStorage.setItem(this.table, parsed);
    }

    public update(index: number,value: StatementInterface[]): void {
        // TODO
        throw new Error("Method not implemented.");
    }

    public all(): Statement[] {
        const statement = new Statement();
        let data = [statement];

        try {
            const item = localStorage.getItem(this.table);
            if (item) {
                data = JSON.parse(item) || [statement];
                return data;
            }
        } catch (error) {
            localStorage.removeItem(this.table);
            return data;
        }

        return data;
    }

    public destroy(index: number): void {
        // TODO
    }

    public find(index: number): StatementInterface {
        // TODO
        throw new Error("Method not implemented.");
    }
}

@Component
export default class StatementHome extends Vue {
    public statement: Statement;

    private statementCollection: Statement[];

    private storageLocal: StorageLocal;

    constructor() {
        super();

        this.statement = new Statement();
        this.statementCollection = [];
        this.storageLocal = new StorageLocal('statements');
    }

    get statements(): Statement[] {
        return this.statementCollection;
    }
    set statements(newValue: Statement[]) {
        const statement: Statement = Object.assign(new Statement(), newValue.pop());

        this.statementCollection.push(statement);
    }

    @Watch('statement', {
        deep: true,
    })
    statementChanged(newVal: Statement, oldVal: Statement) {
        // TODO
    }

    public store(): void {
        if (!this.statement.name) return;
        const data = [Object.assign(new Statement(), this.statement)];

        this.statements = data;

        this.statement.clear();

        this.storageLocal.save(this.statements);
    }

    public destroy(index: number): void {
        this.statements.splice(index, 1);
        this.storageLocal.save(this.statements);
    }

    public index(): void {
        this.storageLocal
            .all()
            .forEach(element => {
                this.statements = [element];
            });
    }

    public edit(index: number): void {
        // FIXME editar no localStorage
        this.statement = this.statements[index];
        this.statements.splice(index, 1);
        this.storageLocal.save(this.statements);

    }

    public show(index: number): void {
        // TODO
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

