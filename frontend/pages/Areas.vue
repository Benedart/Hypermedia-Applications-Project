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
        getData: async function () {
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getAreaCards", 'GET');
                console.log(data);
                this.areas = data
            } catch (error) {
                alert("Error, couldn't retrieve area cards");
                console.error(error);
            }
        },
    },
};
</script>