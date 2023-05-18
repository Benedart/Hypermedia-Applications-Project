<template>
    <div class="container">
        <div>
            <h1>{{ areaDetails.Title }}</h1>
        </div>
        <div>
            <p>{{ areaDetails.Description }}</p>
            <hr>
            <b>Projects: </b><span v-for="project in projects">{{ project }}, </span>
        </div>
    </div>
</template>

<script lang="ts">
import { makeCall } from '@/utils/common'

export default {
    data() {
        return {
            areaDetails: {
                AreaID: -1,
                Title: 'title',
                Description: 'description',
            },

            projects: [
                {
                    projectid: -1,
                    title: 'project',
                    preview: 'preview',
                    stage: 'stage',
                    year: 'year',
                }
            ],
        }
    },

    created() {
        this.areaDetails.AreaID = this.$route.params.areaid
        this.getAreaData(this.areaDetails.AreaID)
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
                            this.projects = data
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