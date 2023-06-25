<!-- Import necessary utilities and components -->
<script setup lang="js">
import { makeCall } from '@/utils/common'
import ProjectCard from '@/components/ProjectCard.vue'
import PeopleCard from '@/components/PeopleCard.vue'

useSeoMeta({
    title: 'Home - HyperMeow',
    description: 'Discover our leading venture capital firm and discover our services and offers, our team, our projects and the areas that we cover. Contact us to have answers or to join our projects',
    keywords: 'home, who we are, what we do, unicorns, founder in residence, team, our people, hypermeow, venture capital, contact us, areas, project areas, email',
})
</script>

<template>
    <main>
        <!-- Custom row with introductory statement and a call to action -->
        <div class="custom-row" style="min-height: 60em; padding-bottom: 10em;">
            <div class="title col-md-5">Unleashing Innovation, Powering Growth</div>
            <div class="subtitle col-md-4">
                Dedicated to fueling innovation and driving growth.
                We collaborate with visionary entrepreneurs and disruptive startups igniting breakthrough technologies and
                ideas, empowering the next generation of game-changers.</div>
            <div class="col-md-4 mx-3 d-flex justify-content-start">
                <nuxt-link to="/about" tag="button" type="button" class="custom-btn d-flex">
                    <b>About us</b>
                </nuxt-link>
            </div>
        </div>
        <!-- Presenting a statement about the company and its mission -->
        <div class="col-md-7 d-flex justify-content-center mx-auto">
            <h3 class="custom-bold" style="text-align: center; margin-top:2.5em;">HyperMeow is a global investment leader,
                <p class="custom-bold">reshaping opportunities in Italy and beyond with unprecedented growth.</p>
            </h3>
        </div>
        <!-- Section providing more details about the company's vision and goals -->
        <div class="col-md-6 custom-margin justify-content-center mx-auto" style="text-align:justify; font-size:1.3em;">
            <p>For over 50 years, we have been partnering with businesses, organizations, and institutions, assisting them
                in overcoming their most complex challenges, creating value, and accelerating their growth through
                sustainable and inclusive transformation processes.</p>
            <p>We are dedicated to contributing to the development of the communities we serve and safeguarding our planet
                through research projects in social, technological, healthcare, and environmental domains.</p>
            <p>We ensure equal opportunities for professional growth for all individuals working with us, promoting the
                values of diversity, inclusion, and meritocracy. </p>
        </div>
        <!-- Highlighting company's achievements -->
        <div class="row mx-3 d-flex justify-content-center sm-separator">
            <div class="col-md-6 rounded mb-3 text-center">
                <div class="row" style="font-size: 7em;">
                    <p class="custom-bold" style="font-family:'Times New Roman', Times, serif;">1000+</p>
                </div>
                <div class="row">
                    <p class="custom-bold-num">Founders in Residence</p>
                </div>
            </div>
            <div class="col-md-6 rounded mb-3 text-center">
                <div class="row" style="font-size: 7em;">
                    <p class="custom-bold" style="font-family:'Times New Roman', Times, serif;">5</p>
                </div>
                <div class="row">
                    <p class="custom-bold-num">Incubated Unicorns</p>
                </div>
            </div>
        </div>
        <hr class="color-line" style="width: 70%; margin: 0 auto;">
        <!-- Featured projects section, with each project presented using ProjectCard component -->
        <div class="row mx-3 justify-content-center separator-margin">
            <h1 style="text-align: center; color: #000022;"> Featured Projects </h1>
        </div>
        <br>
        <div class="row mx-3 d-flex justify-content-center">
            <div v-if="projects.length > 0" class="row mx-3 justify-content-center">
                <div v-for="project in projects" class="col mb-3 d-flex justify-content-center">
                    <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                        :stage="project.stage" :areas="project.areas" :year="project.year" :featured="project.featured" />
                </div>
            </div>
            <div v-else class="d-flex justify-content-center">
                <div class="spinner-border m-5" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        </div>
        <br>
        <div class="row mx-3 d-flex justify-content-center">
            <nuxt-link to="/projects" tag="button" type="button" class="btn btn-secondary d-flex justify-content-center">
                <b>All projects</b>
            </nuxt-link>
        </div>
        <!-- Our People section presented on a colored background -->
        <div class="separator-margin py-5 " style="background-color: #D9D9D9;">
            <div class="row mx-3 justify-content-center">
                <h1 style="text-align: center; color: #000022; "> Our People </h1>
            </div>
            <br>
            <div class="row mx-3 d-flex justify-content-center">
                <div v-if="people.length > 0" class="row mx-3 justify-content-center">
                    <div v-for="person in people.slice(0, 3)" class="col mb-3 d-flex justify-content-center">
                        <PeopleCard :personid="person.personid" :name="person.name" :surname="person.surname"
                            :age="person.age" :linkedin="person.linkedin" :Description="person.Description"
                            :role="person.role" />
                    </div>
                </div>
                <div v-else class="d-flex justify-content-center">
                    <div class="spinner-border m-5" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>

            <br>
            <div class="row mx-3 d-flex justify-content-center" style="margin-top:2em;">
                <nuxt-link to="/people" tag="button" type="button" class="btn btn-secondary d-flex justify-content-center">
                    <b>All people</b>
                </nuxt-link>
            </div>
        </div>
        <!-- A brief on areas that the company explored -->
        <div style="background-color:#FFF">
            <div class="row justify-content-center custom-bold" style="margin-top: 2em;"></div>
            <h1 style="text-align: center; color: #000022; "> Areas that we explored </h1>
            <div class="row image-wood" style="min-height: 60em;">
                <div class="title-a col-md-5" style="line-height: 103%;">Investing in Healthcare, Ecosustainability,
                    Technology, and Growth.</div>
                <div class="subtitle-a col-md-4">From revolutionizing healthcare to championing ecosustainability,
                    leveraging technology, and fostering growth, we are at the forefront of driving innovation.
                    <p>Join us on our mission to shape the future of these dynamic industries.</p>
                </div>
                <div class="col-md-4 mx-md-3 mx-sm-1 d-flex">
                    <nuxt-link to="/areas" tag="button" type="button" class="custom-btn-a d-flex">
                        <b>All areas</b>
                    </nuxt-link>
                </div>
            </div>
        </div>
        <!-- A final call to contact us -->
        <div style="background-color:#000022">
            <div class="custom-row-c">
                <div class="content-right">
                    <div class="title-c col-md-5" style="line-height: 98%;">Ready to Transform Your Future? Let's <strong>
                            Connect.</strong></div>
                    <div class="col-md-4 mx-3 d-flex">
                        <nuxt-link to="/contacts" tag="button" type="button" class="custom-btn-c d-flex">
                            <b>Contact us</b>
                        </nuxt-link>
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>

