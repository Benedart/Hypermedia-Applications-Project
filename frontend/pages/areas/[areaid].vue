<script lang="js" setup>
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <div class="container">

        <Head>
            <Title>{{ areaDetails.Title }} - HyperMeow</Title>
            <Meta name="description" :content="areaDetails.Section1" />
        </Head>

        <div class="section-1">
            <div style="flex-grow: 1; padding-right: 2rem;">
                <h1 class="name-area">{{ areaDetails.Title }}</h1>
                <p class="custom-paragraph-1">{{ areaDetails.Section1 }}</p>
            </div>

            <img class="image-area-1 " :src="`/images/areas/${areaDetails.Title}/logo.jpg`">

        </div>

        <div class="section-2">
            <img class="image-area-2 " :src="`/images/areas/${areaDetails.Title}/image.webp`">
            <p class="custom-paragraph-2">{{ areaDetails.Section2 }}</p>
        </div>

        <!--div class="row g-3">
                <div v-for="project in projects" class="col-12 col-md-6 col-lg-4">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :year="project.year" :featured="project.featured" />
                </div>
            </div-->

        <div class="row" style="margin-top: 40px; margin-left: -60px; padding-block: 5%;" v-if="projects.length > 0">
            <span class="row mx-3 custom-color justify-content-center" style="padding:2%;">
                <h3 class="h3" style="margin-left : 10px; margin-top: 2px; padding:2%; float:left;">Projects in this area
                </h3>
                <div class="row g-3">
                    <div v-for="project in projects" class="col-12 col-md-6 col-lg-4">
                        <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                            :stage="project.stage" :areas="project.areas" :year="project.year"
                            :featured="project.featured" />
                    </div>
                </div>
            </span>
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
                Description: 'description',
            },

            projects: [
                {
                    projectid: -1,
                    title: 'example',
                    preview: 'Questo progetto è bellissimo, davvero il futuro',
                    stage: 'stage',
                    areas: [
                        {
                            areaid: -1,
                            title: 'area'
                        }
                    ],
                    year: 2020,
                }
            ],
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
                console.log(data);
                this.areaDetails = data
            } catch (error) {
                alert("Error, couldn't retrieve area details");
                console.error(error);
            }

            // get all projects which refer an area
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getProjectsFromArea/" + areaid, 'GET');
                console.log(data);
                this.projects = data
            } catch (error) {
                alert("Error, couldn't retrieve projects");
                console.error(error);
            }
        }
    }
}
</script>

<style scoped>
.name-area {
    color: #000022;
    margin: auto;
    font-size: 40px;
    margin-bottom: 1rem;
    justify-content: center;


}

.section-1 {
    display: flex;
    margin-top: 88px;

}

.custom-paragraph-1 {
    width: auto;
    justify-content: center;


}

.image-area-1 {
    border-radius: 5%;
    flex-grow: 1;
    margin: auto;

    width: 20rem;
}

.image-area-2 {
    border-radius: 5%;
    flex-grow: 1;
    width: 25rem;
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

    .section-2 {
        flex-direction: column;
        text-align: justify;
        font-size: 1em;

    }


}

.h3 {
    margin-top: 110px;
    margin-left: -30px;
    font-size: 20px;
    color: #000022;
    text-align: left;
}
</style>