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

            let selectedAreas: number[] = []
            let selectedYears: number[] = []
            let selectedStages: string[] = []

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

            let filters = {
                areas: selectedAreas,
                years: selectedYears,
                stages: selectedStages,
            }

            this.$emit("applyFilters", filters)
        },

        getFilters: async function () {
            // get all the areas
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getAreas", 'GET');
                console.log(data);
                this.areas = data;
            } catch (error) {
                console.error(error);
            }

            // get all the years
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getYears", 'GET');
                console.log(data);
                this.years = data.map((year: { yearoffoundation: number; }) => year.yearoffoundation)
            } catch (error) {
                console.error(error);
            }

            // get all the stages
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getStages", 'GET');
                console.log(data);
                this.stages = data.map((stage: { stage: string; }) => stage.stage)
            } catch (error) {
                console.error(error);
            }
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