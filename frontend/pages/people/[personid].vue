<script lang="ts" setup>
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <div class="container">
        <div class="row align-items-center justify-content-center">
            <div class="col-md-5">
                <img class="image-person align-items-center justify-content-center" :src="`/images/People/${personDetails.personid}.webp`"
                    :alt="personDetails.personid">
            </div>
            <div class="col-md-7">
                <h3 class="name-person">{{ personDetails.name + " " + personDetails.surname }}
                </h3>
                <i>
                    <h3 style="margin-bottom: 15px; color: #000022; font-family:Avenir, sans-serif; font-size: 18px;">{{ personDetails.role }}</h3>
                </i>
                <hr>
                <p style="font-family: Avenir, sans-serif;color:#000022;" >{{ personDetails.Description }}</p>
                <br>
                <h3 class="formation">FORMATION</h3>
                <p style="margin-bottom: 15px; font-family:Avenir, sans-serif; color:#000022;">{{ personDetails.CV }}</p>
                <hr>
                <div style="margin-top: 20px; color:#000022;">
                    <a :href="`mailto:${personDetails.email}`"><img class="card-img-top img-custom"
                            src="/images/contact/email.webp" alt="Email Icon" style="width: 30px; height: auto;"></a>
                    <a :href="personDetails.linkedin" style="margin-left: 20px;"><img class="card-img-top img-custom"
                            src="/images/contact/linkedin.webp" alt="Linkedin Icon" style="width: 30px; height: auto; "></a>
                </div>
            </div>
            <div class="row" style="margin-top: 40px; margin-left: -60px; padding-block: 5%;" v-if="projectsSupervised.length > 0">
                <span class="row mx-3 badge custom-color justify-content-center" style="padding:2%;">
                    <h3 class="h3" style="margin-left : 10px; margin-top: 2px; padding:2%; float:left;">PROJECTS SUPERVISED</h3>
                    <div class="row">
                        <div v-for="project in projectsSupervised" class="col-12 col-sm-7 col-md-6 col-lg-5" style="padding:5%;">
                            <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                                :stage="project.stage" :year="project.year" :featured="project.featured" />
                        </div>
                    </div>
                </span>
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
                Description:'Gli piace giocare a golf',
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
    font-family: Avenir, sans-serif;
    color: #000022;
    margin: auto;
    margin-top: 2.2em;
    font-size: 40px;
}

.formation{
    font-size: 18px; 
    color:#000022;
    font-family:Avenir, sans-serif;
}
.h3{
    margin-top: 110px; 
    margin-left: -30px; 
    font-size:20px;  
    color:#000022;
    text-align: left;
}


.image-person {
    border-radius: 1rem;
    float: left;
    width: 400px;
    margin-right: 40px;
    margin-top: 5em;
}

@media (max-width: 1200px) {
    .image-person {
        float: none;
        clear: both;
        display: flex;
        flex: wrap;
        margin: 2em auto 1em;
        justify-content: center;
        width: 90%;
    }
}


.custom-color {
    background-color: #e5e5e5;
   
}





</style>
