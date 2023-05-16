<template>
    <div class="card h-100" @click="getProjectData(projectid)" style="width: 18rem;" data-bs-toggle="modal"
        :data-bs-target="`#modal${accordion}-${projectid}`">
        <img class="card-img-top" :src="`/images/projects/${title}.webp`" :alt="title">
        <div class="card-body">
            <h5 class="card-title">{{ title }}</h5>
            <p class="card-text">{{ preview }}</p>
        </div>
        <div class="card-footer">
            <i class="float-start">{{ stage }}</i>
            <span class="float-end">{{ year }}</span>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade modal-xl" :id="`modal${accordion}-${projectid}`" tabindex="-1"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{ title }} <span v-if="projectDetails.featured"> -
                            Featured</span></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <b>Areas: </b><span v-for="(area, index) in areas">{{ area.title }}<span
                            v-if="index < areas.length - 1"> -
                        </span></span>
                    <p><b>Supervisor:</b> {{ projectDetails.name + " " + projectDetails.surname }}</p>
                    <p><b>Budget:</b> {{ projectDetails.budget }}$</p>
                    <p><b>Stage:</b> {{ projectDetails.stage }}</p>
                    <hr>
                    <p>{{ projectDetails.description }}</p>
                    <hr>
                    <b>People: </b>
                    <span v-for="(person, index) in people">{{ person.name }} {{ person.surname }}<span
                            v-if="index < people.length - 1"> -
                        </span>
                    </span>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { makeCall } from '@/utils/common'

export default {
    data() {
        return {
            projectDetails: {
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                name: 'Name',
                surname: 'Surname',
                budget: '1000',
                stage: 'stage',
                year: 'year'
            },

            people: ['Person1', 'Person2'],
        }
    },

    props: {
        projectid: Number,
        title: String,
        preview: String,
        stage: String,
        areas: Array,
        year: Number,
        featured: Number,
        accordion: Number
    },

    methods: {
        getProjectData: function (projectid: number) {
            // get project details
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getProject/" + projectid,
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;
                        console.log(message)

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.projectDetails = data
                        } else {
                            alert("Error, couldn't retrieve project details");
                        }
                    }
                }
            )

            // get people working on the project
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getPeopleFromProject/" + projectid,
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;
                        console.log(message)

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.people = data
                        } else {
                            alert("Error, couldn't retrieve people working on the project");
                        }
                    }
                }
            )
        },
    }
}

</script>