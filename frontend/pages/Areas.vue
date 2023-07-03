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

            <!--container with grid which contains area cards-->
            <div class="container" style="background-color: #FFFBFA;">
                <div class="row d-flex justify-content-center">
                    <!--grid containing all areas-->
                    <div v-if="areas.length > 0" class="row g-3">
                        <div v-for="area in areas" class="col" style="margin-bottom: 70px;">
                            <!-- Render AreaCard component with props -->
                            <AreaCard :areaid="area.AreaID" :title="area.Title" :projects="area.projects"
                                style="margin-top: -5rem;" />
                        </div>
                    </div>
                    <div v-else-if="!queryError" class="d-flex justify-content-center">
                        <div class="spinner-border m-5" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                    <div v-else class="container-text-center">
                        <div class="error">There was an error while fetching data</div>
                        <div class="error-subtitle">Contact the website owner at teamHyperMeow@gmail.com</div>
                        <div class="icon"><i class="bi bi-emoji-frown"></i></div>
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
            areas: [],
            queryError: false,
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
               // console.log(data);
                this.areas = data
            } catch (error) {
                console.error("Error, couldn't retrieve area cards");
                console.error(error);
                this.queryError = true;
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
    margin-bottom: 1rem;
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