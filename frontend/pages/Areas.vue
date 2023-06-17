<script setup lang="ts">
import { makeCall } from '@/utils/common'
import AreaCard from '@/components/AreaCard.vue'
</script>

<template>
    <main>
        <div class="container-text-center">
            <div class="title">
                Areas
            </div>
        </div>

        <div class="container">
            <div class="grid">
                <div v-for="area in areas">
                    <AreaCard :areaid="area.AreaID" :title="area.Title" :projects="area.projects"
                        style="margin-top: -5rem;" />
                </div>
            </div>

            <!--div class="row g-3">
            <div v-for="area in areas" class="col-12 col-md-6 col-lg-4">
                <AreaCard :areaid="area.AreaID" :title="area.Title" :projects="area.projects" />
            </div>
        </div-->
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

    }

}

@media screen and (max-width: 600px) {

    .container {
        padding: 0 !important;
    }

}

.grid-item {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background-color: snow;
    border-radius: 0.4rem;
    overflow: hidden;
    box-shadow: 0 3rem 6rem rgba(0, 0, 0, 0.1);
    cursor: pointer;
    transition: 0.2s;
}

.grid-item:hover {
    transform: translateY(-0.5%);
    box-shadow: 0 4rem 8rem rgba(0, 0, 0, 0.5);
}

.container {
    padding: 4rem;
    border-radius: 0.4rem;
    background-color: var(--color-snow);
    max-width: 90%;
    width: auto;
    height: auto;
    max-height: 90%;
    margin: auto;

}
</style>