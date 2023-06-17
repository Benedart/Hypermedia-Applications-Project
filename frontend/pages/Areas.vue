<script setup lang="js">
import { makeCall } from '@/utils/common'
import AreaCard from '@/components/AreaCard.vue'

useSeoMeta({
    title: 'Areas - HyperMeow',
    description: 'This is the areas page of HyperMeow website. Here you can find all the areas of HyperMeow projects.',
    keywords: 'HyperMeow, areas, ecosustain, technology, growth, healthcare, hypermeow areas',
})
</script>

<template>
    <main>
        <!--header container-->
        <div class="container-text-center">
            <div class="title">
                Areas
            </div>


            <!--custom grid containing card areas-->
            <!--div class="container">
                <div class="grid">
                    <div v-for="area in areas " class="col" style="margin-bottom: 70px;">
                        <AreaCard :areaid="area.AreaID" :title="area.Title" :projects="area.projects" style="margin-top: -5rem;"/>
                    </div>
                </div>
            </div-->

            <div class="container" style="background-color: #FFFBFA;">
                <div class="row d-flex justify-content-center">
                    <div class="row g-3">
                        <div v-for="area in areas " class="col" style="margin-bottom: 70px;">
                            <AreaCard :areaid="area.AreaID" :title="area.Title" :projects="area.projects"
                                style="margin-top: -5rem;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </main>
</template>

<script lang="js">
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
                            Title: 'example'
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

<style scoped>
.title {
    font-size: 3.5em;
    text-align: center;
    color: #000022;
    margin-bottom: 5rem;
}

.grid {

    margin: 5rem;
    display: grid;
    gap: 10rem;
    grid-template-columns: repeat(auto-fit, minmax(15rem, 1fr));
    align-items: start;
}


@media screen and (max-width: 600px) {
    .grid {
        margin: auto !important;
        padding: auto;


    }

}

</style>