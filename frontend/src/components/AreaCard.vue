<template>
    <div class="card" @click="getAreaData(areaid)" style="width: 18rem;" data-bs-toggle="modal"
        :data-bs-target="`#modal${areaid}`">
        <!--img class="card-img-top" :src="`/images/projects/${title}.webp`" :alt="title"-->
        <div class="card-body">
            <h5 class="card-title">{{ title }}</h5>
            <!--p class="card-text">{{ description }}</p-->
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade modal-xl" :id="`modal${areaid}`" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">{{ title }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>{{ areaDetails.description }}</p>
                    <hr>
                    <b>Projects: </b><span v-for="project in areaDetails.projects">{{ project }}, </span>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { makeCall } from '@/utils/common'

export default {
    data() {
        return {
            areaDetails: {
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                title: 'title',
                projects: ['project1', 'project2']
            
            },
        }
    },

    props: {
        areaid: Number,
        title: String,
        areas: Array,
        description: String
    },
    

    methods: {
        getAreaData: function (areaid: number) {
            // get area details
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getArea/" + areaid,
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;
                        console.log(message)

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.areaDetails = data
                        } else {
                            alert("Error, couldn't retrieve area details");
                        }
                    }
                }
            )

            // get all projects which refer an area
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getProjectsFromArea/" + areaid,
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;
                        console.log(message)

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.areaDetails.projects = data
                        } else {
                            alert("Error, couldn't retrieve projects of this area");
                        }
                    }
                }
            )
        }
    }
}

</script>