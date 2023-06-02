<template>
    <div class="card h-100 mx-auto" style="width: 18rem; margin-top: 2em;">
        <img class="card-img-top" :src="`/images/People/${personid}.webp`" :alt="personid">
        <div class="card-body">
            <h5 class="card-title">{{ name + " " + surname }}</h5>
            <h3 class="card-subtitle">{{ role }}</h3>
        </div>

        <div class="card-footer">
            <p class="card-CV"><strong>Education</strong>{{ shorterCV(CV) }}.</p>
            <!--<a :href="`mailto:${email}`" class="float-start"><img class="card-img-mail img-custom" src="/images/contact/email.webp" alt="Email Icon" style ="width: 30px; height: auto;"></a>-->
            <a :href="linkedin" class="float-end"><img class="card-img-linkedin img-custom"
                    src="/images/contact/linkedin.webp" alt="Linkedin Icon" style="height: auto;"></a>
            <NuxtLink :to="`/People/${personid}`">
                <button class="card-btn">Learn more</button>
            </NuxtLink>
        </div>
        <div class="card-footer">
            <a :href="`mailto:${email}`" class="float-start"><img class="card-img-top img-custom"
                    src="/images/contact/email.webp" alt="Email Icon" style="width: 30px; height: auto;"></a>
            <a :href="linkedin" class="float-end"><img class="card-img-top img-custom" src="/images/contact/linkedin.webp"
                    alt="Linkedin Icon" style="width: 30px; height: auto;"></a>
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
        CV: String,
        role: String
    },

    //to take the short preview of the CV
    methods: {
        shorterCV(CV: String) {
            let i = 0;
            while (i < CV.length) {
                if (i > 85 && CV.charAt(i) === '.') {
                    CV = CV.substring(0, i);
                    return CV && CV.replace(/Education/g, "");
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
    font-family: secular one, sans-serif;
    color: #000000;
    text-align: center;
}

.card-title {
    margin-top: 0.7em;
    font-weight: bold;
    font-size: 1.5em;
}

.card-subtitle {
    font-weight: lighter;
    font-size: 1.5em;
}

.card-img-linkedin {
    margin-top: -60.5em;
    width: 40px;
}

.card-footer {
    color: #ffffff;
    font-size: 1.0em;
}

.card-CV {
    font-family: secular one, sans-serif;
    color: #000000;
    text-align: center;
    font-size: 1.0em;
    margin-top: 0.4em;
    height: 5em;
}

.card-btn {
    display: block;
    width: 50%;
    padding: 0.2rem;
    font-size: 1.0rem;
    text-align: center;
    margin: auto;
    color: #3363ff;
    background-color: #d8e0fd;
    border: none;
    border-radius: 0.4rem;
    transition: 0.2s;
    cursor: pointer;
    letter-spacing: 0.1rem;
    margin-top: 2.5rem;
    margin-bottom: 1rem;
    margin-right: 4rem;
}

.card-btn:hover,
.card-btn:active {
    background-color: #c2cffc;
}
</style>