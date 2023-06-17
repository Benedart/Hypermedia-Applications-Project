<script setup lang="js">
import { makeCall } from '@/utils/common'
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <main>
        <div class="title">Featured projects</div>
        <div class="container-fluid">
            <div class="row g-3">
                <div v-for="project in projects" class="col">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :areas="project.areas" :year="project.year" :featured="project.featured" />
                </div>
            </div>
        </div>
    </main>
</template>

<script lang="js">
export default {
    data() {
        return {
            // this will contain only the projects that match the filters
            projects: [
                {
                    projectid: -1,
                    title: 'project',
                    preview: 'Questo progetto è bellissimo, davvero il futuro',
                    stage: 'stage'
                },
            ],
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
                alert("Error, couldn't retrieve project details");
                console.error(error);
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
    margin-top: 8em;
}
</style>