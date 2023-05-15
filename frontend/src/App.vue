<script>
import Navbar from './components/Navbar.vue'
import Footer from './components/Footer.vue'

export default {
  data() {
    return {
      currentPath: window.location.hash
    }
  },
  mounted() {
    window.addEventListener('hashchange', () => {
      this.currentPath = window.location.hash
    })
  },
  components: {
    Navbar,
    Footer
  }
}
</script>

<template>
  <Navbar />
  <router-view></router-view>
  <Footer />
</template>