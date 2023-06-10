<template >
    <div class="card h-100 mx-auto" style="width: 18rem; margin-top: 2em; background-color:#FFFBFA;">
        <img class="card-img-top" :src="`/images/People/${personid}.webp`" :alt="personid">
        <div class="card-body">
            <h5 class="card-title">{{ name + " " + surname }}</h5>
            <h3 class="card-subtitle">{{ role }}</h3>
        </div>

        <div class="card-footer">
            <p class="card-Description">{{ shorterDescription(Description) }}.</p>
            <a :href="linkedin" class="float-end"><img class="card-img-linkedin img-custom"
                    src="/images/contact/linkedin.webp" alt="Linkedin Icon" style="height: auto;"></a>
            <nuxt-link :to="`/People/${personid}`" tag="button" type="button" class="card-btn ">
                   Learn more
            </nuxt-link>
        </div>
    </div>
</template>

<script lang="ts">
export default {
    props: {
        personid: Number,
        name: String,
        surname: String,
        age: Number,
        email: String,
        linkedin: String,
        Description: String,
        role: String
    },

    //to take the short preview of the Description
    methods: {
        shorterDescription(Description: String) {
            let i = 0;
            while (i < Description.length) {
                if (i > 85 && Description.charAt(i) === '.') {
                    Description = Description.substring(0, i);
                    return Description;
                } else {
                    i++;
                }
            }
        }
    },
}

</script> 

<style scoped>
.card-img-top {
    border-radius: 100%;
    width: 170px;
    margin: auto;
    margin-top: 40px;
}

.card-body {
    font-family: Avenir, sans-serif;
    color: #000022;
    text-align: center;
}

.card-title {
    margin-top: 0.7em;
    font-weight: bold;
    font-size: 1.5em;
    font-family: Avenir, sans-serif;
    color : #000022;
}

.card-subtitle {
    font-weight: lighter;
    font-size: 1.2em;
    font-family: Avenir, sans-serif;
}


.card-img-linkedin
{
    margin-top: -53.5em;
    width: 40px; 
    
}

.card-footer {
    background-color: #086788;
    font-size: 1.0em;
}

.card-Description {
    font-family: Avenir, sans-serif;
    color: #FFFBFA;
    text-align: center;
    font-size: 0.75em;
    margin-top: 0.4em;
    height: 5em;
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
    margin-top: 0.5em;
    margin-bottom:0.5em;
    margin-right: 4em;
    margin-left: 4em;
    font-family: Avenir, sans-serif;
}

.card-btn:hover,
.card-btn:active {
    background-color: #c2cffc;
}
</style>