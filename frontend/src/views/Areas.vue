<script setup lang="ts">
import { makeCall } from '@/utils/common'
//import AreaFilter from '@/components/AreaFilter.vue'
import AreaCard from '@/components/AreaCard.vue'
</script>

<template>
    <main>
        <h1>Areas</h1>

        <div class="container-fluid">
            <div class="search-wrapper panel-heading col-sm-12">
                <input type="text" v-model="search" placeholder="Search" /> <br />
                <br />
            </div>
            <AreaFilter @applyFilters="filterAreas" />
            <br>

            <div class="row g-3">
                <div v-for="area in  visibleAreas" class="col">
                    <AreaCard :areaid="area.AreaID" :title="area.Title" :type="area.Type" />
                </div>
            </div>
        </div>
    </main>
</template>

<script lang="ts">
export default {
    data() {
        return {
            // this will contain only the areas that match the filters
            areas: [
                {
                    AreaID: -1,
                    Title: 'area',
                    Description: 'descrizione simpatika'

                },
            ],

            // this will contain all the areas, used to reset the filters
            allAreas: [
                {
                    AreaID: -1,
                    Title: 'area',
                    Description: 'descrizione simpatika'
                },
            ],

            search: ""
        }
    },

    components: {
        AreaCard
    },

    created() {
        this.getData()
    },

    methods: {
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
    },
    computed: {
        visibleAreas() {
            return this.areas.filter(a => {
                // return true if the area should be visible

                let indexList = [0];
                for (let i = 0; i < a.Title.length; i++) {
                    const character = a.Title.charAt(i);
                    if (character == " ")
                        indexList.push(i + 1);
                }
                // check if the search string is a substring of the area title (case insensitive)
                return indexList.includes(a.Title.toLowerCase().indexOf(this.search.toLowerCase()));
            });
        }
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