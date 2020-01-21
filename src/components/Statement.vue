<template>
    <div>
        <section>
            <input autofocus autocomplete="off" placeholder="name" v-model="statement.name">
            <input autofocus autocomplete="off" placeholder="type" v-model="statement.type">
            <input autocomplete="off" placeholder="amount" v-model="statement.amount">
            <input autocomplete="off" placeholder="amount_at" v-model="statement.amountAt">
            <button  @click="store" type="submit">Adicionar</button>
        </section>
        <section>
            <div v-for="(statement, index) in statements" :key="statement.name">
                <p>
                    <span class="statement">{{ statement.name }}</span>
                    <button @click="removeStatement(index)">Remover</button>
                </p>
            </div>
        </section>
    </div>
</template>

<script>
export default {
    name: 'Statement',
    props: {
    },
    data: () => {
        return {
            statement: {
                name: null,
                type: null,
                amount: null,
                amountAt: null,
            },
            statements: [],
            testPrint: ''
        };
    },
    computed: {
        teste: () => {
        },
    },
    methods: {
        store: function () {
            if (!this.statement.name) return;
            let data = Object.assign({}, this.statement);
            this.statements.push(data);
            this.statement.name = null;
            this.statement.type = null;
            this.statement.amount = null;
            this.statement.amountAt = null;
            this.saveStatements();
        },
        removeStatement (index) {
            this.statements.splice(index, 1);
            this.saveStatements();
        },
        saveStatements: function () {
            const parsed = JSON.stringify(this.statements);
            localStorage.setItem('statements', parsed);
        }
    },
    beforeCreate () {
    },
    created () {
    },
    mounted () {
        if (localStorage.getItem('statements')) {
            try {
                this.statements = JSON.parse(localStorage.getItem('statements'));
            } catch (error) {
                localStorage.removeItem('statements');
            }
        }
    },
    updated () {
    },
}
</script>

<style>

</style>