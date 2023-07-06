<template>
    <div class="card">
        <!-- Head image -->
        <img class="card-img" :src="`/images/areas/${title}/logo.jpg`" :alt="`${title} area logo`">

        <div class="card-content">
            <!-- Area title -->
            <h1 class="card-header"><b> {{ title }} </b></h1>

            <!-- Projects text -->
            <p
                style="top: 12%; left: 50%; transform: translate(-50%,100%); font-size: 1.2rem; text-align: center; color: var(--color-oxford-blue); position: absolute;">
                Projects</p>

            <!--Scroller showing projects for the area-->
            <div class="icon-scroller snaps-inline">
                <!-- Loop over projects -->
                <div v-for="project in projects">
                    <!-- Link to project details -->
                    <NuxtLink :to="`/projects/${project.ProjectID}`" class="mytooltip tooltip-container">
                        <!-- Tooltip with project title -->
                        <span class="tooltiptext"> {{ project.Title }} </span>
                        <!-- Project logo -->
                        <img :src="`/images/projects/${project.Title}/logo.webp`" :alt="project.Title" class="projectIcon"
                            tag="button" type="button" />
                    </NuxtLink>
                </div>
            </div>

            <!-- Link to area details -->
            <NuxtLink :to="`/areas/${areaid}`" class="card-btn" tag="button" type="button">
                <b>Learn more</b>
            </NuxtLink>
        </div>
    </div>
</template>

<script lang="js">
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
    padding: 1rem;
    display: grid;
    gap: 1.5rem;
    grid-template-rows: repeat(auto-fit, minmax(0.5rem, 1fr));
    grid-template-columns: repeat(auto-fit, minmax(5rem, 1fr));
    align-items: start;
}

.icon-scroller {
    padding: 4rem 1rem 1rem 1rem;
    display: grid;
    grid-auto-flow: column;
    gap: 20px;
    position: relative;
    overflow-x: scroll;
    overscroll-behavior-inline: contain;
}

.snaps-inline {
    scroll-snap-type: inline mandatory;
    scroll-padding-inline: 1rem;
}

.snaps-inline>* {
    scroll-snap-align: start;
}

.grid-item {
    display: flex;
    justify-content: center;
}

.card {
    display: flex;
    position: relative;
    flex-direction: column;
    justify-content: center;
    /*align-items: center;*/
    background-color: var(--color-snow);
    border-radius: 0.4rem;
    overflow: hidden;
    box-shadow: 0 3rem 6rem rgba(0, 0, 34, 0.1);
    transition: 0.2s;
    width: 383.05px;
    margin-left: auto !important;
    margin-right: auto !important;
    margin-top: 2em !important;
}

@media screen and (max-width: 450px) {

    .card {
        width: 295px;
    }
    
}

.card:hover {
    transform: translateY(-0.5%);
    box-shadow: 0 4rem 8rem rgba(0, 0, 34, 0.5);
}

.mytooltip {
    overflow: visible;
    position: relative;
    display: inline-block;
}

.mytooltip .tooltiptext {
    order: 1;
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
    bottom: 100%;
    left: 50%;
    margin-left: -60px;
    /* Use half of the width (120/2 = 60), to center the tooltip */
}

.mytooltip .tooltiptext::after {
    content: " ";
    position: absolute;
    top: 100%;
    /* At the bottom of the tooltip */
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: var(--color-oxford-blue) transparent transparent transparent;
}

.mytooltip:hover .tooltiptext {
    visibility: visible;
}

.card-img {
    display: inline-block;
    width: 100%;
    height: 10rem;
    object-fit: cover;
}

.card-content {
    padding: 1rem;
    position: relative;
}

.card-header {
    font-size: 2rem;
    font-weight: 500;
    text-align: center;
    color: var(--color-oxford-blue);
    background-color: var(--color-snow);
    border-bottom: var(--bs-card-border-width) solid var(--color-cerulean);
}

.card-btn {
    display: block;
    width: 50%;
    padding: 0.2rem;
    font-size: 1.0rem;
    font-weight: 450;
    text-align: center;
    margin: auto;
    color: #086788;
    background-color: #E5E5E5;
    border: none;
    border-radius: 0.4rem;
    transition: 0.2s;
    cursor: pointer;
    letter-spacing: 0.1rem;
    margin-top: 1rem;
    margin-bottom: 1rem;
    top: 50%;
    left: 50%;
    transform: translate(-100%, 25%);
}

.card-btn:hover,
.card-btn:active {
    background-color: rgb(180, 205, 214);
}

.projectIcon {
    width: 4rem;
    height: 4rem;
    object-fit: cover;
    border-radius: 100%;
    position: relative;
    transition: transform 500ms ease;
    justify-content: center;

}

.projectIcon:hover {
    transform: scale(1.25);
}

@media (min-width: 768px) and (max-width: 1180px)
{
    .projectIcon {
    width: 6rem;
    height: 4rem;
    object-fit:cover;
    position: relative;
    transition: transform 500ms ease;
    justify-content: center;

}

.projectIcon:hover {
    transform: scale(1.25);
}


}



/* width */
::-webkit-scrollbar {
    width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
    border-radius: 10px;
    background: var(--color-snow);
    box-shadow: inset 0 0 5px var(--color-platinum);

}

/* Handle */
::-webkit-scrollbar-thumb {
    border-radius: 10px;
    background: var(--color-platinum);
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: var(--color-cerulean);
}
</style>