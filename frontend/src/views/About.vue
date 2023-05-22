<script setup lang="ts">
import { makeCall } from '@/utils/common'
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <main>
        <div class="container-fluid">
            <div class="row custom-heading">
                About us
            </div>
            <br>
            <br>
            <div class="row mx-3 justify-content-center">
                <div class="col-md-6 d-flex align-items-center justify-content-center">
                    <h3 style="text-align:center;"> <b>“Very inspirational quote here, something moving, not like what im currently writing. This is just a beautiful placeholder. I don’t know what else to write. I like cats.”</b></h3>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <div class="row mx-3">
                <div class="col-md-6 my-3">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Urna molestie at elementum eu. Suspendisse in est ante in nibh mauris cursus mattis. Tortor pretium viverra suspendisse potenti nullam ac tortor. Ultricies tristique nulla aliquet enim tortor at auctor urna. 
                    Aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi. Vitae nunc sed velit dignissim sodales ut eu sem integer. Enim eu turpis egestas pretium aenean. Diam quam nulla porttitor massa id. Ut tellus elementum sagittis vitae et leo. Fermentum odio eu feugiat pretium nibh ipsum consequat nisl.
                    Pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at. Mollis nunc sed id semper risus. Faucibus et molestie ac feugiat sed lectus. Turpis tincidunt id aliquet risus feugiat in ante metus. Praesent tristique magna sit amet purus gravida quis blandit. Mauris pharetra et ultrices neque ornare aenean euismod. Semper eget duis at tellus at. Nam at lectus urna duis convallis convallis tellus id interdum. Ut porttitor leo a diam sollicitudin tempor id eu nisl. Quisque sagittis purus sit amet volutpat. Quam id leo in vitae turpis. Lacinia quis vel eros donec ac odio tempor orci dapibus. Amet massa vitae tortor condimentum lacinia quis vel. Et malesuada fames ac turpis egestas integer.
                </div>
                <div class= "col-md-6 my-3">
                    <img class="card-img-top rounded" src="/images/about/usCats.webp" alt="Poker Cats">
                </div>
            </div>
            <div class = "row my-5"></div> <!---- added for spacing --->
            <div class="row mx-3">
                <div class = "col-md-5 rounded mb-3">
                    <div class="row" style = "font-size: 3.5em;">
                        <b> BIG NUMBER 1</b>
                    </div>
                    <div class="row">
                        <b> What's that number?</b>
                    </div>
                </div>
                <div class="col-md-2"></div>
                <div class="col-md-5 rounded mb-3">
                    <div class="row" style = "font-size: 3.5em;">
                        <b> ANOTHER ONE</b>
                    </div>
                    <div class="row">
                        <b> That’s very crazy, didn’t expect it</b>
                    </div>
                </div>
            </div>
            <div class = "row my-5"></div> <!---- added for spacing --->
            <div class="row mx-3">
                <div class = "col-md-6 my-3">
                    <img class="card-img-top rounded" src="/images/about/entrepreneurCat.webp" alt="Entrepreneur Cat">
                </div>
                <div class="col-md-6 text-right my-3">
                    <h3> <b> Something </b></h3>
                    <br>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Urna molestie at elementum eu. Suspendisse in est ante in nibh mauris cursus mattis. Tortor pretium viverra suspendisse potenti nullam ac tortor. Ultricies tristique nulla aliquet enim tortor at auctor urna. 
                    Aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi. Vitae nunc sed velit dignissim sodales ut eu sem integer. Enim eu turpis egestas pretium aenean. Diam quam nulla porttitor massa id. Ut tellus elementum sagittis vitae et leo. Fermentum odio eu feugiat pretium nibh ipsum consequat nisl.
                </div>
            </div>
            <div class = "row my-4"></div> <!---- added for spacing --->
            <div class="row mx-3 justify-content-center">
                <div class="col-md-8" style = "text-align: center;">
                    <h3><b>“We love inspirational quotes, they are very big and seem very meaningful. I really don’t know what the world would be without them. This has been very helpful. Yes.”</b></h3>
                </div>
                <div class = "row my-3"></div> <!---- added for spacing --->
                <div class="col-md-8 justify-content-center" style = "text-align: justify;">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Urna molestie at elementum eu. Suspendisse in est ante in nibh mauris cursus mattis. Tortor pretium viverra suspendisse potenti nullam ac tortor. Ultricies tristique nulla aliquet enim tortor at auctor urna. 
                    Aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi. Vitae nunc sed velit dignissim sodales ut eu sem integer. Enim eu turpis egestas pretium aenean. Diam quam nulla porttitor massa id. Ut tellus elementum sagittis vitae et leo. Fermentum odio eu feugiat pretium nibh ipsum consequat nisl.
                </div>
            </div>
            <div class = "row my-5"></div> <!---- added for spacing --->
            <div class="row mx-3 justify-content-center">
                <h1 style="text-align: center;"> What about featured projects here? </h1>
            </div>
            <br>
            <div class = "row mx-3 d-flex justify-content-center">
                <div class="row mx-3 justify-content-center">
                    <div v-for="project in projects" class="col mb-3 d-flex justify-content-center">
                        <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :areas="project.areas" :year="project.year" :featured="project.featured" />
                    </div>
                </div>
            </div>
            <br>
            <div class = "row mx-3 d-flex justify-content-center">
                <router-link to="/projects" tag="button" class="btn btn-secondary d-flex justify-content-center">All projects</router-link>
            </div>
            <div class = "row my-5"></div> <!---- added for spacing --->
            <div class = "row mx-3 justify-content-center">
                <h1 style="text-align: center;"> And like some of the leading people here?? </h1>
            </div>
            <br>
            <div class = "row mx-3 d-flex justify-content-center">
                <div class="row mx-3 justify-content-center">
                    QUI CI VANNO LE PERSONE
                </div>
            </div>
            <br>
            <div class = "row mx-3 d-flex justify-content-center">
                <router-link to="/people" tag="button" class="btn btn-secondary d-flex justify-content-center">All people</router-link>
            </div>
            <div class = "row my-5"></div> <!---- added for spacing --->
            <div class = "row mx-3">
                <h2 style="text-align: center;"> What they say about us</h2>
            </div>
            <br>
            <div class = "row mx-3 justify-content-center">
                <div class = "col-md-3 mx-auto my-3" style="text-align: center;">
                    <div class = "row" >
                        “This is a very important opinion of someone about us, usually nobody reads these, but oh well here we go”
                    </div>
                    <div class = "row">
                        <b> - Someone</b>
                    </div>
                </div>
                <div class = "col-md-3 mx-auto my-3" style="text-align: center;">
                    <div class = "row">
                        “This is someone saying something like “X really changed my way of seeing things” wow!!!!”
                    </div>
                    <div class = "row">
                        <b> - Usually someone else</b>
                    </div>
                </div>
                <div class = "col-md-3 mx-auto my-3" style="text-align: center;">
                    <div class = "row">
                        “Meow! Mrreow. Zooom, boom crash, patapatapatapata sssssk tompf. Mraow”
                    </div>
                    <div class = "row">
                        <b> - My cat</b>
                    </div>
                </div>
            </div>
            <br>
            <br>
        </div>
    </main>
</template>

<style scoped>
.custom-heading {
    font-size: 3.5em;
}

.rounded {
  border-radius: 75%;
}

.text-right {
  text-align: right;
}

.btn-secondary {
  width: 90%;
}

</style>

<script lang="ts">
    export default {
    data() {
        return {
            projects: [],
        }
    },

    components: {
        ProjectCard,
    },

    created() {
        this.getData()
    },

    methods: {
        getData: function () {
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getFeaturedProjects",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.projects = data;
                        } else {
                            alert("Error, couldn't retrieve data");
                        }
                    }
                }
            )
        },
    },
}
</script>