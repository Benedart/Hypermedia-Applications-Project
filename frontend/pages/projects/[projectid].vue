<template>
    <div class="container">

        <Head>
            <!-- Page title and meta description -->
            <Title>{{ projectDetails.title }} - HyperMeow</Title>
            <Meta name="description" :content="projectDetails.section1" />
        </Head>

        <nav aria-label="breadcrumb" class="breadcrump">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <NuxtLink to="/projects">Projects</NuxtLink>
                </li>
            </ol>
        </nav>

        <div>
            <!-- Project title -->
            <h1 class="name-project">{{ projectDetails.title }}
                <span v-if="projectDetails.featured">
                    - Featured
                </span>
            </h1>
        </div>
        <div>
            <!-- Iterate over project areas -->
            <i v-for="(area, index) in projectDetails.areas">
                <!-- Link to area page -->
                <NuxtLink class="area-link" :to="`/areas/${area.areaid}`">
                    <span class="area-title">{{ area.title }} </span>
                </NuxtLink>
                <span v-if="index < projectDetails.areas.length - 1"> - </span>
            </i>

            <!-- <p><b>Budget:</b> {{ projectDetails.budget }}$</p>
            <p><b>Stage:</b> {{ projectDetails.stage }}</p> -->

            <div class="section-1">
                <!-- Project description section -->
                <p class="custom-paragraph-1">{{ projectDetails.section1 }}</p>
                <span class="supervisor-span">
                    <!-- Supervisor image -->
                    <img class="image-person " :src="`/images/People/${projectDetails.supervisor}.webp`"
                        :alt="`Portrait of the supervisor ${projectDetails.name} ${projectDetails.surname}`">
                    <!-- Supervisor information -->
                    <div class="supervisor-p">
                        <b style="font-size: 20px; margin-left:0.7em; color:#000022">Supervisor: </b>
                        <!-- Link to supervisor page -->
                        <NuxtLink class="supervisor-link" :to="`/people/${projectDetails.supervisor}`">
                            {{ projectDetails.name + " " + projectDetails.surname }}
                        </NuxtLink>
                        <p style="margin: 1rem; text-align: justify!important;">{{ projectDetails.CV }}</p>
                    </div>
                </span>
            </div>

            <div class="section-1">
                <!-- Project logo -->
                <img class="image-project " :src="`/images/projects/${projectDetails.title}/logo.webp`"
                    :alt="`${projectDetails.title} logo`">
                <!-- Second section description -->
                <p class="custom-paragraph-2">{{ projectDetails.section2 }}</p>
            </div>
            <div class="section-3">
                <!-- Third section description -->
                <p class="custom-paragraph-3">{{ projectDetails.section3 }} </p>
                <!-- Image associated with the project -->
                <img class="image" :src="`/images/projects/${projectDetails.title}/image.webp`" alt="">
            </div>
        </div>
    </div>
</template>

<script lang="js">
import { makeCall } from '@/utils/common'

