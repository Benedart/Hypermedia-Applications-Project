<template>
    <div class="dropdown">
        <button type="button" class="custom-btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
            data-bs-auto-close="outside" :disabled="disabled ? true : false"
            :title="disabled ? 'The fitler is disabled while using the searchbar' : ''">
            <div class="icon"><i class="bi bi-list-ul"></i></div>
            <b>Filter projects</b>
        </button>
        <form class="dropdown-menu">
            <div class="hstack gap-1 ">
                <div class="filter-column custom-color custom-border p-2">
                    <div class="checkform-title border-bottom">
                        <b>Area</b>
                    </div>
                    <div class="checkform-body">
                        <ul class="list-group list-group-flush">
                            <li v-for="area in areas" class="form-check list-group-item">
                                <input class="form-check-input me-1" name="areaSelector" type="checkbox"
                                    :value="area.AreaID" :id="`a-${area.AreaID}`">
                                <label class="form-check-label stretched-link" :for="`a-${area.AreaID}`">
                                    {{ area.Title }}
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="filter-column custom-color custom-border p-2">
                    <div class="checkform-title border-bottom">
                        <b>Years</b>
                    </div>
                    <div class="checkform-body">
                        <ul class="list-group list-group-flush">
                            <li v-for="year in years" class="form-check list-group-item">
                                <input class="form-check-input me-1" name="yearSelector" type="checkbox" :value="year"
                                    :id="year">
                                <label class="form-check-label stretched-link" :for="year">
                                    {{ year }}
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="filter-column custom-color custom-border p-2">
                    <div class="checkform-title border-bottom">
                        <b>Stages</b>
                    </div>
                    <div class="checkform-body">
                        <ul class="list-group list-group-flush">
                            <li v-for="stage in stages" class="form-check list-group-item">
                                <input class="form-check-input me-1" name="stageSelector" type="checkbox" :value="stage"
                                    :id="stage">
                                <label class="form-check-label stretched-link" :for="stage">
                                    {{ stage }}
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="checkform-footer">
                <button @click="applyFilters()" type="button" class="apply-btn"><b>Apply</b></button>
                <button type="reset" class="clearall-btn"><b>Clear all</b></button>
            </div>
        </form>
    </div>
</template>

<script lang="js">
import { makeCall } from '@/utils/common'

export default {
    data() {
        return {
            areas: [],
            years: [],
            stages: [],
        }
    },

    props: {
        disabled: Boolean,
    },

    created() {
        this.getFilters()
    },

    emits: ["applyFilters"],

    methods: {
        applyFilters: function () {
            // get the selected filters
            let areaSelector = document.getElementsByName("areaSelector")
            let yearSelector = document.getElementsByName("yearSelector")
            let stageSelector = document.getElementsByName("stageSelector")

            // get the values of the selected filters
            let selectedAreas = []
            let selectedYears = []
            let selectedStages = []

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

            // create an object with the selected filters
            let filters = {
                areas: selectedAreas,
                years: selectedYears,
                stages: selectedStages,
            }

            // close the dropdown
            document.querySelector(".dropdown-toggle").click()

            // emit the filters to the parent component
            this.$emit("applyFilters", filters)
        },

        removeFilter: function (filter) {
            // fitler will contain an areaid, year or stage
            // check which on it is and uncheck its corresponding checkbox
            let areaSelector = document.getElementsByName("areaSelector")
            let yearSelector = document.getElementsByName("yearSelector")
            let stageSelector = document.getElementsByName("stageSelector")

            if (this.areas.map(area => area.AreaID).includes(filter)) {
                for (let i = 0; i < areaSelector.length; i++) {
                    if (areaSelector[i].value == filter) {
                        areaSelector[i].checked = false
                    }
                }
            } else if (this.years.includes(filter)) {
                for (let i = 0; i < yearSelector.length; i++) {
                    if (yearSelector[i].value == filter) {
                        yearSelector[i].checked = false
                    }
                }
            } else if (this.stages.includes(filter)) {
                for (let i = 0; i < stageSelector.length; i++) {
                    if (stageSelector[i].value == filter) {
                        stageSelector[i].checked = false
                    }
                }
            }

            // apply the updated filters
            this.applyFilters();
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
                this.years = data.map((year) => year.yearoffoundation)
            } catch (error) {
                console.error(error);
            }

            // get all the stages
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getStages", 'GET');
                console.log(data);
                this.stages = data.map((stage) => stage.stage)
            } catch (error) {
                console.error(error);
            }
        }
    }
}
</script>

<style scoped>
.checkform-title {
    text-align: start;
    padding-left: 1rem;
    padding-top: 0.5rem;
    padding-bottom: 0.5rem;
    position: relative;
    color: var(--color-oxford-blue);
}

