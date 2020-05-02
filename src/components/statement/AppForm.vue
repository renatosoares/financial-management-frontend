<template>
    <section>
        <div class="form-group">
            <input class="form-control" autofocus autocomplete="off" placeholder="name" v-model="statement.name">
        </div>
        <div class="form-group">
            <input class="form-control" autocomplete="off" placeholder="type" v-model="statement.type">
        </div>
        <div class="form-group">
            <input class="form-control" autocomplete="off" placeholder="amount" v-model="statement.amount">
        </div>
        <div class="form-group">
            <input class="form-control" autocomplete="off" placeholder="amount_at" v-model="statement.amountAt">
        </div>
        <button class="btn btn-success btn-lg btn-block" @click="store()" type="submit">Adicionar</button>
    </section>
</template>

<script lang="ts">
import { Component, Prop, Vue, Watch } from 'vue-property-decorator';

@Component
export default class AppForm extends Vue {

}

</script>

<style lang="scss" scoped>
</style>
