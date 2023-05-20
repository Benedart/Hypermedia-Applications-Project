<template>
    <nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="@/images/logo.png" width="50"> <b>HyperMeow</b></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <NuxtLink class="nav-link active" aria-current="page" to="/">Home</NuxtLink>
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

<style scoped>
.navbar {
    background-color: #ffffff;
}

/* the NuxtLinks should be animated and highlighted when active */
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