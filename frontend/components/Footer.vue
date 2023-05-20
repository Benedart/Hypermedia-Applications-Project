<template>
    <footer class="py-5">
        <div class="row">
            <div class="col-6 col-md-2 mb-3">
                <h5>Resources</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        <NuxtLink to="/" class="nav-link p-0 text-muted">Home</NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/featuredprojects" class="nav-link p-0 text-muted">
                            Featured projects
                        </NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/projects" class="nav-link p-0 text-muted">Projects</NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/people" class="nav-link p-0 text-muted">People</NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/areas" class="nav-link p-0 text-muted">Areas</NuxtLink>
                    </li>
                </ul>
            </div>

            <div class="col-6 col-md-2 mb-3">
                <h5>About</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        <NuxtLink to="/about" class="nav-link p-0 text-muted">
                            About us
                        </NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/contacts" class="nav-link p-0 text-muted">
                            Contact us
                        </NuxtLink>
                    </li>
                </ul>
            </div>

            <div class="col-md-5 offset-md-1 mb-3">
                <form>
                    <h5>Subscribe to our newsletter</h5>
                    <p>Monthly digest of what's new and exciting from us.</p>
                    <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email address</label>
                        <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
                        <button class="btn btn-primary" type="button">Subscribe</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
            <p>&copy; 2023 HyperMeow, All rights reserved.</p>
        </div>
    </footer>
</template>