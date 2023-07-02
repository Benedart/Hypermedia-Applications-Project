<template>
    <nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top" ref="navbarCollapse">
        <div class="container-fluid container">
            <NuxtLink class="navbar-brand" to="/"><img src="/images/logo.png" width="50"> <b>HyperMeow</b>
            </NuxtLink>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class=" navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <NuxtLink class="nav-link" aria-current="page" to="/">Home</NuxtLink>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Projects
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <NuxtLink class="dropdown-item" to="/featuredprojects">Featured</NuxtLink>
                            </li>
                            <li>
                                <NuxtLink class="dropdown-item" to="/projects">All projects</NuxtLink>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <NuxtLink class="nav-link" to="/people">People</NuxtLink>
                    </li>
                    <li class="nav-item">
                        <NuxtLink class="nav-link" to="/areas">Areas</NuxtLink>
                    </li>
                    <li class="nav-item">
                        <NuxtLink class="nav-link" to="/about">About us</NuxtLink>
                    </li>
                    <li class="nav-item">
                        <NuxtLink class="nav-link" to="/contacts">Contact us</NuxtLink>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

<script>
export default {
  mounted() {
    // Attach touchstart event listener to the document
    document.addEventListener('touchstart', this.handleClickOutside);
  },
  beforeUnmount() {
    // Remove touchstart event listener when the component is unmounted
    document.removeEventListener('touchstart', this.handleClickOutside);
  },
  methods: {
    handleClickOutside(event) {
      // If the clicked target is not within the .navbar-collapse element
      if (!this.$refs.navbarCollapse.contains(event.target)) {
        // Collapse every .navbar-collapse element
        const navbarCollapses = document.querySelectorAll('.navbar-collapse');
        navbarCollapses.forEach((navbarCollapse) => {
          navbarCollapse.classList.remove('show');
        });
      }
    },
  },
};
</script>

<style scoped>
.navbar {
    background-color: #000022 !important;
}

.navbar-brand {
    color: #FFFBFA;
    margin-left: 30px;
    font-size: x-large;
}

.nav-link {
    color: #FFFBFA;
    border-radius: 15px;
    font-weight: bold;
    font-size: medium;
    margin-left: 10px;
    margin-right: 10px;
    text-align: center;

    /* animation */
    transition: 0.3s;
}

.nav-link {
    color: #FFFBFA;
}

.nav-item.dropdown .dropdown-toggle {
    color: #FFFBFA;
}

.router-link-active:not(.navbar-brand) {
    color: #ffffff;
    background-color: #9991A1;
}

.router-link-active:hover:not(.navbar-brand) {
    color: #ffffff;
    background-color: #9991A1;
}

.router-link-active:active:not(.navbar-brand) {
    color: #ffffff;
    background-color: #9991A1;
}

.router-link-active:focus:not(.navbar-brand) {
    color: #ffffff;
    background-color: #9991A1;
}

.router-link-active:visited:not(.navbar-brand) {
    color: #ffffff;
    background-color: #9991A1;
}

/* the dropdown menu should be animated and highlighted when active */
.dropdown-menu {
    background-color: #000022;
}

.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
    /* remove the gap so it doesn't close */
}

.dropdown-item {
    color: #FFFBFA;
}

.dropdown-item:hover {
    color: #ffffff;
    background-color: #9991A1;
}

.dropdown-item:active {
    color: #ffffff;
    background-color: #9991A1;
}

.dropdown-item:focus {
    color: #ffffff;
    background-color: #9991A1;
}

.dropdown-item:visited {
    color: #ffffff;
    background-color: #9991A1;
}

.navbar-toggler {
    border: var(--bs-border-width) solid var(--color-snow);
}

.navbar-toggler.collapsed {
    border: var(--bs-border-width) solid var(--color-snow);
}

.navbar-toggler-icon {
    color: var(--color-snow);
}

.navbar-toggler-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255,251,252, 0.75)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E");
}
</style>