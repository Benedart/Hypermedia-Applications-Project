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
    data() {
        return {
            projectDetails: {
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                name: 'Name',
                surname: 'Surname',
                budget: '1000',
                stage: 'stage',
                year: 'year'
            },

            people: ['Person1', 'Person2'],
        }
    },

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