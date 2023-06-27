<script setup lang="js">
// Importing necessary modules and components
import { makeCall } from '@/utils/common'
import ProjectCard from '@/components/ProjectCard.vue'
import PeopleCard from '@/components/PeopleCard.vue'

useSeoMeta({
    title: 'About us - HyperMeow',
    description: 'Learn more about our leading venture capital firm and our commitment to fostering groundbreaking ideas and innovation, discover our team and our innovative projects',
    keywords: 'about us, hypermeow, hypermeow about us, hypermeow projects, hypermeow people, team, who we are, investments, unicorns, startup, testimonials',
})
</script>

<template>
    <main>
        <!-- Header Row -->
        <div class="row mx-3 d-flex justifyWhenNeeded">
            <div class="title">About us</div>
        </div>
        <!-- Row with custom margins and separator-->
        <div class="separator-margin py-5 " style="background-color: #9991A1;">
            <div class="row justify-content-center separator-margin custom-margins">
                <div class="col-md-9 d-flex align-items-center justify-content-center">
                    <h3 class="custom-h3" style="text-align:center; line-height: 100%; font-size: 2em;">
                        Embracing novel ideas, fueling unprecedented
                        innovations, and
                        committing to the creation of a future where sustainability is not just a concept, but an
                        established practice.
                    </h3>
                </div>
            </div>
        </div>
        <!-- Row with mission text and image -->
        <div class="row d-flex justify-content-center margin-t-1 custom-margins-l">
            <!-- Mission Text Column -->
            <div class="col-md-7 my-3 justify-content-center text-style px-5">
                <!-- Detailed information about company -->
                <div class="my-auto">
                    We are a <strong>leading venture capital firm</strong> with a clear focus: to <strong>support and
                        foster groundbreaking ideas</strong> that have the potential to <strong>disrupt the
                        market</strong> and contribute to a <strong>sustainable future</strong>. Since our
                    establishment, we have guided <strong>countless startups</strong> to <strong>scale, innovate, and
                        thrive</strong>.
                </div>
                <br>
                <div class="my-auto">
                    Our belief is firm: <strong>innovation disrupts</strong> and sparks growth. In startups, it's not
                    just about capital, but also <strong>guidance, mentorship, and valuable connections</strong>. We
                    offer a rich support ecosystem that empowers these budding enterprises, providing resources like
                    <strong>strategic advisory</strong> and <strong>infrastructural assistance</strong>. These tools
                    help them traverse their challenging entrepreneurial journey with <strong>confidence and
                        skill</strong>.
                </div>
                <br>
                <div class="my-auto">
                    Our success stories mirror our expertise and dedication in nurturing the market disruptors of
                    tomorrow. In this fluctuating landscape, we stand firm in our mission: <strong>fostering a
                        sustainable future through innovation and growth</strong>.
                </div>
            </div>
            <!-- Image Column -->
            <div class="col-md-5 my-3 d-flex justify-content-center">
                <img class="card-img-top rounded" style="width: 90%; object-fit: cover;" src="/images/about/usCats.webp"
                    alt="">
            </div>
        </div>
        <!-- Row with the VC achievements -->
        <div class="row  justify-content-center separator-margin custom-margins">
            <div class="col-md-6 rounded mb-3 text-center">
                <div class="row" style="font-size: 8.75em;">
                    <p class="custom-bold-1" style="font-family:'Times New Roman', Times, serif;">100+</p>
                </div>
                <div class="row">
                    <p class="custom-bold-num">Startups Funded</p>
                </div>
            </div>
            <div class="col-md-6 rounded mb-3 text-center r-shifter-margin">
                <div class="row" style="font-size: 8.75em;">
                    <p class="custom-bold-1" style="font-family:'Times New Roman', Times, serif;">500M</p>
                </div>
                <div class="row">
                    <p class="custom-bold-num">Total Capital Deployed</p>
                </div>
            </div>
        </div>
        <!-- Row with investment approach and related image -->
        <div class="row d-flex justify-content-center separator-margin custom-margins-r">
            <div class="row text2right text-style">
                <h3> <b> Our Investment Approach </b></h3>
            </div>
            <div class="row">
                <div class="col-md-5 my-3 d-flex justify-content-center">
                    <img class="card-img-top rounded" style="width: 70%; object-fit: cover;" src="/images/about/invest.webp"
                        alt="">
                </div>
                <div class="col-md-7 text-right my-3 text-style pl-5">
                    <div> Our investment strategy is centered around the <strong>discovery and support of startups</strong>
                        that are not only viable but <strong>transformative</strong>. We provide our portfolio companies
                        with the <strong>capital, resources, and strategic guidance</strong> they need to achieve their full
                        potential.</div>
                    <br>
                    <div> Our perspective is global, our approach, personalized. We are firm believers in the <strong>power
                            of diversity</strong>, both in sectors and geography. Our portfolio reflects this. We invest in
                        a broad range of industries, from technology to healthcare, energy to education. It's not just about
                        numbers for us; it's about the <strong>impact</strong>, the <strong>transformation</strong>. Our
                        partnership with these startups is a journey, a <strong>shared vision for a future</strong> where
                        technology and innovation bring about a widespread change.</div>
                </div>
            </div>
        </div>
        <!-- Row with investment philosophy -->
        <div class="row mx-3 justify-content-center custom-top-margin custom-margins text-style">
            <div class="col-md-6 separator-margin" style="text-align: center;">
                <h3 class="custom-bold" style="font-size: 1.5em;">“Investing in the future does not only mean foreseeing the
                    future, but creating it”
                </h3>
            </div>
            <div class="col-md-8 justify-content-center separator-margin" style="text-align: justify;">
                <div> We believe that <strong>venture capital is not just about money</strong>. It's about
                    <strong>building relationships</strong>, providing guidance, and supporting our portfolio companies
                    every step of the way. We are committed to this philosophy and strive to make a difference in the
                    startup ecosystem.
                </div>
                <br>
                <div> We view venture capital as a <strong>catalyst for transformation and growth</strong>. It's about
                    <strong>empowering startups</strong>, fostering creativity, and promoting sustainable practices.
                    This commitment shapes our actions and initiatives, reinforcing our aim to become a <strong>positive
                        force in the entrepreneurial landscape</strong>.
                </div>
            </div>
        </div>
        <!-- Featured Portfolio Section -->
        <div class="row portfolio-margin custom-margins justify-content-center">
            <!-- Title -->
            <div class="row mx-3 justify-content-center">
                <h1 style="text-align: center;color: #000022;"> Featured Portfolio </h1>
            </div>
            <br>
            <!-- Portfolio Cards -->
            <div class="row d-flex justify-content-center custom-margins">
                <div v-if="projects.length > 0" class="row mx-3">
                    <div v-for="project in projects" class="col mb-3">
                        <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                            :stage="project.stage" :areas="project.areas" :year="project.year"
                            :featured="project.featured" />
                    </div>
                </div>
                <div v-else-if="!queryErrorProjects" class="d-flex justify-content-center">
                    <div class="spinner-border m-5" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
                <div v-else class="container-text-center">
                    <div class="error">There was an error while fetching projects</div>
                    <div class="error-subtitle">Contact the website owner at teamHyperMeow@gmail.com</div>
                    <div class="icon"><i class="bi bi-emoji-frown"></i></div>
                </div>
            </div>
            <br>
            <div class="row mx-3 d-flex justify-content-center custom-margins">
                <nuxt-link to="/projects" tag="button" type="button" class="btn btn-secondary">
                    <b>Explore projects</b>
                </nuxt-link>
            </div>
        </div>
        <!-- Meet Our Team Section -->
        <div class="row custom-margins portfolio-margin justify-content-center">
            <div class="row mx-3 justify-content-center">
                <h1 style="text-align: center; color: #000022;"> Meet Our Team </h1>
            </div>
            <br>
            <div class="row mx-3 d-flex justify-content-center custom-margins">
                <div v-if="people.length > 0" class="row mx-3">
                    <div v-for="person in people.slice(0, 3)" class="col mb-3 d-flex justify-content-center">
                        <PeopleCard :personid="person.personid" :name="person.name" :surname="person.surname"
                            :age="person.age" :linkedin="person.linkedin" :Description="person.Description"
                            :role="person.role" />
                    </div>
                </div>
                <div v-else-if="!queryErrorPeople" class="d-flex justify-content-center">
                    <div class="spinner-border m-5" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
                <div v-else class="container-text-center">
                    <div class="error">There was an error while fetching people</div>
                    <div class="error-subtitle">Contact the website owner at teamHyperMeow@gmail.com</div>
                    <div class="icon"><i class="bi bi-emoji-frown"></i></div>
                </div>
            </div>
            <br>
            <div class="row mx-3 d-flex justify-content-center custom-margins">
                <nuxt-link to="/people" tag="button" type="button" class="btn btn-secondary">
                    <b>Meet the team</b>
                </nuxt-link>
            </div>
        </div>
        <!-- Testimonials Section -->
        <div class="row mx-3 testimonial-margin custom-margins text-style ">
            <h1 style="text-align: center;"> Testimonials </h1>
        </div>
        <br>
        <div class="row mx-3 justify-content-center bottom-margin custom-margins testimonial-text">
            <div class="col-md-3 mx-auto my-3 d-flex flex-column" style="text-align: center;">
                <div class="quote">
                    “The guidance and resources we received from the team were invaluable to our success”
                </div>
                <div class="author mt-1">
                    <b> - Portfolio Company CEO</b>
                </div>
            </div>
            <div class="col-md-3 mx-auto my-3 d-flex flex-column" style="text-align: center;">
                <div class="quote">
                    “They've provided more than capital, they've been a true partner in our journey”
                </div>
                <div class="author mt-1">
                    <b> - Startup Founder</b>
                </div>
            </div>
            <div class="col-md-3 mx-auto my-3 d-flex flex-column" style="text-align: center;">
                <div class="quote">
                    “Their strategic insights and industry connections have been instrumental”
                </div>
                <div class="author mt-1">
                    <b> - Portfolio Company COO</b>
                </div>
            </div>
        </div>
    </main>
