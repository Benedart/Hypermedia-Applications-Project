<script setup lang="js">
import { makeCall } from '@/utils/common'
import ProjectFilter from '@/components/ProjectFilter.vue'
import ProjectCard from '@/components/ProjectCard.vue'

useSeoMeta({
    title: 'Projects - HyperMeow',
    description: 'Discover our diverse projects at HyperMeow. Revolutionizing techonology, healthcare, ecosustain, and more. Shape the future with us.',
    keywords: 'projects, hypermeow, hypermeow projects, hypermeow projects page, hypermeow projects list, hypermeow projects list page',
})
</script>

<template>
    <main>
        <div class="container-text-center">
            <div class="title">Projects</div>
        </div>

        <div class="container">
            <!--container of two grids, one for element to apply filters, one for the filters applied-->
            <div class="grid-container">
                <!--a grid containing searchbar and button to apply filters-->
                <div class="grid-filter">
                    <!--searchbar-->
                    <div class="search">
                        <div class="icon"></div>
                        <div class="input">
                            <input type="text" v-model="search" placeholder="Search projects..." id="mysearch">
                        </div>

                        <span class="clear" onclick="document.getElementById('mysearch').value = ''"></span>
                    </div>

                    <!--button component to filter all over the charateristics of the projects-->
                    <!--it will be disabled if the searchbar is not empty-->
                    <ProjectFilter ref="projectFilter" :disabled="search.length > 0" @applyFilters="filterProjects" />
                </div>

                <!--grid containing all the filters applied. empty if there are no filters applied-->
                <span v-if="!search" class="filter-grid">
                    <!--iteration showing the filters about the area title-->
                    <div v-for="filterArea in filterAreas">
                        <div class="filter-btn" @click="removeFilter(filterArea.AreaID)">
                            {{ filterArea.Title }}
                            <div class="icon"><i class="bi bi-x"></i></div>
                        </div>
                    </div>

                    <!--iteration showing the filters about the area year of foundation-->
                    <div v-for="filterYear in filterYears">
                        <div class="filter-btn" @click="removeFilter(filterYear)">
                            {{ filterYear }}
                            <div class="icon"><i class="bi bi-x"></i></div>
                        </div>
                    </div>

                    <!--iteration showing the filters about the area stage-->
                    <div v-for="filterStage in filterStages">
                        <div class="filter-btn" @click="removeFilter(filterStage)">
                            {{ filterStage }}
                            <div class="icon"><i class="bi bi-x"></i></div>
                        </div>
                    </div>
                </span>
            </div>

            <!--accordion containing all projects by area, showing the ones that match the filters-->
            <div v-if="!search" class="accordion" id="accordionPanelsStayOpen">
                <div v-for="area in areas" class="accordion-item" style="box-shadow:  0 0 10px rgba(0, 0, 34, 0.2);">
                    <h2 class="accordion-header">
                        <!--button that opens/closes the panel containing the projects by the area specified in the button-->
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                            :data-bs-target="`#panelsStayOpen-${area.areaid}`" aria-expanded="true"
                            :aria-controls="`panelsStayOpen-${area.areaid}`">
                            <NuxtLink :to="`/areas/${area.areaid}`" class="accordion-link-area">
                                <b>{{ area.title }}</b>
                            </NuxtLink>
                        </button>
                    </h2>
                    <!--content of the panel when it's open-->
                    <div :id="`panelsStayOpen-${area.areaid}`" class="accordion-collapse collapse show">
                        <div class="accordion-body">
                            <!--grid containing the projects-->
                            <div class="row g-3">
                                <div v-for="project in projectsByArea(area.areaid)" class="col-12 col-md-6 col-lg-4">
                                    <!-- Render ProjectCard component with props -->
                                    <ProjectCard :projectid="project.projectid" :title="project.title"
                                        :preview="project.preview" :stage="project.stage" :areas="project.areas"
                                        :year="project.year" :featured="project.featured" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--grid containing the project cards that match the searchbar value-->
            <div v-else class="row g-3">
                <div v-for="project in visibleProjects" class="col">

                    <!-- Render ProjectCard component with props -->
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :areas="project.areas" :year="project.year" :featured="project.featured" />
                </div>
            </div>

            <!-- if no projects are going to be shown (visibleProjects == 0 or areas empty), display a sad face -->
            <div v-if="(visibleProjects.length == 0 || areas.length == 0) && !queryError" class="container-text-center">
                <div class="error">No projects found</div>
                <div class="error-subtitle">Try to remove some filters</div>
                <div class="icon"><i class="bi bi-emoji-frown"></i></div>
            </div>
            <div v-else-if="queryError" class="container-text-center">
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

            // this will contain all the projects, used to reset the filters
            allProjects: [],

            // this will contain the areas of the visible projects
            areas: [],

            allAreas: [],

            search: "",

            //this will contain the areas to filter
            filterAreas: [],

            //this will contain the stages to filter
            filterStages: [],

            //this will contain the years to filter
            filterYears: [],

            queryError: false
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

            return matchingProjects
        },
    },

    methods: {
        // filter the projects by area, stage and year
        filterProjects: function (filters) {
            let areas = filters.areas
            let stages = filters.stages
            let years = filters.years

            let filteredAreas = []

            //insert the filters used to make them visible in the page
            this.allAreas.forEach(area => {
                if (areas.includes(area.AreaID)) {
                    filteredAreas.push(area)
                }
            })

            let filteredProjects = []
            this.allProjects.forEach(project => {
                // get all the ids of the areas of the project
                let projectAreas = project.areas.map(area => area.areaid)

                // apply the filters
                let areaFilter = areas.length === 0 || areas.some(area => projectAreas.includes(area))
                let stageFilter = stages.length === 0 || stages.includes(project.stage)
                let yearFilter = years.length === 0 || years.includes(project.year)


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

            //update the filters to show
            this.filterAreas = filteredAreas
            this.filterStages = stages
            this.filterYears = years

            console.log(this.filterAreas)
        },

        // trigger the removal of the selected filter on the projectFilter component
        removeFilter: function (filter) {
            this.$refs.projectFilter.removeFilter(filter)
        },

        // returns the list of projects that belong to the area with the given id
        projectsByArea: function (areaid) {
            return this.projects.filter(p => p.areas.some(a => a.areaid === areaid))
        },

        // returns the list of distinct areas of the visible projects
        getAreas: function (projects) {
            let areas = []

            // for each project, add the areas that are not already in the list
            projects.forEach(project => {
                //console.log(project)
                project.areas.forEach(area => {
                    if (!areas.some(a => a.areaid === area.areaid)) {
                        areas.push(area)
                    }
                })
            })

            this.areas = areas

            if (this.filterStages[0] == "stage") {
                this.filterAreas = [];
                this.filterYears = [];
                this.filterStages = [];
            }
        },

        // get the data from the server
        getData: async function () {
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getProjects", 'GET');
                //console.log(data);

                // itintially all the projects are shown, so we save them in both arrays
                this.allProjects = data
                this.projects = data
                this.getAreas(this.allProjects)
            } catch (error) {
                console.error("Error, couldn't retrieve project details");
                console.error(error);
                this.queryError = true;
            }

            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getAreas", 'GET');
                //console.log(data);

                this.allAreas = data
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
.container {
    margin-bottom: 10em;
}

.title {
    text-align: center;
    margin-bottom: 2rem;
}

.grid-container {
    display: flex;
    margin-bottom: 1rem;
}

.filter-grid {
    display: flex;
    padding: 1.25rem;
    flex-wrap: wrap;
    gap: 0.5rem;
}

@media screen and (max-width: 400px) {
    .filter-grid {
        flex-direction: column;
    }
}

.grid-filter {
    padding: 1rem;
    display: grid;
    gap: 1rem;

    grid-auto-flow: column;
    align-items: start;
}

@media screen and (max-width: 720px) {
    .grid-filter {
        grid-auto-flow: row;
    }
}

.search {
    float: inline-start;
    position: relative;
    width: 250px;
    height: 50px;
    background: var(--color-snow);
    border-radius: 50px;
    transition: 0.5s;
    box-shadow: 0 0 0 3px var(--color-oxford-blue);
    overflow: hidden;
}

.search .active {
    width: 250px;
}

.search .icon {
    position: absolute;
    top: 0;
    left: 0;
    width: 50px;
    height: 50px;
    background: var(--color-snow);
    border-radius: 50px;
    justify-content: center;
    align-items: center;
    display: flex;
    z-index: 1000;
    cursor: pointer;
}

.search .icon::before {
    content: '';
    position: absolute;
    width: 12px;
    height: 12px;
    border: 3px solid var(--color-cerulean);
    border-radius: 50%;
    transform: translate(-2.5px, -2.5px);
}

.search .icon::after {
    content: '';
    position: absolute;
    width: 2px;
    height: 10px;
    background: var(--color-cerulean);
    border-radius: 50%;
    transform: translate(5.5px, 5.5px) rotate(315deg);
}

.search .input {
    position: relative;
    width: 150px;
    height: 50px;
    left: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: var(--color-snow);
}

.search .input input {
    position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
    border: none;
    outline: none;
    font-size: 15px;
    padding: 8px 0;
    background: var(--color-snow);
}

.clear {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 12px;
    height: 12px;
    right: 12px;
    background: var(--color-snow);
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;

}

clear::before {
    position: absolute;
    content: '';
    width: 1px;
    height: 12px;
    background: var(--color-rose-quartz);
    transform: rotate(45deg);
}

clear::after {
    position: absolute;
    content: '';
    width: 1px;
    height: 12px;
    background: var(--color-rose-quartz);
    transform: rotate(315deg);
}

.filter-btn {
    text-align: center;
    display: flex;
    align-items: center;
    width: fit-content;
    padding-left: 1rem;
    height: 40px;
    background: var(--color-platinum);
    color: var(--color-cerulean);
    border-radius: 50px;
    transition: 0.5s;
    overflow: hidden;
    cursor: pointer;
    box-shadow: none;
    justify-content: center;

}

.filter-btn .icon {
    top: 0;
    left: 0;
    width: 30px;
    height: 30px;
    background: none;
    color: var(--color-cerulean);
    border-radius: 50px;
    z-index: 1000;
    cursor: pointer;
    display: inline-block;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
}

.filter-btn:hover {
    background: var(--color-oxford-blue);
    color: var(--color-snow);
}

.filter-btn:hover .icon {
    color: var(--color-snow);
}

.accordion {
    background-color: var(--color-snow);

    --bs-accordion-active-bg: var(--color-platinum);
    --bs-accordion-btn-focus-border-color: var(--color-platinum);
    --bs-accordion-border-color: var(--color-platinum);
    --bs-accordion-btn-bg: var(--color-snow);
    --bs-accordion-bg: var(--color-snow);

    box-shadow: 0 3rem 6rem rgba(0, 0, 34, 0.1);
}

.accordion-header {
    background-color: var(--color-snow);
}

.accordion-button {
    background-color: var(--color-snow);
}

.accordion-button::after {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23086788'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");

}

.accordion-button.collapsed::after {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23086788'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

.accordion-button:hover {
    background-color: var(--color-cerulean);
    color: var(--color-snow);
}

.accordion-button:hover .accordion-link-area {
    color: var(--color-snow);
}

.accordion-button:hover::after {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fffbfa'%3e%3cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

.accordion-button:focus {
    box-shadow: var(--color-cerulean);
}

.accordion-body {
    background-color: var(--color-platinum);
}

.accordion-button:not(.collapsed) {
    box-shadow: none;
}

/* Track */
::-webkit-scrollbar-track {
    border-radius: 10px;
    background: var(--color-snow);
    box-shadow: inset 0 0 5px var(--color-platinum);

}

/* Handle */
::-webkit-scrollbar-thumb {
    border-radius: 10px;
    background: var(--color-platinum);
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: var(--color-cerulean);
}
</style>