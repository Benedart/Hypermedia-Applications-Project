<script setup lang="ts">
import { makeCall } from '@/utils/common'
</script>

<template>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <div>
        <div class="dropdown">
            <button type="button" class="custom-btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
                data-bs-auto-close="outside">
                <div class="icon" ><i class="bi bi-list-ul"></i></div>
                <b>Filter projects</b>
            </button>
            <form class="dropdown-menu ">
                <div class="hstack gap-0">
                    <div class="filter-col custom-color custom-border">
                        <div class="checkform-title border-bottom">
                            Area 
                        </div>
                        
                        <div v-for="area in areas" class="form-check">
                            <input class="form-check-input" name="areaSelector" type="checkbox" :value="area.AreaID"
                                :id="`a-${area.AreaID}`">
                            <label class="form-check-label" :for="`a-${area.AreaID}`">
                                {{ area.Title }}
                            </label>
                        </div>
                    </div>
                    <div class="filter-col custom-color custom-border">
                        <div class="checkform-title border-bottom">
                            Years 
                        </div>
                        <div v-for="year in years" class="form-check">
                            <input class="form-check-input" name="yearSelector" type="checkbox" :value="year" :id="year">
                            <label class="form-check-label" :for="year">
                                {{ year }}
                            </label>
                        </div>
                    </div>
                    <div class="filter-col custom-color custom-border">
                        <div class="checkform-title border-bottom" >
                            Stages 
                        </div>
                        <div v-for="stage in stages" class="form-check">
                            <input class="form-check-input" name="stageSelector" type="checkbox" :value="stage" :id="stage">
                            <label class="form-check-label" :for="stage">
                                {{ stage }}
                            </label>
                        </div>
                    </div>
                </div>
                <div style="display: flex; padding: .5rem; background-color: var(--color-snow);" >
                    <button @click="applyFilters()" type="button" class="apply-btn"><b>Apply</b></button>
                    <button type="reset" class="clearall-btn"><b>Clear all</b></button>
                </div>
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

        removeAreaFilter: function(areaid: number){

            console.log("doing removaAreaFilter")
            let areaSelector = document.getElementsByName("areaSelector")
            areaSelector[areaid].checked = false;

            this.applyFilters();

        },

        removeYearFilter: function(year: number){

            let yearSelector = document.getElementsByName("yearSelector")
            for (let i = 0; i < yearSelector.length; i++) {
                if (yearSelector[i].value == year ) {
                    yearSelector[i].checked = false;
                }
            }

            this.applyFilters();

        },

        removeStageFilter: function(stage: string){

            let stageSelector = document.getElementsByName("stageSelector")
            for (let i = 0; i < stageSelector.length; i++) {
                if (stageSelector[i].value == stage ) {
                    stageSelector[i].checked = false;
                }
            }

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
.checkform-title{
    text-align: start;
    padding-left: 1rem;
    padding-top: 0.5rem;
    padding-bottom: 0.5rem;
    position: relative;
    color: var(--color-oxford-blue);

    
}

.border-bottom{
    border-color: var(--color-cerulean);
}

.dropdown-menu {
    border: var(--bs-border-width) var(--bs-border-style) var(--color-cerulean)!important;
    overflow: hidden;
    padding: 0;

}

.hstack{
    align-items: flex-start;
}

.filter-col{
    overflow-y: scroll;
    overflow-x: hidden;
    padding-right: 2rem;
    height: 153px;
    width: initial;

}

.form-check{
    width: max-content;
    margin-left: .5rem;
}


.custom-color{
    background-color: var(--color-snow,0.5)!important;
}

.custom-border{
    border-bottom: var(--bs-border-width) var(--bs-border-style) var(--color-cerulean)!important;
    border-right: var(--bs-border-width) var(--bs-border-style) var(--color-cerulean)!important;
    border-top: 0 0 0;
    border-left: 0 0 0;
}

.custom-btn{
    position: relative;
    padding-left: 2.5rem;
    width: 180px;
    height: 50px;
    background: var(--color-snow);
    color:var(--color-cerulean);
    border-radius: 40px;
    transition: 0.5s;
    box-shadow: 0 0 0 1px var(--color-oxford-blue);
    overflow: hidden;
}

.custom-btn:hover{
    background: var(--color-oxford-blue);
    color:var(--color-snow);
}

.custom-btn .icon{
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

.apply-btn{
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

.apply-btn:hover{
    background: var(--color-oxford-blue);

}

.clearall-btn{
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

.clearall-btn:hover{
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

</style>