<template>
    <div class="card mx-auto" style="width: 18rem;">
        <NuxtLink :to="`/areas/${AreaID}`" style="display: contents;">
            <img class="card-img-top" :src="`/images/areas/${Title}.webp`" :alt="Title">
            <div class="card-body">
                <h5 class="card-title">{{ Title }}</h5>
            </div>
        </NuxtLink>
        <div class="card-footer">
            <!-- put the list of projects associated with the area as small ciruclar icons that link to the project page -->
            <div class="row g-2">
                <div class="col" v-for="project in projects">
                    <NuxtLink :to="`/projects/${project.ProjectID}`" class="mytooltip">
                        <span class="tooltiptext">{{ project.Title }}</span>
                        <img :src="`/images/projects/${project.Title}.webp`" alt="project1" class="rounded-circle"
                            style="width: 2rem; height: 2rem; object-fit: cover;">
                    </NuxtLink>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
export default {
    props: {
        AreaID: Number,
        Title: String,
        projects: Array
    },
}
</script>

<style scoped>
.card-body {
    cursor: pointer;
}

.card-body:hover {
    filter: brightness(80%);
    transition: 0.5s;
}

.mytooltip {
    position: relative;
    display: inline-block;
}

.mytooltip .tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;

    /* Position the tooltip */
    position: absolute;
    z-index: 1;

    /* bottom tooltip */
    width: 120px;
    top: 120%;
    left: 50%;
    margin-left: -60px;
    /* Use half of the width (120/2 = 60), to center the tooltip */
}

.mytooltip .tooltiptext::after {
    content: " ";
    position: absolute;
    bottom: 100%;
    /* At the top of the tooltip */
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: transparent transparent black transparent;
}

.mytooltip:hover .tooltiptext {
    visibility: visible;
}
</style>