<!-- The script section where the data and components are initialized -->
<script lang="js">
export default {
    // Initial data
    data() {
        return {
            projects: [],
            people: [],
        }
    },

    // Declare the components used in this file
    components: {
        ProjectCard,
        PeopleCard,
    },

    // Fetch data once the component is created
    created() {
        this.getData()
    },

    methods: {
        // Method to fetch data from the server
        async getData() {
            try {
                // Fetch data for projects and people
                const projectsData = await makeCall(this.$config.public.SERVER_URL + "/getFeaturedProjects", 'GET');
                const peopleData = await makeCall(this.$config.public.SERVER_URL + "/getPeople", 'GET');

                // Log fetched data
                console.log(projectsData);
                console.log(peopleData);

                // Assign fetched data to projects and people data properties
                this.projects = projectsData;
                this.people = peopleData;
            } catch (error) {
                // Handle any errors during the fetch operation
                console.error("Error while fetching data")
                console.error(error);
            }
        }
    }
}
</script>

<style scoped>
/* Define style for a custom row */
.custom-row-c {
    position: relative;
    min-height: 40em;
    /* The minimum height of the row */
    margin-top: -25em;
    /* Move the row up by 25em */
    padding-bottom: 10em;
    /* Add padding at the bottom of the row */
}

/*to color the line between numbers and projects*/
.color-line {
    color: #000022;

}

