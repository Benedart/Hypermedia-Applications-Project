<script setup lang="ts">
import { makeCall } from '@/utils/common'
</script>

<template>
    <div>
        <div class="dropdown">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
                data-bs-auto-close="outside">
                Filter projects
            </button>
            <form class="dropdown-menu p-4">
                <div class="hstack gap-3">
                    <div class="filter-col bg-light border">
                        Area
                        <hr>
                        <div v-for="area in areas" class="form-check">
                            <input class="form-check-input" name="areaSelector" type="checkbox" :value="area.AreaID"
                                :id="`a-${area.AreaID}`">
                            <label class="form-check-label" :for="`a-${area.AreaID}`">
                                {{ area.Title }}
                            </label>
                        </div>
                    </div>
                    <div class="filter-col bg-light border">
                        Years
                        <hr>
                        <div v-for="year in years" class="form-check">
                            <input class="form-check-input" name="yearSelector" type="checkbox" :value="year" :id="year">
                            <label class="form-check-label" :for="year">
                                {{ year }}
                            </label>
                        </div>
                    </div>
                    <div class="filter-col bg-light border">
                        Stages
                        <hr>
                        <div v-for="stage in stages" class="form-check">
                            <input class="form-check-input" name="stageSelector" type="checkbox" :value="stage" :id="stage">
                            <label class="form-check-label" :for="stage">
                                {{ stage }}
                            </label>
                        </div>
                    </div>
                    <div class="filter-col bg-light border">
                        Supervisors
                        <hr>
                        <div v-for="supervisor in supervisors" class="form-check">
                            <input class="form-check-input" name="supervisorSelector" type="checkbox"
                                :value="supervisor.personid" :id="`s-${supervisor.personid}`">
                            <label class="form-check-label" :for="`s-${supervisor.personid}`">
                                {{ supervisor.name + " " + supervisor.surname }}
                            </label>
                        </div>
                    </div>
                    <!-- TODO: make this prettier and possibly manage the overlapping of the ranges -->
                    <div class="filter-col bg-light border">
                        Budget
                        <hr>
                        <label for="minBudget" class="form-label">Min</label>
                        <input type="range" class="form-range" :min="budget.min" :max="budget.max" step="10000"
                            id="minBudget" oninput="this.nextElementSibling.value = this.value">
                        <output>{{ budget.min }}</output>
                        <br>
                        <label for="maxBudget" class="form-label">Max</label>
                        <input type="range" class="form-range" :min="budget.min" :max="budget.max" step="10000"
                            :value="budget.max" id="maxBudget" oninput="this.nextElementSibling.value = this.value">
                        <output>{{ budget.max }}</output>
                    </div>
                </div>
                <hr>
                <button @click="applyFilters()" type="button" class="btn btn-primary">Apply</button>
                <button type="reset" class="btn btn-secondary">Clear all</button>
            </form>
        </div>
    </div>
</template>

<script lang="ts">
export default {
    data() {
        return {
            areas: [],
            years: [],
            stages: [],
            supervisors: [],
            budget: {
                min: 0,
                max: 5
            }
        }
    },

    created() {
        this.getFilters()
    },

    methods: {
        applyFilters: function () {
            let areaSelector = document.getElementsByName("areaSelector")
            let yearSelector = document.getElementsByName("yearSelector")
            let stageSelector = document.getElementsByName("stageSelector")
            let supervisorSelector = document.getElementsByName("supervisorSelector")
            let minBudget = document.getElementById("minBudget")
            let maxBudget = document.getElementById("maxBudget")

            let selectedAreas: number[] = []
            let selectedYears: number[] = []
            let selectedStages: string[] = []
            let selectedSupervisors: number[] = []

            for (let i = 0; i < areaSelector.length; i++) {
                if (areaSelector[i].checked) {
                    selectedAreas.push(parseInt(areaSelector[i].value))
                }
            }

            for (let i = 0; i < yearSelector.length; i++) {
                if (yearSelector[i].checked) {
                    selectedYears.push(parseInt(yearSelector[i].value))
                }
            }

            for (let i = 0; i < stageSelector.length; i++) {
                if (stageSelector[i].checked) {
                    selectedStages.push(stageSelector[i].value)
                }
            }

            for (let i = 0; i < supervisorSelector.length; i++) {
                if (supervisorSelector[i].checked) {
                    selectedSupervisors.push(parseInt(supervisorSelector[i].value))
                }
            }

            let filters = {
                areas: selectedAreas,
                years: selectedYears,
                stages: selectedStages,
                supervisors: selectedSupervisors,
                budget: {
                    min: minBudget.value,
                    max: maxBudget.value
                }
            }

            this.$emit("applyFilters", filters)
        },

        getFilters: function () {
            // get all the areas
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getAreas",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.areas = data
                        } else {
                            alert("Error, couldn't get the areas");
                        }
                    }
                }
            )

            // get all the years
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getYears",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.years = data.map((year: { yearoffoundation: number; }) => year.yearoffoundation)
                        } else {
                            alert("Error, couldn't get the years");
                        }
                    }
                }
            )

            // get all the stages
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getStages",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.stages = data.map((stage: { stage: string; }) => stage.stage)
                        } else {
                            alert("Error, couldn't get the stages");
                        }
                    }
                }
            )

            // get all the supervisors
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getSupervisors",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.supervisors = data
                        } else {
                            alert("Error, couldn't get the supervisors");
                        }
                    }
                }
            )

            // get budgete range
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getBudgetRange",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.budget = data
                        } else {
                            alert("Error, couldn't get the budget range");
                        }
                    }
                }
            )
        }
    }
}
</script>

<style scoped>
.dropdown-menu {
    height: 50vh;
    overflow-y: auto;
}
</style>