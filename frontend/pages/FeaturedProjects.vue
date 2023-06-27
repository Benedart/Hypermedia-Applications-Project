<script setup lang="js">
import { makeCall } from '@/utils/common'
import ProjectCard from '@/components/ProjectCard.vue'

// Set SEO metadata for the page
useSeoMeta({
    title: 'Featured Projects - HyperMeow',
    description: 'HyperMeow featured projects page, where you can find all the projects that are featured on the website. Featured projects are the ones that are considered the most important and interesting by the HyperMeow team.',
    keywords: 'HyperMeow, featured projects, projects, featured, important, interesting, HyperMeow projects, HyperMeow featured projects, HyperMeow featured projects page, HyperMeow featured projects list',
})
</script>

<template>
    <main>
        <!-- Page title -->
        <div class="title">Featured projects</div>
        <div class="container-fluid">
            <div v-if="projects.length > 0" class="row g-3">
                <!-- Loop over projects and render ProjectCard component for each project -->
                <div v-for="project in projects" class="col">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :areas="project.areas" :year="project.year" :featured="project.featured" />
                </div>
            </div>
            <div v-else-if="!queryError" class="d-flex justify-content-center">
                <div class="spinner-border m-5" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
            <div v-else class="container-text-center">
                <div class="error">There was an error while fetching data</div>
                <div class="error-subtitle">Contact the website owner at teamHyperMeow@gmail.com</div>
                <div class="icon"><i class="bi bi-emoji-frown"></i></div>
            </div>
        </div>
    </main>
</template>

<script lang="js">
export default {
    data() {
        return {
            // this will contain only the projects that match the filters
            projects: [],
            queryError: false,
        }
    },

    components: {
        ProjectCard
    },

    created() {
        this.getData()
    },

    methods: {
        getData: async function () {
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getFeaturedProjects", 'GET');
                console.log(data);
                this.projects = data
            } catch (error) {
                console.error("Error, couldn't retrieve project details");
                console.error(error);
                this.queryError = true;
            }
        },
    },
}
</script>

<style scoped>
.title {
    text-align: center;
}

.container-fluid {
    margin-bottom: 10em;
    margin-top: 5em;
}
</style>