/* Define the ::before pseudo-element for the custom row */
.custom-row-c::before {
    content: "";
    /* No content inside the pseudo-element */
    position: absolute;
    /* Positioning is absolute to its nearest positioned ancestor */
    top: 0;
    /* Position the top edge at the top edge of the parent element */
    /* Shift the element 50px to the left */
    height: 100%;
    /* The element should take up the full height of the parent */
    max-width: calc(100vw);
    /* Calculate the width based on the full viewport */
    width: 100%;
    background-image: url('/images/index/contact.gif');
    /* Set the background image of the element */
    background-position: left;
    /* Center the background image */
    background-repeat: no-repeat;
    /* Do not repeat the background image */
    background-size: cover;
    /* Resize the background image to cover the entire element */
}

/* Define styles for different viewport widths */
/* For viewport widths less than or equal to 986px */
@media(max-width: 986px) {
    .custom-row-c {
        position: relative;
        min-height: 60em;
        margin-top: -18em;
        /* Adjust the margin-top */
        padding-bottom: 10em;
    }
}

/* For viewport widths less than or equal to 860px */
@media(max-width: 860px) {
    .custom-row-c {
        position: relative;
        min-height: 60em;
        margin-top: -13em;
        /* Adjust the margin-top */
        padding-bottom: 10em;
    }
}

/* For viewport widths less than or equal to 770px */
@media(max-width: 770px) {
    .custom-row-c {
        position: relative;
        min-height: 60em;
        margin-top: -20em;
        /* Adjust the margin-top */
        padding-bottom: 10em;
    }
}

/* For viewport widths less than or equal to 640px */
@media(max-width: 640px) {
    .custom-row-c {
        position: relative;
        min-height: 60em;
        margin-top: -15em;
        /* Adjust the margin-top */
        padding-bottom: 10em;
    }

}

/* For viewport widths less than or equal to 570px */
@media(max-width: 570px) {
    .custom-row-c {
        position: relative;
        min-height: 60em;
        margin-top: -10em;
        /* Adjust the margin-top */
        padding-bottom: 10em;
    }
}

/* For viewport widths less than or equal to 450px */
@media(max-width: 450px) {
    .custom-row-c {
        position: relative;
        min-height: 60em;
        margin-top: -5em;
        /* Adjust the margin-top */
        padding-bottom: 10em;
    }
}

/* For viewport widths less than or equal to 425px */
@media(max-width: 425px) {
    .custom-row-c {
        position: relative;
        min-height: 60em;
        margin-top: 0em;
        /* Adjust the margin-top */
        padding-bottom: 10em;
    }
}

/* For viewport widths less than or equal to 372px */
@media(max-width: 372px) {
    .custom-row-c {
        position: relative;
        min-height: 60em;
        margin-top: 5em;
        /* Adjust the margin-top */
        padding-bottom: 10em;
    }

}

/* CSS for content to be placed on the right side of the page */
.content-right {
    position: absolute;
    top: 0;
    right: 0;
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    /* aligns the items to the right */
}

/* CSS for a custom row layout */
.custom-row {
    position: relative;
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    margin-top: -4em;
}

/* Styling for ::before pseudo-element of custom-row */
.custom-row::before {
    content: "";
    position: absolute;
    top: 0;
    height: 100%;
    max-width: calc(100vw);
    /* Full viewport */
    width: 100%;
    background-image: url('/images/index/plant.webp');
    background-position: end;
    /* Center the image */
    background-repeat: no-repeat;
    /* Do not repeat the image */
    background-size: cover;
    /* Resize the background image to cover the entire container */
}

/* CSS to extend the background beyond the container bounds */
.background-extender {
    padding-left: 100px;
    padding-right: 100px;
}

/* CSS to display a small background image */
.image-wood {
    background-image: url("/images/index/wood.webp");
    background-repeat: no-repeat;
    background-position-x: right;
    flex-direction: column;
    display: flex;
    flex-wrap: wrap;
    margin-right: 0;
    margin-left: 0;
}

/* CSS to create a space at the top of an element */
.separator-margin {
    margin-top: 80px;
}

/* CSS to create a smaller space at the top of an element */
.custom-margin {
    margin-top: 15px;
}

/* CSS for responsive design - when screen width is up to 768px */
@media (max-width: 768px) {
    .separator-margin {
        margin-top: 40px;

    }

    .custom-margin {

        padding-left: 50px;
        padding-right: 50px;
        margin-top: 15px;

    }

    .custom-bold {
        padding-left: 20px;
        padding-right: 20px;
    }

}

