<script setup>
import Navbar from '@/components/Navbar.vue'
import Footer from '@/components/Footer.vue'
</script>

<template>
    <div class = "mx-3">
        <Navbar />
        <slot />
        <Footer />
    </div>
</template>

<script>
export default {
    components: {
        Navbar,
        Footer
    }
}
</script>

<style>
* {
    font-family: 'Inter', sans-serif;
}
</style>