
<template>
    <div class="card h-100 mx-auto" style="width: 18rem; margin-top: 2em; background-color:#FFFBFA;">
        <NuxtLink :to="linkedin" tag="button" type="button" class="float-end">
            <img class="card-img-linkedin img-custom" src="/images/contact/linkedin.webp" alt="Linkedin Icon">
        </NuxtLink>
        <img class="card-img-top" :src="`/images/People/${personid}.webp`" :alt="personid">
        <div class="card-body">
            <h5 class="card-title">{{ name + " " + surname }}</h5>
            <h3 class="card-subtitle"><b>{{ role }}</b></h3>
        </div>

        <div class="card-footer">
            <p class="card-Description">{{ shorterDescription(Description) }}.</p>
            <NuxtLink :to="`/People/${personid}`" tag="button" type="button" class="card-btn ">
                <b>Learn more</b>
            </NuxtLink>
        </div>
    </div>
</template>


<script lang="js">
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
        shorterDescription(Description) {
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
.float-end {
    height: auto;
    margin-top: 1em;
    margin-left: 15em;
}

.card-img-top {
    border-radius: 100%;
    width: 170px;
    margin: auto;
    margin-top: 25px;
}

.card-body {
    color: #000022;
    text-align: center;
}

.card-title {
    margin-top: 0.7em;
    font-weight: bold;
    font-size: 1.5em;
    color : #000022;

}

.card-subtitle {
    font-weight: lighter;
    font-size: 1.2em;
}


.card-img-linkedin {

    width: 40px;

}

.card-footer {
    background-color: #086788;
    font-size: 1.0em;
    margin-top: -1em;
}

.card-Description {

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
    margin-top: 2em;
    margin-bottom:1em;
    margin-right: 4em;
    margin-left: 4em;
}

.card-btn:hover,


.card-btn:active {
    background-color: rgb(180, 205, 214);
}

.card:hover {
    transition: 0.5s;
    margin-top: 5em;
    transform: translateY(-0.5%);
    box-shadow: 0 4rem 8rem rgba(0, 1, 33, 0.5);
}
</style>