<script setup lang="ts">
import { makeCall } from '@/utils/common'
import AreaCard from '@/components/AreaCard.vue'
</script>

<template>
    <main>
        <div class="container-fluid">
        <div style="font-size: 3.5em; margin-bottom: 1em;">
                Areas
            </div>

        <div class="grid">
                <div v-for="area in areas" class="grid-item">
                    <AreaCard :areaid="area.AreaID" :title="area.Title" :projects="area.projects" />
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

<style>
.grid{
    display: grid;
    gap: 6rem;
    grid-template-columns: repeat(auto-fit,minmax(30rem,1fr));
    align-items: start;
}


.grid-item{
    /*display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;*/
    background-color: #fff;
    border-radius: 0.4rem;
    overflow: hidden;
    box-shadow: 0 3rem 6rem rgba(0, 0, 0, 0.1);
    cursor: pointer;
    transition: 0.2s;
}

.grid-item:hover{
    transform: translateY(-0.5%);
    box-shadow: 0 4rem 8rem rgba(0, 0, 0, 0.5);
}
</style>


            <!--div class="row g-2" style="margin-top: 20px;">
                <div class="col" v-for="project in projects">
                    <router-link :to="`/project/${project.ProjectID}`" class="mytooltip">
                        <span className="tooltiptext"> {{project.Title}} </span>
                        <img :src="`/images/projects/${project.Title}.webp`" class="projectIcon"/>
                    </router-link>
                </div>
            </div-->