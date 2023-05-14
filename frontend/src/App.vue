<script>
import Navbar from './components/Navbar.vue'
import Footer from './components/Footer.vue'

import Home from './views/Home.vue'
import Projects from './views/Projects.vue'
import Areas from './views/Areas.vue'
import People from './views/People.vue'
import About from './views/About.vue'
import Contact from './views/Contacts.vue'
import Featured from './views/FeaturedProjects.vue'

const routes = {
  '/': Home,
  '/projects': Projects,
  '/areas': Areas,
  '/people': People,
  '/about': About,
  '/contact': Contact,
  '/featured': Featured
}

export default {
  data() {
    return {
      currentPath: window.location.hash
    }
  },
  computed: {
    currentView() {
      return routes[this.currentPath.slice(1) || '/'] || NotFound
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
  <component :is="currentView" />
  <Footer />
</template>