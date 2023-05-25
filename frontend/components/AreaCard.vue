<template>
    <div class="card">
        <img class="card-img" :src="`/images/areas/${title}.webp`">
        <div class="card-content">
            <h1 class="card-header">{{ title }}</h1>
            <p style="font-size: 2rem;">Projects</p>

            <div class="row row-cols-1 row-cols-lg-3">
                <div v-for="project in projects" class="col mb-4">
                    <NuxtLink :to="`/projects/${project.ProjectID}`" class="mytooltip">
                        <span class="tooltiptext"> {{ project.Title }} </span>
                        <img :src="`/images/projects/${project.Title}.webp`" class="projectIcon" />
                    </NuxtLink>
                </div>
            </div>

            <NuxtLink :to="`/areas/${areaid}`">
                <button class="card-btn">Learn more</button>
            </NuxtLink>

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

<style>
* {
    margin: 0;
    padding: 0;
}

.grid {
    display: grid;
    gap: 6rem;
    grid-template-rows: repeat(auto-fit, minmax(250px, 1fr));
    align-items: start;
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

.grid-item {
    display: flex;
    justify-content: center;
}

.card-img {
    display: block;
    width: 100%;
    height: 20rem;
    object-fit: cover;
}

.card-content {
    padding: 3rem;
}

.card-header {
    font-size: 3rem;
    font-weight: 500;
    color: #0d0d0d;
    margin-bottom: 1.5rem;
}

.card-btn {
    display: block;
    width: 100%;
    padding: 0.5rem;
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
}

.card-btn:hover,
.card-btn:active {
    background-color: #c2cffc;
}

.projectIcon {
    width: 150px;
    height: 100px;
    border-radius: 25%;
    box-shadow: 0 3rem 6rem rgba(0, 0, 0, 0.1);
    position: relative;
    transition: transform 500ms ease;
}

.projectIcon:hover {
    transform: scale(1.25);
}

/*

.card {
    color: var(--clr-neutral-100);
    background-image: url(/images/areas/EcoSustain.webp);
    background-size: cover;
    padding: 10rem 0 0;
    max-width: 35ch;
    border-radius: 1rem;
    overflow: hidden;
}

.card-content {
    --padding: 1.5rem;
    padding: var(--padding);
    background: linear-gradient(
        hsl(0 0% 0% / 0),
        hsl(20 0% 0% /0.3),
        hsl(0 0% 0% / 1)
    );
}

.card-title {
    position: relative;
    width: max-content;
}

.card-title::after{
    content:"";
    position: absolute;
    height: 4px;
    left: calc(var(--padding) * -1);
    bottom: 0;
    width: calc(100% + var(--padding));
    background: var(--clr-accent-400);

}
*/
</style>