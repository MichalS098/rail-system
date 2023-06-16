<template>
    <Head :title="title" />
    <div>
        <HeaderSection />
        <slot />
    </div>
</template>
<script setup>
import HeaderSection from '../Components/HeaderSection.vue';
import { Head } from '@inertiajs/vue3';

const props = defineProps({
    title: {
        type: String,
        default: 'Laravel'
    }
})
</script>