</template>
<script lang="js">
export default {
    // Defining data properties for the component
    data() {
        return {
            projects: [],  // This will hold the projects data
            people: [],    // This will hold the people data
            queryErrorProjects: false,  // This will be set to true if there is an error while fetching projects
            queryErrorPeople: false,    // This will be set to true if there is an error while fetching people
        }
    },

    // Registering the child components used in this component
    components: {
        ProjectCard,
        PeopleCard,
    },

    // Lifecycle hook that gets called after the instance has been created
    created() {
        // Fetch the initial data
        this.getData()
    },

    methods: {
        // Method to fetch data from the server
        async getData() {
            try {
                // Making a GET request to get the featured projects data
                const projectsData = await makeCall(this.$config.public.SERVER_URL + "/getFeaturedProjects", 'GET');

                // Log the received data
                console.log(projectsData);

                // Assigning the fetched data to the component's data properties
                this.projects = projectsData;
            } catch (error) {
                // Alert user about error and log error to console
                console.error("Error while fetching projects")
                console.error(error);
                this.queryErrorProjects = true;
            }

            try {
                // Making a GET request to get the people data
                const peopleData = await makeCall(this.$config.public.SERVER_URL + "/getPeople", 'GET');

                // Log the received data
                console.log(peopleData);

                // Assigning the fetched data to the component's data properties
                this.people = peopleData;
            } catch (error) {
                // Alert user about error and log error to console
                console.error("Error while fetching people")
                console.error(error);
                this.queryErrorPeople = true;
            }
        }
    }
}
</script>