/* CSS for responsive design - when screen width is up to 480px */
@media (max-width: 480px) {
    .separator-margin {
        margin-top: 15px;

    }

    .custom-margin {
        margin-top: 15px;
    }

}

/* CSS to make an element rounded */
.rounded {
    border-radius: 75%;
}

/* CSS to center and bold text, and change its color */
.custom-bold {
    text-align: center;
    font-weight: bold;
    color: #000022;
}

/* CSS to change text size, bold it, and change its color */
.custom-bold-num {
    font-size: 1.5em;
    margin-top: -2em;
    font-weight: bold;
    color: #000022;
}

/* CSS to style secondary button */
.btn-secondary {
    width: 30%;
    background-color: #086788;
    margin-top: 2%;
    font-size: 1.3em;
}

.btn-secondary:hover,

.btn-secondary:active {
    background-color: rgb(13, 79, 106);
}

/* CSS for the title styling */
.title {
    max-width: 60%;
    text-align: start;
    margin-left: 3.5em;
    margin-top: 4.8em;
    color: snow;
    line-height: 1.1em;
}

/* CSS for areas title styling */
.title-a {
    font-size: 2em;
    text-align: start;
    font-weight: bolder;
    color: #000022;
    margin-top: 2.5em;
    margin-left: 3.5em;
    max-width: 60%;

}

/* CSS for contact us title styling */
.title-c {
    font-size: 3em;
    text-align: end;
    color: snow;
    margin-top: 4.5em;
    margin-right: 2em;
    max-width: 60%;

}

/* CSS for subtitles styling */
.subtitle {
    max-width: 45%;
    text-align: start;
    margin-top: 2em;
    margin-left: 9.5em;
    color: snow;
    font-size: 1.3em;

}

/* CSS for areas subtitles styling */
.subtitle-a {
    max-width: 45%;
    text-align: start;
    margin-top: 2em;
    margin-left: 5.5em;
    color: #000022;
    font-size: 1.3em;

}

/* Custom button style */
.custom-btn {
    display: inline-block;
    /* Sets how to display the button */
    padding: .375rem .75rem;
    /* Sets padding inside the button */
    vertical-align: middle;
    /* Sets vertical alignment of the button */
    user-select: none;
    /* Prevents the user from selecting the text */
    width: auto;
    /* Auto adjust the width */
    font-size: 1rem;
    /* Font size of the button text */
    font-weight: 450;
    /* Weight of the font */
    text-align: center;
    /* Horizontal alignment of the button text */
    align-items: start;
    /* Vertical alignment of the button content */
    color: #000022;
    /* Color of the button text */
    background-color: #E5E5E5;
    /* Background color of the button */
    border: none;
    /* Removes the border */
    border-radius: 0.4rem;
    /* Makes the button corners rounded */
    transition: 0.2s;
    /* Animation effect to slowly change from one style to another */
    cursor: pointer;
    /* Changes the cursor to a pointer when hovering over the button */
    letter-spacing: 0.1rem;
    /* Space between each letter */
    justify-content: start;
    /* Horizontal alignment of the button content */
    margin-top: 3em;
    /* Top margin */
    margin-left: 10.5em;
    /* Left margin */

}

.custom-btn:hover,


.custom-btn:active {
    background-color: rgb(180, 205, 214);
}

/* Custom style for areas button*/
.custom-btn-a {
    display: inline-block;
    padding: .375rem .75rem;
    vertical-align: middle;
    user-select: none;
    width: auto;
    font-size: 1rem;
    font-weight: 450;
    text-align: center;
    align-items: start;
    color: #E5E5E5;
    background-color: #086788;
    border: none;
    border-radius: 0.4rem;
    transition: 0.2s;
    cursor: pointer;
    letter-spacing: 0.1rem;
    justify-content: start;
    margin-top: 1em;
    margin-left: 5.5em;

}

.custom-btn-a:hover,


.custom-btn-a:active {
    background-color: rgb(13, 79, 106);
}

/* Custom style for contact us button*/
.custom-btn-c {
    display: flex;
    justify-content: center;
    align-items: center;
    width: auto;
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 450;
    color: #E5E5E5;
    background-color: #086788;
    border: none;
    border-radius: 0.4rem;
    transition: 0.2s;
    cursor: pointer;
    letter-spacing: 0.1rem;
    margin-top: 2em;
    margin-left: auto;
    margin-right: 5em;

}

