<template>
    <div class="modal-header">
        <h1 class="modal-title" id="exampleModalLabel">{{ projectDetails.title }} <span v-if="projectDetails.featured"> -
                Featured</span></h1>
    </div>
    <div class="modal-body">
        <i v-for="area in projectDetails.areas">{{ area }} - </i>
        <p><b>Supervisor:</b> {{ projectDetails.name + " " + projectDetails.surname }}</p>
        <p><b>Budget:</b> {{ projectDetails.budget }}$</p>
        <p><b>Stage:</b> {{ projectDetails.stage }}</p>
        <hr>
        <p>{{ projectDetails.description }}</p>
        <hr>
        <b>People: </b><span v-for="person in projectDetails.people">{{ person }}, </span>
    </div>
</template>

<script lang="ts">
import { makeCall } from '@/utils/common'

export default {
    data() {
        return {
            projectDetails: {
                projectid: -1,
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                name: 'Name',
                surname: 'Surname',
                budget: '1000',
                people: ['Person1', 'Person2'],
                stage: 'stage',
                year: 1900,
                title: "Title",
                areas: [{ areaid: -1, title: "Area" }],
                featured: 1,
            },
        }
    },

    created() {
        this.projectDetails.projectid = this.$route.params.projectid
        this.getProjectData(this.projectDetails.projectid)
    },

    methods: {
        getProjectData: function (projectid: number) {
            console.log(this.$route.params)

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
                            this.projectDetails.people = data
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