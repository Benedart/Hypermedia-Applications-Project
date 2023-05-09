<script setup lang="ts">
import { makeCall } from '@/utils/common'
import AreaFilter from '@/components/AreaFilter.vue'
import AreaCard from '@/components/AreaCard.vue'
</script>

<template>
    <header>
        <img src="@/assets/logo.png" width="50">
    </header>
    <main>
        <h1>Areas</h1>

        <AreaFilter @applyFilters="filterAreas" />

        <AreaCard v-for="area in  areas " :areaid="area.areaid" :title="area.title"
            :type="area.type" - />
    </main>
</template>

<script lang="ts">
export default {
    data() {
        return {
            // this will contain only the areas that match the filters
            areas: [
                {
                    areaid: -1,
                    title: 'area',
                    type: 'type',
                },
            ],

            // this will contain all the areas, used to reset the filters
            allAreas: [
                {
                    areaid: -1,
                    title: 'area',
                    type: 'type',
                },
            ],
        }
    },

    components: {
        AreaFilter,
        AreaCard
    },

    created() {
        this.getData()
    },

    methods: {
        filterAreas: function (filters: { types: string[] }) {
            let types = filters.types

            console.log("SELECTED FILTERS:")
            console.log(types)

            let filteredAreas = []
            this.allAreas.forEach(area => {

                // apply the filters
                let typeFilter = types.length === 0 || types.includes(area.type)
                
                // if all the filters are passed, add the area to the filtered areas
                if (typeFilter) {
                    filteredAreas.push(area)
                    
                    console.log("PUSHING AREA:")
                    console.log(area)

                }
            })

            this.areas = filteredAreas;
        },

        getData: function () {
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getAreas",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);

                            console.log(data)

                            // itintially all the areas are shown, so we save them in both arrays
                            this.allAreas = data
                            this.areas = data
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