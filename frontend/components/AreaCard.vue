<template>
    <div class="card">
        <img class="card-img" :src="`/images/areas/${title}.jpg`">
        <NuxtLink :to="`/areas/${areaid}`">
            <button class="card-btn">Learn more</button>
        </NuxtLink>
        <div class="card-content">
            <h1 class="card-header">{{ title }} </h1>
            <p style="font-size: 1.2rem; margin-bottom: 0.5rem;">Projects</p>

            <div class="grid">
                <div v-for="project in projects">
                    <NuxtLink :to="`/projects/${project.ProjectID}`" class="mytooltip">
                        <span class="tooltiptext"> {{ project.Title }} </span>
                        <img :src="`/images/projects/${project.Title}.webp`" class="projectIcon" />
                    </NuxtLink>
                </div>
            </div>

            <!--div class="row row-cols-1 row-cols-lg-3" >
                <div v-for="project in projects" class="col mb-4">
                    <NuxtLink :to="`/project/${project.ProjectID}`" class="mytooltip">
                        <span class="tooltiptext"> {{project.Title}} </span>
                        <img :src="`/images/projects/${project.Title}.webp`" class="projectIcon"/>
                    </NuxtLink>
                </div>
            </div-->



        </div>
    </div>
</template>

<script lang="ts">
export default {

    props: {
        areaid: Number,
        title: String,
        areas: Array,
        description: String,
        projects: Array
    },


}
</script>

<style scoped>
* {
    margin: 0;
    padding: 0;
}

.grid {
    display: grid;
    gap: 1.5rem;
    grid-template-rows: repeat(auto-fit, minmax(0.5rem, 1fr));
    grid-template-columns: repeat(auto-fit, minmax(5rem, 1fr));
    align-items: start;
}

.grid-item {
    display: flex;
    justify-content: center;
}

.card {
    display: flex;
    flex-direction: column;
    justify-content: center;
    /*align-items: center;*/
    background-color: #fff;
    border-radius: 0.4rem;
    overflow: hidden;
    box-shadow: 0 3rem 6rem rgba(8, 103, 136, 0.1);
    cursor: pointer;
    transition: 0.2s;
}

.card:hover {
    transform: translateY(-0.5%);
    box-shadow: 0 4rem 8rem rgba(8, 103, 136, 0.5);
}

.card:hover .card-btn {
    opacity: 1;
}

.mytooltip {
    position: relative;
    display: inline-block;
}

.mytooltip .tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: var(--color-oxford-blue);
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
    border-color: transparent transparent var(--color-oxford-blue) transparent;
}

.mytooltip:hover .tooltiptext {
    visibility: visible;
}

* {
    margin: 0;
    padding: 0;
}

.card-img {
    display: inline-block;
    width: 100%;
    height: 10rem;
    object-fit: cover;
}

.card-content {
    padding: 1rem;
}

.card-header {
    font-size: 2rem;
    font-weight: 500;
    text-justify: center;
    color: #0d0d0d;
    margin-bottom: 1rem;
    background-color: #fff;
}

.card-btn {
    display: block;
    width: 50%;
    padding: 0.5rem;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -200%);
    font-size: 1.5rem;
    text-align: center;
    color: #3363ff;
    background-color: #d8e0fd;
    border: none;
    border-radius: 0.4rem;
    transition: 0.2s;
    cursor: pointer;
    letter-spacing: 0.1rem;
    margin-top: 2rem;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.card-btn:hover,
.card-btn:active {
    background-color: #c2cffc;
}

.projectIcon {
    /*max-width: 6rem;
  max-height: 4rem;
  min-width: 3rem;
  min-height: 2rem;*/
    width: 6rem;
    height: 4rem;
    border-radius: 25%;
    box-shadow: 0 3rem 6rem rgba(0, 0, 0, 0.1);
    position: relative;
    transition: transform 500ms ease;
    justify-content: center;
}

.projectIcon:hover {
    transform: scale(1.25);
}
</style>