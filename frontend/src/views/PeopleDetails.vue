<script lang="ts" setup>
import ProjectCard from '@/components/ProjectCard.vue'
</script>


<template>
    <div class="container">
        <div>
            <img class="card-img-top" :src="`/images/People/${personDetails.personid}.webp`" :alt="personDetails.personid" style="float: left; width: 300px; margin-right: 40px; margin-left:-10px; margin-top: -10px; border-radius: 100%;">
        </div>
        <div>
            <h3 style = "margin-top: 100px;">{{ personDetails.name + " " + personDetails.surname + ","}}
                <span>
                {{ personDetails.age + " years"}}
                </span>
            </h3>
            <i>
                <p style = "margin-bottom: 30px;">{{ personDetails.role }}</p>
            </i>
            <hr style = "margin-bottom: 30px;">
            <p style = "margin-bottom: 30px;">{{ personDetails.CV }}</p>
            <hr style = "margin-bottom: 30px;">
            <div>
                <a :href="`mailto:${personDetails.email}`"><img class="card-img-top img-custom" src="/images/contact/email.webp" alt="Email Icon" style ="width: 30px; height: auto;"></a>
                <a :href="personDetails.linkedin" style = "margin-left: 20px;"><img class="card-img-top img-custom" src="/images/contact/linkedin.webp" alt="Linkedin Icon" style ="width: 30px; height: auto; "></a>
            </div>
            <h3 class="h3" style="margin-top: 200px; margin-left: 35px; margin-bottom: 50px;" v-if="projectsSupervised.length > 0">Projects supervised:</h3>
            <div class="row g-3" v-if="projectsSupervised.length > 0">
                <div v-for="project in projectsSupervised" class="col-12 col-md-6 col-lg-4">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                    :stage="project.stage" :year="project.year" :featured="project.featured" />
                </div>
            </div>
            <h3 class="h3" style="margin-top: 200px; margin-left: 35px; margin-bottom: 50px;" v-if="projectsJoined.length > 0">Projects joined:</h3>
            <div class="row g-3" v-if="projectsJoined.length > 0">
                <div v-for="project in projectsJoined" class="col-12 col-md-6 col-lg-4">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                    :stage="project.stage" :year="project.year" :featured="project.featured" />
                </div>
            </div>
        </div>
        <div style = "margin-top: 300px;">
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
                    email : 'paolo.rossi@gmail.com',
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
                    year: 'year',
                }
            ],

            projectsJoined: [
                {
                    
                    projectid: -1,
                    title: 'project',
                    preview: 'preview',
                    stage: 'stage',
                    year: 'year',
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
        getPersonData: function (personid: number) {
            console.log(this.$route.params)

            // get person details
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getPerson/" + personid,
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;
                        console.log(message)

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.personDetails = data
                        } else {
                            alert("Error, couldn't retrieve person details");
                        }
                    }
                }
            )

            // get projects which a person is supervised
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getProjectsSupervisedFromPerson/" + personid,
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;
                        console.log(message)

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.projectsSupervised = data
                        } else {
                            alert("Error, couldn't retrieve projects supervised");
                        }
                    }
                }
            )

            // get projects which a person is joining
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getProjectsJoinedFromPerson/" + personid,
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;
                        console.log(message)

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.projectsJoined = data
                        } else {
                            alert("Error, couldn't retrieve projects joined");
                        }
                    }
                }
            )
        },

        /*getLinkedinLink(personid: number) {
            switch (personid) {
                case 1:
                    return 'https://www.linkedin.com/in/james-thompson-5753a859/';
                case 2:
                    return 'https://www.linkedin.com/in/lindamartinez100/';
                case 3:
                    return 'https://www.linkedin.com/in/emily-chen-82b20431/';
                case 4:
                    return 'https://www.linkedin.com/in/mark-robinson-959230177/';
                case 5:
                    return 'https://www.linkedin.com/in/sarah-johnson-35032723a/';
                case 6:
                    return 'https://www.linkedin.com/in/david-brown-1835b2b8/';
                case 7:
                    return 'https://www.linkedin.com/in/lauraadams/';
                case 8:
                    return ' https://www.linkedin.com/in/mikewilliams1125/';
                case 9:
                    return 'https://www.linkedin.com/in/karenlmx/';
                case 10:
                    return 'https://www.linkedin.com/in/alex-marti-80546544/';
                case 11:
                    return 'https://www.linkedin.com/in/jane-smith-41915517/';
                case 12:
                    return 'https://www.linkedin.com/in/john-d-33aa471b4/';
                case 13:
                    return 'https://www.linkedin.com/in/emily-green-21a61a158/';
                case 14:
                    return 'https://www.linkedin.com/in/mikebrown79/';
                case 15:
                    return 'https://www.linkedin.com/in/sarahmthomp/';
                case 16:
                    return 'https://www.linkedin.com/in/jamesmorganwhite/';
                case 17:
                    return 'https://www.linkedin.com/in/laura-martinez-18533693/';
                case 18:
                    return 'https://www.linkedin.com/in/danielleeuk/';
                case 19:
                    return 'https://www.linkedin.com/in/peterbjohnson/';
                case 20:
                    return 'https://www.linkedin.com/in/lisa-williams-icnbs/';
                case 21:
                    return 'https://www.linkedin.com/in/thomasdavidjohnson/';
                case 22:
                    return 'https://www.linkedin.com/in/marie-williams-ba76b0214/';
                case 23:
                    return 'https://www.linkedin.com/in/jasminecturner/';
                case 24:
                    return 'https://www.linkedin.com/in/kevin-chen-998913112/';
                case 25:
                    return 'https://www.linkedin.com/in/ashley-martin2/';
                case 26:
                    return 'https://www.linkedin.com/in/asmith7663/';
                case 27:
                    return 'https://www.linkedin.com/in/rachel-faye-adams/';
                case 28:
                    return 'https://www.linkedin.com/in/noah-evans-4a3aa6236/';
                case 29:
                    return 'https://www.linkedin.com/in/michelle-clark-1b372431/';
                case 30:
                    return 'https://www.linkedin.com/in/lucaswmorgan/';
                case 31:
                    return 'https://www.linkedin.com/in/katherine-ross-646a21192/';
                case 32:
                    return 'https://www.linkedin.com/in/benjaminjohnson01/';
                case 33:
                    return 'https://www.linkedin.com/in/olivia-m-miller/';
                case 34:
                    return 'https://www.linkedin.com/in/ethan-wilson-596991214/';
                case 35:
                    return 'https://www.linkedin.com/in/rebeccaturner111/';
                case 36:
                    return 'https://www.linkedin.com/in/martin-lee-b8287752/';
                case 37:
                    return 'https://www.linkedin.com/in/djackso/';
                case 38:
                    return 'https://www.linkedin.com/in/samantha-lee-35a169b6/';
                case 39:
                    return 'https://www.linkedin.com/in/allisonwgrant/';
                case 40:
                    return 'https://www.linkedin.com/in/charleskim7/';
                default:
                    return ''; // Valore di default nel caso in cui personid non corrisponda a nessun caso
            }
        }*/
    },
    
}

</script>