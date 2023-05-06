<script setup lang="ts">
import { makeCall } from '@/utils/common'
import ProjectFilter from '@/components/ProjectFilter.vue'
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <header>
        <img src="@/assets/logo.png" width="50">
    </header>
    <main>
        <h1>Projects</h1>

        <ProjectFilter @applyFilters="filterProjects" />

        <ProjectCard v-for="project in  projects " :projectid="project.projectid" :title="project.title"
            :preview="project.preview" :stage="project.stage" :areas="project.areas" />
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

            // this will contain all the projects, used to reset the filters
            allProjects: [
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
        ProjectFilter,
        ProjectCard
    },

    created() {
        this.getData()
    },

    methods: {
        filterProjects: function (filters: { areas: number[]; stages: string[]; supervisors: number[]; years: number[]; }) {
            let areas = filters.areas
            let stages = filters.stages
            let supervisors = filters.supervisors
            let years = filters.years

            console.log("SELECTED FILTERS:")
            console.log(areas)
            console.log(stages)
            console.log(supervisors)
            console.log(years)

            let filteredProjects = []
            this.allProjects.forEach(project => {
                // get all the ids of the areas of the project
                let projectAreas = project.areas.map(area => area.areaid)

                // apply the filters
                let areaFilter = areas.length === 0 || areas.some(area => projectAreas.includes(area))
                let stageFilter = stages.length === 0 || stages.includes(project.stage)
                let supervisorFilter = supervisors.length === 0 || supervisors.includes(project.supervisor)
                let yearFilter = years.length === 0 || years.includes(project.year)

                console.log(years.includes(project.year))
                console.log(typeof (years[0]) + " " + typeof (project.year))
                console.log("FILTER RESULTS: " + areaFilter + " " + stageFilter + " " + supervisorFilter + " " + yearFilter + "")

                // if all the filters are passed, add the project to the filtered projects
                if (areaFilter && stageFilter && supervisorFilter && yearFilter) {
                    filteredProjects.push(project)
                }
            })

            this.projects = filteredProjects
        },

        getData: function () {
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getProjects",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);

                            console.log(data)

                            // itintially all the projects are shown, so we save them in both arrays
                            this.allProjects = data
                            this.projects = data
                        } else {
                            alert("Error, couldn't retrieve data");
                        }
                    }
                }
            )
        },
    }
};
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