export default {
    data() {
        return {
            projectDetails: {
                projectid: -1,
                section1: 'If you\'re seeing this content, there was an error while fetching data. Contact us at teamHyperMeow@gmail.com to let us know, thanks!',
                supervisor: -1,
                name: 'Name',
                surname: 'Surname',
                budget: '1000',
                stage: 'stage',
                year: 1900,
                title: "example",
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
        getProjectData: async function (projectid) {
           // console.log(this.$route.params)

            // get project details
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getProject/" + projectid, 'GET');
                //console.log(data);
                this.projectDetails = data
               // console.log(data)
               // console.log(this.projectDetails.supervisor)
            } catch (error) {
                console.error("Error, couldn't retrieve project details");
                console.error(error);
            }
        },
    },
}
</script>

<style scoped>
.breadcrump {
    margin-top: 4rem;
}

.name-project {
    color: #000022;
    margin: auto;
    font-size: 40px;
    margin-bottom: 1rem;
}

.area-link {
    position: relative;
    display: inline-block;
}

.area-link .area-title {
    color: var(--color-oxford-blue);
    padding: 0.2rem;
}

.area-link .area-title:hover::after {
    content: "";
    position: absolute;
    bottom: 0.3rem;
    left: 0.3rem;
    width: 90%;
    height: 25%;
    background-color: var(--color-cerulean);
    /* Colore di sfondo per l'evidenziazione */
    opacity: 0.3;
}

.section-1 {
    display: flex;
    margin-top: 2rem;
    text-align: justify;
    font-size: 1em;

}

@media screen and (max-width: 1000px) {
    .section-1 {
        flex-direction: column;
        text-align: justify;
        font-size: 1em;
        margin-top: 0;
    }

    .section-1 .custom-paragraph-1 {
        width: auto;
        justify-content: center;
        text-align: justify;
        border-right: 0;
        padding: 0 0 3rem 0;
        border-bottom: 1px solid var(--color-cerulean);
        margin: 1rem!important;

    }

    .custom-paragraph-2{
        text-align: justify!important;
        padding: 0 0 3rem 0!important;
        order: 1;
        margin: 1rem!important;

    }

    .image-project{
        order: 2;
    }

    .custom-paragraph-3{
        padding: 0!important;
        /*margin-bottom: 0!important;*/
        margin: 1rem!important;

    }
}



.section-3 {
    display: flex;
    flex-direction: column;
    margin-top: 3rem;
    text-align: justify;
    font-size: 1em;
}

.custom-paragraph-1 {
    width: auto;
    flex-grow: 1;
    border-right: 1px solid var(--color-cerulean);
    padding-right: 2rem;
    padding: 3rem 3rem 3rem 0;
    margin-bottom: 0;
    text-align: justify;
    font-size: 1em;

}

.custom-paragraph-2 {
    width: auto;
    flex-grow: 1;
    justify-content: right;
    text-align: right;
    padding: 3rem 0 3rem 3rem;
    margin-bottom: 0;

}

.custom-paragraph-3 {

    flex-grow: 1;
    text-align: justify;
    padding: 0;


}



.supervisor-span {
    display: flex;
    width: auto;
    flex-grow: 1;
    padding: 2rem 0 2rem 2rem;

}

@media screen and (max-width: 550px) {
    .supervisor-span {
        flex-direction: column;
        text-align: justify;
        font-size: 1em;
        padding-left: 0!important;
        padding-bottom: 0!important;
    }

    .supervisor-span .image-person{
        margin-top: auto;
        margin-left: auto;
    }

    .supervisor-p{
        text-align: center;
        margin-left: 0!important;
        width: auto!important;
    }
    
}

.supervisor-p {
    width: 24rem;
    margin-left: 2em;
    align-items: center;
    justify-content: center;
    margin-bottom: auto;
    margin-top: auto;
}

.supervisor-link {
    color: var(--color-oxford-blue);
    font-size: 20px;

}

.supervisor-link:hover::after {
    content: "";
    position: absolute;
    bottom: 0.1em;
    left: 0.05em;
    width: 100%;
    height: 70%;
    background-color: var(--color-cerulean);
    /* Colore di sfondo per l'evidenziazione */
    opacity: 0.3;
}

.image-person {
    border-radius: 100%;
    width: 170px;
    margin: auto;
}

.image-project {
    border-radius: 5%;
    flex-grow: 1;

    width: -webkit-fill-available;
    max-width: 20rem;
    margin: auto;
    object-fit: cover;
}

.image-project-2 {
    border-radius: 10%;
    flex-grow: 1;
    align-self: center;
    margin: auto;
    object-fit: cover;
}

.image-container {
    flex-grow: 1;
    position: relative;
    /* Imposta la posizione relativa per consentire il posizionamento assoluto dell'immagine */
    height: 50vh;
    /* Imposta l'altezza desiderata per visualizzare solo la metà superiore */
    overflow: hidden;
    border-top-right-radius: 5%;
    border-top-left-radius: 5%;
    margin-top: 3em;
    margin-bottom: 5em;

}

.image {
    position: relative;
    margin-top: 3em !important;
    margin-bottom: 5em !important;
    max-width: 700px;
    height: auto;
    margin: auto;
    width: -webkit-fill-available;
    border-top-right-radius: 5%;
    border-top-left-radius: 5%;
    border-bottom-right-radius: 5%;
    border-bottom-left-radius: 5%;
}

/*
@media(max-width: 800px) {
    .image {
        position: relative;
        margin-top: 3em !important;
        margin-bottom: 5em !important;
        max-width: 70%;
        height: auto;
        margin: auto;
        width: 500px;
        height: 275px;
        border-top-right-radius: 5%;
        border-top-left-radius: 5%;
        border-bottom-right-radius: 5%;
        border-bottom-left-radius: 5%;
    }
}
*/



.image-container img {
    position: absolute;
    /* Imposta la posizione assoluta per consentire il posizionamento all'interno del contenitore */
    top: -60%;
    width: 100%;
    /* Imposta la larghezza al 100% per coprire l'intera larghezza del contenitore */
    height: auto;
}
</style>