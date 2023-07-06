<template>
    <!-- Container for the card -->
    <div class="card h-100 mx-auto" style="width: 18rem; margin-top: 2em; background-color:#FFFBFA;">
        <!-- Linkedin link -->
        <NuxtLink :to="linkedin" tag="button" type="button" class="float-end">
            <img class="card-img-linkedin img-custom" src="/images/contact/linkedin.webp" alt="Linkedin Icon">
        </NuxtLink>
        <!-- Person image -->
        <img class="card-img-top" :src="`/images/People/${personid}.webp`" :alt="personid">
        <div class="card-body">
            <!-- Person name -->
            <h5 class="card-title">{{ name + " " + surname }}</h5>
            <!-- Person role -->
            <h3 class="card-subtitle"><b>{{ role }}</b></h3>
        </div>

        <div class="card-footer">
            <!-- Shortened description  -->
            <p class="card-Description">{{ shorterDescription(Description) }}.</p>
            <!-- Learn more button -->
            <NuxtLink :to="`/people/${personid}`" tag="button" type="button" class="card-btn ">
                <b>Learn more</b>
            </NuxtLink>
        </div>
    </div>
</template>

<script lang="js">
export default {
    props: {
        personid: Number,   // Unique identifier for the person
        name: String,       // Person's first name
        surname: String,    // Person's last name
        age: Number,        // Person's age
        email: String,      // Person's email
        linkedin: String,   // Person's LinkedIn profile URL
        Description: String,// Description of the person
        role: String        // Person's role
    },

    //to take the short preview of the Description cutting some words until it found a point in more or less 85 letters
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
.card {
    transition: 0.2s;
}

/* Styles for the LinkedIn link */
.float-end {
    height: auto;
    margin-top: 1em;
    /* Adjusts the top margin */
    margin-left: 15em;
    /* Adjusts the left margin */
}

/* Styles for the person image */
.card-img-top {
    border-radius: 100%;
    /* Rounds the image to create a circular shape */
    width: 170px;
    /* Sets the width of the image */
    margin: auto;
    /* Centers the image horizontally */
    margin-top: 25px;
    /* Adjusts the top margin */
}

/* Styles for the body containing person name and role */
.card-body {
    color: #000022;
    /* Sets the text color */
    text-align: center;
    /* Centers the text horizontally */
}

/* Styles for the person name */
.card-title {
    margin-top: 0.7em;
    /* Adjusts the top margin */
    margin-bottom: 0.5em;
    font-weight: bold;
    /* Sets the font weight to bold */
    font-size: 1.5em;
    /* Sets the font size */
    color: #000022;
    /* Sets the text color */
}

/* Styles for the person role */
.card-subtitle {
    font-weight: lighter;
    /* Sets the font weight to lighter */
    font-size: 1.2em;
    /* Sets the font size */
    margin-bottom: 1em;
}

/* Styles for the Linkedin icon */
.card-img-linkedin {
    width: 40px;
    /* Sets the width of the LinkedIn icon */
}

/* Styles for the card footer */
.card-footer {
    background-color: #086788;
    /* Sets the background color */
    font-size: 1.0em;
    /* Sets the font size */
    margin-top: -1em;
    /* Adjusts the top margin */

}

/* Styles for the card description */
.card-Description {
    color: #FFFBFA;
    /* Sets the text color */
    text-align: center;
    /* Centers the text horizontally */
    font-size: 0.75em;
    /* Sets the font size */
    margin-top: 0.4em;
    /* Adjusts the top margin */
    height: 5em;
    /* Sets the height of the element */
}

/* Styles for the "Learn more" button */
.card-btn {
    display: block;
    width: 50%;
    padding: 0.2rem;
    font-size: 0.9rem;
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
    margin-bottom: 2.5rem;
    top: 50%;
    left: 50%;
    transform: translate(-100%, -150%);
}

/* Hover and active state styles for the button */
.card-btn:hover,
.card-btn:active {
    background-color: rgb(180, 205, 214);
    /* Changes the background color on hover and click */
}

/* Hover effect for the card */
.card:hover {
    transform: translateY(-0.5%);
    box-shadow: 0 4rem 8rem rgba(0, 0, 34, 0.5);
}
</style>