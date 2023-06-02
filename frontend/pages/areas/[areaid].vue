<script lang="ts" setup>
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <div class="container">
        <div>
            <h1 class="h1">{{ areaDetails.Title }}</h1>
        </div>
        <div>
            <p>{{ areaDetails.Section1 }}</p>
            <p>{{ areaDetails.Section2 }}</p>
            <hr>
            <h3 class="h3">Projects:</h3>
            <div class="row g-3">
                <div v-for="project in projects" class="col-12 col-md-6 col-lg-4">
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
            areaDetails: {
                AreaID: -1,
                Title: 'title',
                Description: 'description',
            },

            projects: [
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
        this.areaDetails.AreaID = this.$route.params.areaid
        this.getAreaData(this.areaDetails.AreaID)
    },

    methods: {
        getAreaData: async function (areaid: number) {
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