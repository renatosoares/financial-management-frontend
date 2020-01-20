<template>
    <section>
        <form action="">
            <input autofocus autocomplete="off" placeholder="name" v-model="statement.name">
            <input autofocus autocomplete="off" placeholder="type" v-model="statement.type">
            <input autocomplete="off" placeholder="amount" v-model="statement.amount">
            <input autocomplete="off" placeholder="amount_at" v-model="statement.amountAt">
            <button  @click="store" type="submit">Adicionar</button>
        </form>
    </section>
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
            this.statements.push(this.statement);
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