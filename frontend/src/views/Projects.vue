<script setup lang="ts">
import { makeCall } from '@/utils/common'
import ProjectFilter from '@/components/ProjectFilter.vue'
import ProjectCard from '@/components/ProjectCard.vue'
</script>

<template>
    <main>
        <h1>Projects</h1>
        <div class="container-fluid">
            <div class="search-wrapper panel-heading col-sm-12">
                <input type="text" v-model="search" placeholder="Search">
            </div>
            <br>
            <ProjectFilter @applyFilters="filterProjects" />
            <br>

            <div v-if="!search" class="accordion" id="accordionPanelsStayOpen">
                <div v-for="area in areas" class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                            :data-bs-target="`#panelsStayOpen-${area.areaid}`" aria-expanded="true"
                            :aria-controls="`panelsStayOpen-${area.areaid}`">
                            <b>{{ area.title }}</b>
                        </button>
                    </h2>
                    <div :id="`panelsStayOpen-${area.areaid}`" class="accordion-collapse collapse show">
                        <div class="accordion-body">
                            <div class="row g-3">
                                <div v-for="project in projectsByArea(area.areaid)" class="col-12 col-md-6 col-lg-4">
                                    <router-link :to="`/project/${project.projectid}`">
                                        <ProjectCard :projectid="project.projectid" :title="project.title"
                                            :preview="project.preview" :stage="project.stage" :areas="project.areas"
                                            :year="project.year" :featured="project.featured" />
                                    </router-link>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div v-else class="row g-3">
                <div v-for="project in visibleProjects" class="col">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :areas="project.areas" :year="project.year" :featured="project.featured" />
                </div>
            </div>

            <!-- First prototype -->
            <!--
            <div v-if="!search" v-for="area in areas" class="row g-3">
                <h2>{{ area.title }}</h2>
                <div v-for="project in projectsByArea(area.areaid)" class="col-12 col-md-6 col-lg-4">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :areas="project.areas" :year="project.year" :featured="project.featured" />
                </div>
            </div>
            <div v-else class="row g-3">
                <div v-for="project in visibleProjects" class="col">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :areas="project.areas" :year="project.year" :featured="project.featured" />
                </div>
            </div>
            -->
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
                    stage: 'stage',
                    areas: [
                        {
                            areaid: -1,
                            title: 'area'
                        }
                    ],
                    year: 2020,
                },
            ],

            // this will contain all the projects, used to reset the filters
            allProjects: [
                {
                    projectid: -1,
                    title: 'project',
                    preview: 'Questo progetto è bellissimo, davvero il futuro',
                    stage: 'stage',
                    areas: [
                        {
                            areaid: -1,
                            title: 'area'
                        }
                    ],
                    year: 2020,
                },
            ],

            // this will contain the areas of the visible projects
            areas: [
                {
                    areaid: -1,
                    title: 'area'
                }
            ],

            search: ""
        }
    },

    components: {
        ProjectFilter,
        ProjectCard
    },

    created() {
        this.getData()
    },

    computed: {
        // returns the list of projects that match the search string
        visibleProjects: function () {
            let matchingProjects = this.allProjects.filter(p => {
                // get the indexes of the spaces in the project title
                let indexList = [0];
                for (let i = 0; i < p.title.length; i++) {
                    const character = p.title.charAt(i);
                    if (character == " ")
                        indexList.push(i + 1);
                }
                // check if the search string is a substring of the project title (case insensitive)
                return indexList.includes(p.title.toLowerCase().indexOf(this.search.toLowerCase()));
            });

            console.log("SEARCH RESULTS:")
            console.log(matchingProjects)

            return matchingProjects
        },
    },

    methods: {
        // filter the projects by area, stage and year
        filterProjects: function (filters: { areas: number[]; stages: string[]; years: number[]; }) {
            let areas = filters.areas
            let stages = filters.stages
            let years = filters.years

            console.log("SELECTED FILTERS:")
            console.log(areas)
            console.log(stages)
            console.log(years)

            let filteredProjects = []
            this.allProjects.forEach(project => {
                // get all the ids of the areas of the project
                let projectAreas = project.areas.map(area => area.areaid)

                // apply the filters
                let areaFilter = areas.length === 0 || areas.some(area => projectAreas.includes(area))
                let stageFilter = stages.length === 0 || stages.includes(project.stage)
                let yearFilter = years.length === 0 || years.includes(project.year)

                console.log(years.includes(project.year))
                console.log(typeof (years[0]) + " " + typeof (project.year))
                console.log("FILTER RESULTS: " + areaFilter + " " + stageFilter + " " + yearFilter)

                // if all the filters are passed, add the project to the filtered projects
                if (areaFilter && stageFilter && yearFilter) {
                    filteredProjects.push(project)
                }
            })

            // update the list of areas, removing the ones that are not in the filtered projects
            this.getAreas(filteredProjects)

            if (areas.length > 0)
                this.areas = this.areas.filter(area => areas.includes(area.areaid))

            // update the list of projects
            this.projects = filteredProjects
        },

        // returns the list of projects that belong to the area with the given id
        projectsByArea: function (areaid: number) {
            return this.projects.filter(p => p.areas.some(a => a.areaid === areaid))
        },

        // returns the list of distinct areas of the visible projects
        getAreas(projects: any[]) {
            let areas = []

            // for each project, add the areas that are not already in the list
            projects.forEach(project => {
                console.log(project)
                project.areas.forEach(area => {
                    if (!areas.some(a => a.areaid === area.areaid)) {
                        areas.push(area)
                    }
                })
            })

            console.log("VISIBLE AREAS:")
            console.log(areas)

            this.areas = areas
        },

        // get the data from the server
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
                            this.getAreas(this.allProjects)
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