.custom-btn-c:hover,


.custom-btn-c:active {
    background-color: rgb(13, 79, 106);
}

/* CSS rules for screen widths up to 725px */
@media(max-width: 725px) {
    .title {
        max-width: 50%;
        text-align: start;
        align-items: start;
        margin-left: 2em;
        margin-top: 3.5em;
        color: snow;

    }

    .subtitle {
        max-width: 45%;
        text-align: start;
        align-items: start;
        margin-top: 1.5em;
        margin-left: 5.5em;
        color: snow;
        font-size: 1.3em;

    }

    .custom-btn {
        display: inline-block;
        padding: .375rem .75rem;
        vertical-align: middle;
        user-select: none;
        width: auto;
        font-size: 1rem;
        font-weight: 450;
        text-align: start;
        align-items: start;
        color: #000022;
        background-color: #E5E5E5;
        border: none;
        border-radius: 0.4rem;
        transition: 0.2s;
        cursor: pointer;
        letter-spacing: 0.1rem;
        justify-content: start;
        margin-top: 1.5em;
        margin-left: 5.5em;

    }

    .custom-btn-a {
        display: inline-block;
        padding: .375rem .75rem;
        vertical-align: middle;
        user-select: none;
        width: auto;
        font-size: 1rem;
        font-weight: 450;
        text-align: start;
        align-items: start;
        color: #E5E5E5;
        background-color: #086788;
        border: none;
        border-radius: 0.4rem;
        transition: 0.2s;
        cursor: pointer;
        letter-spacing: 0.1rem;
        justify-content: start;
        margin-top: 1em;
        margin-left: 5.5em;

    }

    .custom-btn-c {
        display: flex;
        justify-content: center;
        align-items: center;
        width: auto;
        padding: .375rem .75rem;
        font-size: 1rem;
        font-weight: 450;
        color: #E5E5E5;
        background-color: #086788;
        border: none;
        border-radius: 0.4rem;
        transition: 0.2s;
        cursor: pointer;
        letter-spacing: 0.1rem;
        margin-top: 1.5em;
        margin-left: auto;
        margin-right: 5em;

    }
}

/* CSS rules for screen widths up to 560px */
@media(max-width: 560px) {
    .title {
        max-width: 50%;
        text-align: start;
        align-items: start;
        margin-left: 2em;
        margin-top: 3em;
        color: snow;

    }

    .subtitle {
        max-width: 45%;
        text-align: start;
        align-items: start;
        margin-top: 1em;
        margin-left: 5.5em;
        color: snow;
        font-size: 1.3em;

    }

    .custom-btn {
        display: inline-block;
        padding: .375rem .75rem;
        vertical-align: middle;
        user-select: none;
        width: auto;
        font-size: 1rem;
        font-weight: 450;
        text-align: start;
        align-items: start;
        color: #000022;
        background-color: #E5E5E5;
        border: none;
        border-radius: 0.4rem;
        transition: 0.2s;
        cursor: pointer;
        letter-spacing: 0.1rem;
        margin-top: 1em;
        justify-content: center;
    }

    .custom-btn-a {
        display: inline-block;
        padding: .375rem .75rem;
        vertical-align: middle;
        user-select: none;
        width: auto;
        font-size: 1rem;
        font-weight: 450;
        text-align: start;
        align-items: start;
        color: #E5E5E5;
        background-color: #086788;
        border: none;
        border-radius: 0.4rem;
        transition: 0.2s;
        cursor: pointer;
        letter-spacing: 0.1rem;
        margin-top: 0.5em;
        margin-left: 5.5em;

        justify-content: center;
    }

    .custom-btn-c {
        display: flex;
        justify-content: center;
        align-items: center;
        width: auto;
        padding: .375rem .75rem;
        font-size: 1rem;
        font-weight: 450;
        color: #E5E5E5;
        background-color: #086788;
        border: none;
        border-radius: 0.4rem;
        transition: 0.2s;
        cursor: pointer;
        letter-spacing: 0.1rem;
        margin-top: 1em;
        margin-left: auto;
    }
}
</style>