<template>
    <router-link :to="`/project/${projectid}`" style="display: contents;">
        <div class="card h-100" style="width: 18rem;">
            <img class="card-img-top" :src="`/images/projects/${title}.webp`" :alt="title">
            <div class="card-body">
                <h5 class="card-title">{{ title }}</h5>
                <p class="card-text">{{ preview }}</p>
            </div>
            <div class="card-footer">
                <i class="float-start">{{ stage }}</i>
                <span class="float-end">{{ year }}</span>
            </div>
        </div>
    </router-link>
</template>

<script lang="ts">
export default {
    props: {
        projectid: Number,
        title: String,
        preview: String,
        stage: String,
        areas: Array,
        year: Number,
        featured: Number,
        accordion: Number
    },
}
</script>

<style scoped>
.card {
    cursor: pointer;
}

.card:hover {
    filter: brightness(80%);
    transition: 0.5s;
}
</style>