<style scoped>
/* A class for styling text elements */
.text-style {
    font-size: 1.5em;
    /* Font size is 1.5 times the base size */
    line-height: 105%;
    /* Line height is 105% of the font size */
    color: #000022;
    text-align: justify;

}


/* A class for setting a top margin of 120px */
.margin-t-1 {
    margin-top: 120px;
}

/* A class for setting left and right margins */
.custom-margins {
    margin-left: 100px;
    margin-right: 100px;
}

/* A class for setting left and right margins (left > right) */
.custom-margins-l {
    margin-left: 150px;
    margin-right: 100px;
}

/* A class for setting left and right margins (right > left) */
.custom-margins-r {
    margin-left: 100px;
    margin-right: 150px;
}

/* A class to manager the right display of the big numbers, shifting one to the right */
.r-shifter-margin {
    margin-left: 0px;
}

@media(max-width: 860px) {
    .r-shifter-margin {
        margin-left: 20px;
    }
}

@media(max-width: 859px) {
    .r-shifter-margin {
        margin-left: 0px;
    }
}

/* A class for large headings */
.title {
    font-size: 3.5em;
    color: #000022;
    text-align: center
}


@media(max-width: 768px) {
    .title {
        font-size: 3.5em;

        color: #000022;
        text-align: center;


    }

    /* A class to justify the content only incertain dimensions */
    .justifyWhenNeeded {
        justify-content: center;
    }
}

