<template>
        <div class="card h-100 mx-auto" style="width: 18rem;">
            <img class="card-img" :src="`/images/projects/${title}.webp`" :alt="title">
            <div class="card-body">
                <h1 class="card-header"><b> {{ title }} </b></h1>
                <p class="card-description">{{ preview }}</p>

                <span class="float-start" ><b>{{ stage }}</b>
                    <row style="margin-left: 0.5rem;" v-for="area in areas" >
                        <NuxtLink :to="`/areas/${area.areaid}`" class="area-link">
                            <span class="area-title" >{{ area.title}}  </span>
                        </NuxtLink>
                    </row>
                </span>
                    
                
                <!--span class="float-end">{{ year }}</span-->
                
            
            
                
                <nuxt-link :to="`/projects/${projectid}`" tag="button" type="button" class="card-btn ">
                    <b>Learn more</b>
            </nuxt-link>
        </div>
        </div>
</template>

<script lang="ts">
export default {
    props: {
        projectid: Number,
        title: String,
        preview: String,
        stage: String,
        year: Number,
        featured: Number,
        accordion: Number,
        areas: Array
    },
}




</script>

<style scoped>

.card{
    display: flex;
    flex-direction: column;
    justify-content: center;
    /*align-items: center;*/
    background-color: var(--color-snow);
    border-radius: 0.4rem;
    overflow: hidden;
    box-shadow: 0 3rem 6rem rgba(0, 0, 34, 0.1);
    transition: 0.2s;
}
.card-img {
    display: inline-block;
    width: 100%;
    height: 10rem;
    object-fit: cover;
}

.card-body {
    font-family: Avenir, sans-serif;
    color: var(--color-oxford-blue);
    text-align: center;
    background-color: var(--color-snow);
}

.float-start{
    color: var(--color-cerulean);
    margin-top: 1rem;
    margin-left: 0.6rem;
}

.card-title {
    margin-top: 0.7em;
    font-weight: bold;
    font-size: 1.5em;
    font-family: Avenir, sans-serif;
    color : var(--color-snow);
}

.card-header {
    font-size: 1.2rem;
    font-weight: 500;
    text-align: center;
    color: var(--color-oxford-blue);
    margin-bottom: 1rem;
    background-color: var(--color-snow);
    border-bottom: var(--bs-card-border-width) solid var(--color-cerulean);
}


.card-footer {
    background-color: #086788;
    font-size: 1.0em;
}

.card-description {
    font-family: Avenir, sans-serif;
    color: var(--color-oxford-blue);
    text-align: center;
    font-size: 0.75em;
    height: 3em;
}

.card-btn {
    
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
    margin-top: 1em;
    margin-bottom:0.5em;
    margin-right: 4em;
    margin-left: 4em;
    font-family: Avenir, sans-serif;
}

.card-btn:hover,
.card-btn:active {
    background-color: rgb(180, 205, 214);
}

.card:hover {
    transform: translateY(-0.5%);
    box-shadow: 0 4rem 8rem rgba(0, 0, 34, 0.5);
}

.area-link{
    position: relative;
    display: inline-block;
}
.area-link .area-title{
    color: var(--color-oxford-blue); 
    padding: 0.2rem;
}

.area-link .area-title:hover::after{
    content: "";
  position: absolute;
  bottom: 0.3rem;
  left: 0.3rem;
  width: 90%;
  height: 25%;
  background-color: var(--color-cerulean); /* Colore di sfondo per l'evidenziazione */
  opacity: 0.3;
}

</style>