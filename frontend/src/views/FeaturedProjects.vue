<script setup lang="ts">
import { makeCall } from '@/utils/common'
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <main>
        <h1>Featured projects</h1>
        <div class="container-fluid">
            <div class="row g-3">
                <div v-for="project in projects" class="col">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :areas="project.areas" :year="project.year" />
                </div>
            </div>
        </div>
    </main>
</template>

<script lang="ts">
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
        getData: function () {
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getFeaturedProjects",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);

                            console.log(data)

                            this.projects = data
                        } else {
                            alert("Error, couldn't retrieve data");
                        }
                    }
                }
            )
        },
    },
}
</script>

<style>
.card {
    cursor: pointer;
}

.card:hover {
    filter: brightness(80%);
    transition: 0.5s;
}
</style>