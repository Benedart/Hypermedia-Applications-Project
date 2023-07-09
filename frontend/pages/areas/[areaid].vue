<script lang="js" setup>
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <div class="container">

        <!-- Head section for SEO -->

        <Head>
            <Title>{{ areaDetails.Title }} - HyperMeow</Title>
            <Meta name="description" :content="areaDetails.Section1" />
        </Head>

        <nav aria-label="breadcrumb" class="breadcrump">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <NuxtLink to="/areas">Areas</NuxtLink>
                </li>
            </ol>
        </nav>

        <!-- Section 1: Area details -->
        <div class="section-1">
            <div class="area-section">
                <!-- Area title -->
                <h1 class="name-area">{{ areaDetails.Title }}</h1>
                <!-- Area description -->
                <p class="custom-paragraph-1">{{ areaDetails.Section1 }}</p>
            </div>

            <!-- Area logo -->
            <img class="image-area-1 " :src="`/images/areas/${areaDetails.Title}/logo.jpg`" :alt="`${areaDetails.Title} logo`">

        </div>

        <!-- Section 2: Area image and additional information -->
        <div class="section-2">
            <!-- Area image -->
            <img class="image-area-2 " :src="`/images/areas/${areaDetails.Title}/image.webp`" :alt="`${areaDetails.Title} stock image`">
            <!-- Additional information about the area -->
            <p class="custom-paragraph-2">{{ areaDetails.Section2 }}</p>
        </div>

        <!-- Projects in this area -->
        <div class="custom-div" v-if="projects.length > 0">
            <span class="row custom-color justify-content-center" style="padding:2%;">
                <!-- Section title -->
                <h3 class="h3" style="margin-left : 10px; margin-top: 2px; padding:2%; float:left;">PROJECTS IN THIS AREA
                </h3>
                <div class="row g-3 justify-content-center">
                    <div v-for="project in projects" class="col-12 col-md-6 col-lg-4">
                        <!-- Render project card component for each project -->
                        <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                            :stage="project.stage" :areas="project.areas" :year="project.year"
                            :featured="project.featured" />
                    </div>
                </div>
            </span>
        </div>
        <div v-else class="d-flex justify-content-center">
            <div class="spinner-border m-5" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </div>
</template>


<script lang="js">
import { makeCall } from '@/utils/common'

export default {
    data() {
        return {
            areaDetails: {
                AreaID: -1,
                Title: 'area',
                Section1: 'If you\'re seeing this content, there was an error while fetching data. Contact us at teamHyperMeow@gmail.com to let us know, thanks!',
            },

            projects: [],
        }
    },

    components: {
        ProjectCard
    },

    created() {
        this.areaDetails.AreaID = this.$route.params.areaid
        this.getAreaData(this.areaDetails.AreaID)
    },

    methods: {
        getAreaData: async function (areaid) {
            // get area details
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getArea/" + areaid, 'GET');
               // console.log(data);
                this.areaDetails = data
            } catch (error) {
                console.error("Error, couldn't retrieve area details");
                console.error(error);
            }

            // get all projects which refer an area
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getProjectsFromArea/" + areaid, 'GET');
               // console.log(data);
                this.projects = data
            } catch (error) {
                console.error("Error, couldn't retrieve projects");
                console.error(error);
            }
        }
    }
}
</script>

<style scoped>
.breadcrump {
    margin-top: 4rem;
}

.name-area {
    color: #000022;
    margin: auto;
    font-size: 40px;
    margin-bottom: 1rem;
    justify-content: center;
}

.section-1 {
    display: flex;
}

.area-section{
    flex-grow: 1; 
    padding-right: 2rem;
}

.custom-paragraph-1 {
    width: auto;
    justify-content: center;
    text-align: justify;


}

.image-area-1 {
    border-radius: 5%;
    flex-grow: 1;
    margin: auto;

    width: -webkit-fill-available;
    max-width: 20rem;
}

.image-area-2 {
    border-radius: 5%;
    flex-grow: 1;
    width: -webkit-fill-available;
    max-width: 25rem;
    margin: auto;
}

.custom-paragraph-2 {
    width: auto;
    flex-grow: 1;
    justify-content: right;
    text-align: right;
    padding: 3rem 0 3rem 3rem;
}

.section-2 {
    display: flex;
    margin-top: 2rem;
    text-align: justify;
    font-size: 1em;

}

.custom-color {
    background-color: #e5e5e5;
}

@media screen and (max-width: 1000px) {
    .section-1 {
        flex-direction: column;
    }

    .area-section{
        padding: 0!important;
    }

    .custom-paragraph-1{
        margin:1rem;
    }

    .section-2 {
        flex-direction: column;
        text-align: justify;
        font-size: 1em;

    }

    .custom-paragraph-2{
        margin: 1rem;
        text-align: justify;
        padding: 0!important;
        order:1;
    }

    .image-area-2{
        order:2;
    }
}

.custom-div{
    padding-block: 5%;
    width: auto;
    margin: 40px 1rem 0 1rem;
}

.h3 {
    margin-top: 110px;
    margin-left: -30px;
    font-size: 20px;
    color: #000022;
    text-align: left;
}
</style>