<script lang="ts" setup>
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <div class="container">
        <div class="row mx-3">
            <div class="col-xs-1 col-sm-2 col-md-2 col-lg-12 ">
                <img class="image-person align-items-center" :src="`/images/People/${personDetails.personid}.webp`"
                    :alt="personDetails.personid">
                <h3 class="name-person">{{ personDetails.name + " " + personDetails.surname }}
                </h3>
                <i>
                    <p style="margin:auto; color: #fff;">{{ personDetails.role }}</p>
                </i>
                <hr style="margin-bottom: 30px;">
                <p style="margin-bottom: 30px;">{{ personDetails.CV }}</p>
                <hr style="margin-bottom: 30px;">
                <div>
                    <a :href="`mailto:${personDetails.email}`"><img class="card-img-top img-custom"
                            src="/images/contact/email.webp" alt="Email Icon" style="width: 30px; height: auto;"></a>
                    <a :href="personDetails.linkedin" style="margin-left: 20px;"><img class="card-img-top img-custom"
                            src="/images/contact/linkedin.webp" alt="Linkedin Icon" style="width: 30px; height: auto; "></a>
                </div>
            </div>
            <h3 class="h3" style="margin-top: 200px; margin-left: 35px; margin-bottom: 50px;"
                v-if="projectsSupervised.length > 0">Projects supervised:</h3>
            <div class="row g-3" v-if="projectsSupervised.length > 0">
                <div v-for="project in projectsSupervised" class="col-12 col-md-6 col-lg-4">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :year="project.year" :featured="project.featured" />
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
            personDetails: {
                personid: -1,
                name: 'Paolo',
                surname: 'Rossi',
                age: '37',
                email: 'paolo.rossi@gmail.com',
                linkedin: 'https://www.linkedin.com/feed/',
                CV: 'Laureato e molto bravo in costruzioni lego',
                role: 'CEO',

            },

            projectsSupervised: [
                {
                    projectid: -1,
                    title: 'project',
                    preview: 'preview',
                    stage: 'stage',
                    year: 1024,
                }
            ],

        }
    },

    components: {
        ProjectCard
    },


    created() {
        this.personDetails.personid = this.$route.params.personid
        this.getPersonData(this.personDetails.personid)
    },

    methods: {
        getPersonData: async function (personid: number) {
            console.log(this.$route.params)
            //get person details
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getPerson/" + personid, 'GET');
                console.log(data);
                this.personDetails = data
            } catch (error) {
                alert("Error, couldn't retrieve person details");
                console.error(error);
            }

            //get projects supervised 
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getProjectsSupervisedFromPerson/" + personid, 'GET');
                console.log(data);
                this.projectsSupervised = data
            } catch (error) {
                alert("Error, couldn't retrieve projects supervised");
                console.error(error);
            }
        },

    },

}
</script>


<style scoped>
.name-person {
    font-family: secular one, sans-serif;
    color: #fff;
    margin: auto;
    margin-top: 2.8em;
    font-size: 40px;
}

/*.back{
    /*background-color: #fff;
    width: 2500rem;
    height: 60rem;
    margin-top : -3em;
    margin: auto;
    border-radius: 0.4rem;
    border-radius: 1rem;
    background-color: #fff;
    max-width:  100%;
    max-height : 100%;
    width : auto;
    height: auto;
    margin: auto;
    margin-top : 5em;
}*/

.image-person {
    border-radius: 1rem;
    float: left;
    width: 350px;
    margin-right: 40px;
    margin-left: -2em;
    margin-top: 5em;
}
</style>
