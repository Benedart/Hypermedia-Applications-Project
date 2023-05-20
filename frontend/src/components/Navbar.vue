<template>
    <nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="@/assets/logo.png" width="50"> <b>HyperMeow</b></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <router-link class="nav-link active" aria-current="page" to="/">Home</router-link>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            Projects
                        </a>
                        <ul class="dropdown-menu">
                            <li><router-link class="dropdown-item" to="/featured">Featured</router-link></li>
                            <li><router-link class="dropdown-item" to="/projects">All projects</router-link></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" to="/people">People</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" to="/areas">Areas</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" to="/about">About us</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" to="/contact">Contact us</router-link>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

<style scoped>
.navbar {
    background-color: #ffffff;
}

/* the router-links should be animated and highlighted when active */
.router-link-active {
    color: #ffffff;
    background-color: #00ce6e;
}

.router-link-active:hover {
    color: #ffffff;
    background-color: #00ce6e;
}

.router-link-active:active {
    color: #ffffff;
    background-color: #00ce6e;
}

.router-link-active:focus {
    color: #ffffff;
    background-color: #00ce6e;
}

.router-link-active:visited {
    color: #ffffff;
    background-color: #00ce6e;
}

/* the dropdown menu should be animated and highlighted when active */

.dropdown-item:hover {
    color: #ffffff;
    background-color: #00ce6e;
}

.dropdown-item:active {
    color: #ffffff;
    background-color: #00ce6e;
}

.dropdown-item:focus {
    color: #ffffff;
    background-color: #00ce6e;
}

.dropdown-item:visited {
    background-color: #00ce6e;
}
</style>