/* A class for setting a smaller top margin */
.separator-margin {
    margin-top: 80px;
}

/* A class for setting a bottom margin */
.bottom-margin {
    margin-bottom: 100px;
}

/* A class for styling testimonials with a larger top margin */
.testimonial-margin {
    margin-top: 140px;
}

/* A class for styling portofolio with a large top margin */
.portfolio-margin {
    margin-top: 140px;
}

/* A class for styling the text within testimonials */
.testimonial-text {
    font-size: 1.6em;
    line-height: 100%;
}

/* A class for aligning text to the right */
.text2right {
    text-align: end;
}

/* Media query for screens up to 768px wide */
@media (max-width: 768px) {

    /* Adjust margins and alignment for smaller screens */
    .custom-margins {
        margin-left: 50px;
        margin-right: 50px;
    }

    .custom-margins-l {
        margin-left: 75px;
        margin-right: 50px;
    }

    .custom-margins-r {
        margin-left: 50px;
        margin-right: 75px;
    }

    .margin-t-1 {
        margin-top: 60px;
    }

    .separator-margin {
        margin-top: 40px;
    }

    .bottom-margin {
        margin-bottom: 80px;
    }

    .testimonial-margin {
        margin-top: 60px;
    }

    .portfolio-margin {
        margin-top: 65px;
    }

    /* Center align text on smaller screens */
    .text2right {
        text-align: center;
    }

}

/* Media query for screens up to 480px wide */
@media (max-width: 480px) {

    /* Further adjust margins for even smaller screens */
    .custom-margins {
        margin-left: 20px;
        margin-right: 20px;
    }

    .custom-margins-l {
        margin-left: 30px;
        margin-right: 20px;
    }

    .custom-margins-r {
        margin-left: 20px;
        margin-right: 30px;
    }


    .margin-t-1 {
        margin-top: 30px;
    }

    .separator-margin {
        margin-top: 15px;
    }

    .bottom-margin {
        margin-bottom: 40px;
    }

    .testimonial-margin {
        margin-top: 50px;
    }

    .portfolio-margin {
        margin-top: 40px;
    }

}

/* A class for h3 elements with larger font size, bold, and specific color */
.custom-h3 {
    font-size: 1.75em;
    font-weight: 400;
    color: snow;
    margin-top: -2.5em;
    font-style: italic;
}

@media(max-width: 768px) {
    .custom-h3 {
        font-size: 1.75em;
        font-weight: 700;
        color: snow;
        margin-top: -1em;
    }
}

/* A class for bold text with a specific color */
.custom-bold {
    font-weight: bold;
    color: #086788;
    font-size: 1.75em;
}

/* A class for bold text with a specific color and alignment */
.custom-bold-1 {
    text-align: center;
    font-weight: bold;
    color: #000022;

}

/* A class for bold text with a specific color, size and margin */
.custom-bold-num {
    font-size: 1.5em;
    margin-top: -2em;
    font-weight: bold;
    color: #000022;

}

/* A class for making elements round */
.rounded {
    border-radius: 75%;

}

/* A class for aligning text to the right */
.text-right {
    text-align: right;
    text-align: justify;
}


/* A class for styling a secondary button */
.btn-secondary {
    width: 30%;
    background-color: #086788;
    margin-top: 2%;

}

.btn-secondary:hover,

.btn-secondary:active {
    background-color: rgb(13, 79, 106);
}
</style>
