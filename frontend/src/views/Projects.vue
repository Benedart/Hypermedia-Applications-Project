<template>
    <header>
        <img src="@/assets/logo.png" width="50">
    </header>
    <main>
        <h1>Projects</h1>

        <div v-for="project in  projects " v-on:click="getProjectData(project.projectid)" class="card">
            <div class="card" style="width: 18rem;" data-bs-toggle="modal" :data-bs-target="`#modal${project.projectid}`">
                <img class="card-img-top" :src="`/images/projects/${project.title}.webp`" :alt="project.title">
                <div class="card-body">
                    <h5 class="card-title">{{ project.title }}</h5>
                    <p class="card-text">{{ project.preview }}</p>
                    <i>{{ project.stage }}</i>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade modal-xl" :id="`modal${project.projectid}`" tabindex="-1"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">{{ project.title }}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <i>{{ projectDetails.area }}</i>
                            <p>Supervisor: {{ projectDetails.name + " " + projectDetails.surname }}</p>
                            <p>{{ projectDetails.description }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>
</template>

<script>
import { makeCall } from '../utils/common'

export default {
    data() {
        return {
            projects: [
                {
                    title: 'project',
                    ShortDescription: 'Questo progetto è bellissimo, davvero il futuro',
                    Stage: 'bho'
                },
            ],

            projectDetails: {},
        }
    },

    created() {
        this.getData()
    },

    methods: {
        getData: function () {
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getProjects",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;
                        console.log(message)

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.projects = data
                        } else {
                            alert("Error, couldn't retrieve data");
                        }
                    }
                }
            )
        },

        getProjectData: function (projectid) {
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getProject/" + projectid,
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;
                        console.log(message)

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.projectDetails = data
                        } else {
                            alert("Error, couldn't retrieve data");
                        }
                    }
                }
            )
        },
    }
};
</script>

<style>
.card {
    cursor: pointer;
}
</style>