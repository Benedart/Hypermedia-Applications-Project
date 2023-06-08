<template>
    <!--
        TODO: find a way to not make the logo light up when in the home page
    -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
        <div class="container-fluid">
            <NuxtLink class="navbar-brand" style="color:#FFFBFA;" to="/"><img src="@/images/logo.png" width="50"> <b>HyperMeow</b></NuxtLink>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <NuxtLink class="nav-link active" style="color:#FFFBFA;" aria-current="page" to="/">Home</NuxtLink>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false" style="color:#FFFBFA;">
                            Projects
                        </a>
                        <ul class="dropdown-menu" style="color:#FFFBFA;">
                            <li>
                                <NuxtLink class="dropdown-item" to="/featuredprojects">Featured</NuxtLink>
                            </li>
                            <li>
                                <NuxtLink class="dropdown-item" to="/projects">All projects</NuxtLink>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <NuxtLink class="nav-link" to="/people" style="color:#FFFBFA;">People</NuxtLink>
                    </li>
                    <li class="nav-item">
                        <NuxtLink class="nav-link" to="/areas" style="color:#FFFBFA;">Areas</NuxtLink>
                    </li>
                    <li class="nav-item">
                        <NuxtLink class="nav-link" to="/about" style="color:#FFFBFA;">About us</NuxtLink>
                    </li>
                    <li class="nav-item">
                        <NuxtLink class="nav-link" to="/contacts" style="color:#FFFBFA;">Contact us</NuxtLink>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

<style scoped>



.navbar {
    background-color:#000022 !important;
}

/* the NuxtLinks should be animated and highlighted when active */

.nav-item{
    color:#FFFBFA;
}
.router-link-active {
    color: #ffffff;
    background-color: #9991A1;
}

.router-link-active:hover {
    color: #ffffff;
    background-color: #9991A1;
}

.router-link-active:active {
    color: #ffffff;
    background-color: #9991A1;
}

.router-link-active:focus {
    color: #ffffff;
    background-color: #9991A1;
}

.router-link-active:visited {
    color: #ffffff;
    background-color: #9991A1;
}

/* the dropdown menu should be animated and highlighted when active */

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
    background-color: #9991A1;
}
</style>