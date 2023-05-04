<script>
import Home from './views/Home.vue'
import Projects from './views/Projects.vue'

const routes = {
  '/': Home,
  '/projects': Projects,
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
  }
}
</script>

<template>
  <a href="#/">Home</a>
  <a href="#/projects">Projects</a>
  <a href="#/people">People</a>
  <a href="#/areas">Areas</a>
  <component :is="currentView" />
</template>