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
  <router-view v-slot="{ Component }">
    <transition name="fade" mode="out-in">
      <component :is="Component" />
    </transition>
  </router-view>
  <Footer />
</template>

<style>
.fade-enter-active,
.fade-leave-active {
  transition: opacity .5s
}

.fade-enter,
.fade-leave-to {
  opacity: 0
}

.mytooltip {
  position: relative;
  display: inline-block;
}

.mytooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;

  /* bottom tooltip */
  width: 120px;
  top: 120%;
  left: 50%;
  margin-left: -60px;
  /* Use half of the width (120/2 = 60), to center the tooltip */
}

.mytooltip .tooltiptext::after {
  content: " ";
  position: absolute;
  bottom: 100%;
  /* At the top of the tooltip */
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: transparent transparent black transparent;
}

.mytooltip:hover .tooltiptext {
  visibility: visible;
}
</style>