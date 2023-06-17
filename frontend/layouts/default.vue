<script setup>
import Navbar from '@/components/Navbar.vue'
import Footer from '@/components/Footer.vue'
</script>

<template>
    <div class="default-layout">
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
/*our palette*/
:root {
    --color-oxford-blue: #000022;
    --color-rose-quartz: #9991a1;
    --color-platinum: #e5e5e5;
    --color-snow: #FFFBFA;
    --color-cerulean: #086788;
}
</style>