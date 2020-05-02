<template>
    <section>
        <div v-for="(statement, index) in statements" :key="statement.name">
            <p>
                <span class="statement">{{ statement.name }}</span>
                <button class="btn btn-danger" @click="destroy(index)">Remover</button>
                <button class="btn btn-info" @click="edit(index)">Editar</button>
            </p>
        </div>
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
