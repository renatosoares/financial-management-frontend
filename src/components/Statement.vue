<template>
    <div>
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
    </div>
</template>

<script>
export default {
    name: 'Statement',
    props: {
    },
    data: function () {
        return {
            statement: {
                name: null,
                type: null,
                amount: null,
                amountAt: null,
            },
            statementCollection: [],
            testPrint: ''
        };
    },
    computed: {
        statements: {
            get: function () {
                const self = this;

                return self.statementCollection;
            },
            set: function (newValue) {
                const self = this;

                self.statementCollection.push(newValue);
            }
        }
    },
    watch: {

    },
    methods: {
        store () {
            const self = this;

            if (!this.statement.name) return;

            let data = Object.assign({}, this.statement);

            self.statements = data;
            self.statement.name = null;
            self.statement.type = null;
            self.statement.amount = null;
            self.statement.amountAt = null;

            self.repository().storageLocal.save('statements', this.statements);
        },
        destroy (index) {
            this.statements.splice(index, 1);
            this.repository().storageLocal.save('statements', this.statements);
        },
        index () {
            const self = this;

            self.repository()
                .storageLocal
                .list('statements')
                .forEach(function (element) {
                    self.statements = element;
                });
        },
        repository () {
            const storageLocal = {
                save: (key, value) => {
                    const parsed = JSON.stringify(value);
                    localStorage.setItem(key, parsed);
                },
                list: (key) => {
                    if (localStorage.getItem(key)) {
                        try {
                            return JSON.parse(localStorage.getItem(key));
                        } catch (error) {
                            localStorage.removeItem(key);
                            return [];
                        }
                    }
                }
            };

            return {
                storageLocal
            };
        },
    },
    mounted () {
        this.index();
    },
};
</script>

<style>

</style>
