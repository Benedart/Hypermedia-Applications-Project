<script setup lang="ts">
import { makeCall } from '@/utils/common'
import AreaCard from '@/components/AreaCard.vue'
</script>

<template>
    <main>
        <h1>Areas</h1>

        <div class="container-fluid">
            <div class="row g-3">
                <div v-for="area in areas" class="col">
                    <AreaCard :AreaID="area.AreaID" :Title="area.Title" :projects="area.projects" />
                </div>
            </div>
        </div>
    </main>
</template>

<script lang="ts">
export default {
    data() {
        return {
            areas: [
                {
                    AreaID: -1,
                    Title: 'area',
                    projects: [
                        {
                            ProjectID: -1,
                            Title: 'project'
                        }
                    ]
                },
            ],
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
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getAreaCards",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);

                            console.log(data)
                            this.areas = data
                        } else {
                            alert("Error, couldn't retrieve data");
                        }
                    }
                }
            )
        },
    },
};
</script>