.border-bottom {
    border-color: var(--color-cerulean);
}

.dropdown-menu {
    border: var(--bs-border-width) var(--bs-border-style) var(--color-cerulean) !important;
    overflow: hidden;
    padding: 0;
    margin: 0;
    background-color: var(--color-snow);
}

.hstack {
    align-items: flex-start;
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    justify-content: flex-start;
}

/* filter columns should have the category name as the title, and the checkboxes as the content */
/* the title should be fixed, and the content should be scrollable */
.filter-column {
    display: flex;
    flex-direction: column;
    flex: 1;
    width: 10rem;
}

@media screen and (max-width: 550px) {
    .filter-column{
        width:auto!important;
    }
}

.checkform-footer {
    padding: 1rem;
    background-color: var(--color-snow);
    border-top: var(--bs-border-width) var(--bs-border-style) var(--color-cerulean);
    display: flex;
}

.form-check-input {
    width: 1rem;
    height: 1rem;

    border: var(--bs-border-width) var(--bs-border-style) var(--color-cerulean);
    border-radius: 0.3rem;
}

.form-check-input:checked {
    background-color: var(--color-cerulean);
}

.checkform-footer button {
    flex: 1;
    margin-left: 0.5rem;
    margin-right: 0.5rem;
}

.checkform-title {
    padding: 0.5rem;
    background-color: var(--color-snow);
    color: var(--color-oxford-blue);
    border-bottom: var(--bs-border-width) var(--bs-border-style) var(--color-cerulean);

    position: sticky;
    top: 0;
    z-index: 1;
}

.list-group-item {
    background-color: var(--color-snow);
    border-bottom: var(--bs-border-width) var(--bs-border-style) var(--color-platinum);
}

/* content should have a fixed height based on the height of the page (40% of it) */
/* all content should be of the same max height, and scrollable if more */
.checkform-body {
    overflow-y: auto;
    overflow-x: hidden;
    background-color: var(--color-snow);
    flex: 1;

    position: sticky;
    top: 0;
    z-index: 0;

    max-height: 30vh;
}

.checkform-body::-webkit-scrollbar {
    width: 0.5rem;
}

.checkform-body::-webkit-scrollbar-track {
    background: var(--color-snow);
}

.checkform-body::-webkit-scrollbar-thumb {
    background: var(--color-cerulean);
}

.checkform-body::-webkit-scrollbar-thumb:hover {
    background: var(--color-cerulean);
}

.checkform-body::-webkit-scrollbar-thumb:active {
    background: var(--color-cerulean);
}

.form-check {
    width: max-content;
    margin-left: .5rem;
}

.custom-color {
    background-color: var(--color-snow, 0.5) !important;
}

.custom-border {
    border-right: var(--bs-border-width) var(--bs-border-style) var(--color-cerulean) !important;
    border-top: 0 0 0;
    border-left: 0 0 0;
}

.custom-btn {
    position: relative;
    padding-left: 2.5rem;
    width: 180px;
    height: 50px;
    background: var(--color-snow);
    color: var(--color-cerulean);
    border-radius: 40px;
    transition: 0.5s;
    box-shadow: 0 0 0 1px var(--color-oxford-blue);
    overflow: hidden;
}

.custom-btn:hover {
    background: var(--color-oxford-blue);
    color: var(--color-snow);
}

.custom-btn .icon {
    position: absolute;
    top: 0;
    left: 0;
    width: 50px;
    height: 50px;
    background: none;
    color: var(--color-cerulean);
    border-radius: 50px;
    justify-content: center;
    align-items: center;
    display: flex;
    z-index: 1000;
    cursor: pointer;
}

.apply-btn {
    text-align: center;
    display: flex;
    align-items: center;
    width: fit-content;
    padding: 1rem 1rem;
    height: 30px;
    background: var(--color-cerulean);
    color: var(--color-snow);
    border-radius: 50px;
    border-width: 0;
    transition: 0.5s;
    overflow: hidden;
    cursor: pointer;
    box-shadow: none;
    justify-content: center;
    margin-right: .5rem;

}

.apply-btn:hover {
    background: var(--color-oxford-blue);

}

.clearall-btn {
    text-align: center;
    display: flex;
    align-items: center;
    width: fit-content;
    padding: 1rem 1rem;
    height: 30px;
    background: var(--color-platinum);
    color: var(--color-cerulean);
    border-radius: 50px;
    border-width: 0;
    transition: 0.5s;
    overflow: hidden;
    cursor: pointer;
    box-shadow: none;
    justify-content: center;
    margin-right: .5rem;

}

.clearall-btn:hover {
    background: #08688834;

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

/* style for the button when disabled */
.custom-btn:disabled {
    background: var(--color-platinum);
    color: var(--color-black);
    cursor: not-allowed;
}
</style>