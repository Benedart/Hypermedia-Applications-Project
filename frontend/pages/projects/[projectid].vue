
<template>
    <!-- 
        TODO: this is also used for featured projects, this means that next and previous button 
        will iterate through all projects based on their ids 
        (in case of featured projects, the "next" project can also be a non featured one) 
    -->
    <div class="container">
        <div>
            <h1>{{ projectDetails.title }}
                <span v-if="projectDetails.featured">
                    - Featured
                </span>
            </h1>
        </div>
        <div>
            <i v-for="(area, index) in projectDetails.areas">
                <NuxtLink :to="`/areas/${area.areaid}`">{{ area.title }}</NuxtLink>
                <span v-if="index < projectDetails.areas.length - 1"> - </span>
            </i>
            <p><b>Budget:</b> {{ projectDetails.budget }}$</p>
            <p><b>Stage:</b> {{ projectDetails.stage }}</p>
            <hr>
            <p>{{ projectDetails.section1 }}</p>
            <p>{{ projectDetails.section2 }}</p>
            <p>{{ projectDetails.section3 }}</p>
            <hr>
            <p>
                <b>Supervisor: </b>
                <NuxtLink :to="`/people/${projectDetails.supervisor}`">
                    {{ projectDetails.name + " " + projectDetails.surname }}
                </NuxtLink>
            </p>
            <b>People: </b>
            <span v-for="(person, index) in people">
                <NuxtLink :to="`/people/${person.personid}`">
                    {{ person.name }} {{ person.surname }}
                </NuxtLink>
                <span v-if="index < people.length - 1">, </span>
            </span>
        </div>
        <!-- add the possibility to navigate to the next and previous project -->
        <div>
            <NuxtLink :to="`/projects/${previousProject}`">
                Previous project
            </NuxtLink>
            <NuxtLink :to="`/projects/${nextProject}`">
                Next project
            </NuxtLink>
        </div>
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
                supervisor: -1,
                name: 'Name',
                surname: 'Surname',
                budget: '1000',
                stage: 'stage',
                year: 1900,
                title: "Title",
                areas: [{ areaid: -1, title: "Area" }],
                featured: 1,
            },

            people: ['Person1', 'Person2'],
        }
    },

    created() {
        this.projectDetails.projectid = this.$route.params.projectid
        this.getProjectData(this.projectDetails.projectid)
    },

    computed: {
        // compute next and previous project id (range 1 to )
        nextProject() {
            return (this.projectDetails.projectid % 15) + 1
        },

        previousProject() {
            if (this.projectDetails.projectid == 1) {
                return 15
            }
            return (this.projectDetails.projectid - 1)
        },
    },

    methods: {
        getProjectData: async function (projectid: number) {
            console.log(this.$route.params)

            // get project details
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getProject/" + projectid, 'GET');
                console.log(data);
                this.projectDetails = data
            } catch (error) {
                alert("Error, couldn't retrieve project details");
                console.error(error);
            }

            // get people working on the project
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getPeopleFromProject/" + projectid, 'GET');
                console.log(data);
                this.people = data
            } catch (error) {
                alert("Error, couldn't retrieve people working on the project");
                console.error(error);
            }
        },
    }
}

</script>