<template>
    <div class="card mx-auto" style="width: 18rem;">
        <router-link :to="`/area/${AreaID}`" style="display: contents;">
            <img class="card-img-top" :src="`/images/areas/${Title}.webp`" :alt="Title">
            <div class="card-body">
                <h5 class="card-title">{{ Title }}</h5>
            </div>
        </router-link>
        <div class="card-footer">
            <!-- put the list of projects associated with the area as small ciruclar icons that link to the project page -->
            <div class="row g-2">
                <div class="col" v-for="project in projects">
                    <router-link :to="`/project/${project.ProjectID}`" class="mytooltip">
                        <span class="tooltiptext">{{ project.Title }}</span>
                        <img :src="`/images/projects/${project.Title}.webp`" alt="project1" class="rounded-circle"
                            style="width: 2rem; height: 2rem; object-fit: cover;">
                    </router-link>
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
</style>