<template>
    <hr class="color-line color-background" style="margin:0;">
    <footer class="py-5 color-background">
        <br>
        <div class="row">
            <div class="col-6 col-md-2 mb-3">
                <h5>Resources</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        <NuxtLink to="/" class="nav-link p-0 color-background">Home</NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/featuredprojects" class="nav-link p-0 color-background">
                            Featured projects
                        </NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/projects" class="nav-link p-0 color-background">Projects</NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/people" class="nav-link p-0 color-background">People</NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/areas" class="nav-link p-0 color-background">Areas</NuxtLink>
                    </li>
                </ul>
            </div>
            <div class="col-6 col-md-2 mb-3">
                <h5>About</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2">
                        <NuxtLink to="/about" class="nav-link p-0 color-background">
                            About us
                        </NuxtLink>
                    </li>
                    <li class="nav-item mb-2">
                        <NuxtLink to="/contacts" class="nav-link p-0 color-background">
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

                        <button class="btn btn-primary" @click="showSuccessMessage" type="button"
                            id="liveAlertBtn">Subscribe</button>
                    </div>
                    <!-- Success message -->
                    <div v-if="isSuccessMessageVisible" class="success-message mt-4">
                        Success! You are now subscribed.
                    </div>
                </form>
            </div>
        </div>
        <hr class="color-line">
        <div class="d-flex flex-column flex-sm-row justify-content-between">
            <p class="ms-4">&copy; 2023 HyperMeow, All rights reserved.</p>
        </div>
    </footer>
</template>

<script lang="js">
export default {
    data() {
        return {
            isSuccessMessageVisible: false,
        };
    },
    methods: {
        showSuccessMessage() {
            this.isSuccessMessageVisible = true;

            // Hide the success message after a certain duration
            setTimeout(() => {
                this.isSuccessMessageVisible = false;
            }, 5000);
        },
    },
};
</script>

<style scoped>
.success-message {
    background-color: #7ad9ae;
    color: white;
    padding: 10px;
    border-radius: 4px;
}

.footer {
    position: relative;
    bottom: 0;
    width: 100%;
    height: 100px;
}

/*animation when point the button*/
.btn:hover,

.btn:active {
    background-color: rgb(13, 79, 106);
}

/*set background color and color text of the entire footer*/
.color-background {
    background-color: #000022;
    color: snow;
}

/*set tht color of the line*/
.color-line {
    color: snow;
}

.btn {
    font-size: 1.0rem;
    font-weight: 450;
    text-align: center;
    margin: auto;
    color: snow;
    background-color: #086788;
    border: none;
    border-radius: 0.4rem;
    transition: 0.2s;
    cursor: pointer;
    letter-spacing: 0.1rem;
}

.row {
    margin: 0 auto;
    max-width: 1200px;
    padding: 0 15px;
    margin-top: -1em;
}
</style>