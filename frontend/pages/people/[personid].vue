<script lang="js" setup>
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <div class="container" style="background-color: snow;">

        <!-- Head section for SEO -->

        <Head>
            <Title>{{ personDetails.personid }} - HyperMeow</Title>
            <Meta name="description" :content="personDetails.Section1" />
        </Head>

        <!-- bredcrump over the image -->
        <nav aria-label="breadcrumb" class="breadcrump">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <NuxtLink to="/people">People</NuxtLink>
                </li>
            </ol>
        </nav>

        <!-- Section 1: Person details -->
        <div class="row align-items-center justify-content-center">
            <div class="col-md-5 justify-content-center" style="background-color: snow;">
                <!-- Person Image -->
                <img class="image-person align-items-center justify-content-center"
                    :src="`/images/People/${personDetails.personid}.webp`" :alt="personDetails.personid">
            </div>
            <div class="col-md-7">
                <!-- Person Name -->
                <h3 class="name-person">{{ personDetails.name + " " + personDetails.surname }}</h3>
                <i>
                    <!-- Person Role -->
                    <h3 class="role">{{ personDetails.role }}</h3>
                </i>
                <hr>
                <!-- Person Description -->
                <p class="description">{{ personDetails.Description }}</p>
                <br>
                <h3 class="formation">FORMATION</h3>
                <!-- Person CV -->
                <p style="margin-bottom: 15px; color:#000022;">{{ personDetails.CV }}</p>
                <hr>
                <div style="margin-top: 20px; color:#000022;">
                    <!-- Email Icon -->
                    <a :href="`mailto:${personDetails.email}`"><img class="card-img-top img-custom"
                            src="/images/contact/email.webp" alt="Email Icon" style="width: 30px; height: auto;"></a>
                    <!-- LinkedIn Icon -->
                    <a :href="personDetails.linkedin" style="margin-left: 20px;"><img class="card-img-top img-custom"
                            src="/images/contact/linkedin.webp" alt="LinkedIn Icon" style="width: 30px; height: auto; "></a>
                </div>
            </div>
            <!-- Section 2: Projects supervised -->
            <div class="row" style="margin-top: 40px; margin-left: -60px; padding-block: 5%;"
                v-if="projectsSupervised.length > 0">
                <span class="row mx-3 custom-color justify-content-center" style="padding:2%;">
                    <!-- Title for Projects Supervised -->
                    <h3 class="h3" style="margin-left : 10px; margin-top: 2px; padding:2%; float:left;">PROJECTS SUPERVISED
                    </h3>
                    <div class="row">
                        <!-- Display Project Cards -->
                        <div v-for="project in projectsSupervised" class="col-12 col-sm-7 col-md-6 col-lg-5"
                            style="padding:5%;">
                            <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                                :stage="project.stage" :areas="project.areas" :year="project.year"
                                :featured="project.featured" />
                        </div>
                    </div>
                </span>
            </div>
            <!--Loading section of the page-->
            <div v-else class="d-flex justify-content-center">
                <div class="spinner-border m-5" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="js">
import { makeCall } from '@/utils/common'

export default {
    data() {
        return {
            // Data for person details
            personDetails: {
                personid: -1, //id
                name: 'Name', //name
                surname: 'Surname', //surname
                age: '0', //age
                email: 'name.surname@gmail.com', //email
                linkedin: 'https://www.linkedin.com/feed/', //linkedin personal feed
                CV: 'If you\'re seeing this content, there was an error while fetching data. Contact us at teamHyperMeow@gmail.com to let us know, thanks!', // Academic background
                Description: 'If you\'re seeing this content, there was an error while fetching data. Contact us at teamHyperMeow@gmail.com to let us know, thanks!', // Description of the person
                role: 'role', // Job role
            },

            // Data for projects supervised
            projectsSupervised: [],
        }
    },

    components: {
        // Component for ProjectCard
        ProjectCard
    },

    created() {
        this.personDetails.personid = this.$route.params.personid;
        this.getPersonData(this.personDetails.personid);
    },

    methods: {
        // Method to fetch person details and update the personDetails object
        getPersonData: async function (personid) {
           // console.log(this.$route.params);
            // Get person details
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getPerson/" + personid, 'GET');
               // console.log(data);
                this.personDetails = data;
            } catch (error) {
                console.error("Error, couldn't retrieve person details");
                console.error(error);
            }

            // Get projects supervised
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getProjectsSupervisedFromPerson/" + personid, 'GET');
               // console.log(data);
                this.projectsSupervised = data;
            } catch (error) {
                console.error("Error, couldn't retrieve projects supervised");
                console.error(error);
            }
        },
    },
}

</script>


<style scoped>
.breadcrump {
    margin-top: 6rem;
}

/* Styles for person's name */
.name-person {
    
    color: #000022;
    /* Text color */
    margin: auto;
    /* Top margin */
    font-size: 40px;
    /* Font size */
    margin-bottom: 0.2em;
}

/* Styles for formation part*/
.formation {
    
    font-size: 18px;
    /* Font size */
    color: #000022;
    /* Text color */
}

 /* Styles for heading */
.h3 {
   
    margin-top: 110px;
    /* Top margin */
    margin-left: -30px;
    /* Left margin */
    font-size: 20px;
    /* Font size */
    color: #000022;
    /* Text color */
    text-align: left;
    /* Text alignment */
}

/*Style for the image of the person*/
.image-person {
    border-radius: 1rem;
    /* Border radius */
    width: 90%;
    /* Width of the image */
}

/* Responsive styles for person's image on smaller screens */
@media (max-width: 768px) {
    .image-person {
        float: none;
        /* Remove float */
        clear: both;
        /* Clear float */
        display: block;
        /* Display as block */
        margin: 3em auto;
        margin-top:1em;
        /* Margin for centering */
        max-width: 70%;
        /* Maximum width of the image */
        
        
    }

    .role{
        text-align:center;
    }

    .name-person{
        text-align:center;
    }
}


/* Styles for background color of project cards*/
.custom-color {
    
    background-color: #e5e5e5;
    /* Background color */
}

/*Style of the formation of the person*/
.formation{
    text-align:justify;
}

/*Style of the description of the person*/
.description{
    color:#000022;
    text-align:justify;
}

/*Style of the role of the person*/
.role{
    margin-bottom: 15px; 
    color: #000022; 
    font-size: 18px;
}
</style>
