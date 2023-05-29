<script setup lang="ts">
import { makeCall } from '@/utils/common'
import ProjectCard from '@/components/ProjectCard.vue'
import PeopleCard from '@/components/PeopleCard.vue'
</script>

<template>
    <main>
        <div class="container-fluid">
            <div class="row custom-heading">
                About us
            </div>
            <br>
            <br>
            <div class="row mx-3 justify-content-center">
                <div class="col-md-6 d-flex align-items-center justify-content-center">
                    <h3 style="text-align:center;"> <b>“Embracing novel ideas, fueling unprecedented innovations, and
                            committing to the creation of a future where sustainability is not just a concept, but an
                            established practice.”</b></h3>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <div class="row mx-3">
                <div class="col-md-6 my-3">
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
                <div class="col-md-6 my-3">
                    <img class="card-img-top rounded" src="/images/about/usCats.webp" alt="Our Team">
                </div>
            </div>
            <div class="row my-5"></div>
            <div class="row mx-3 justify-content-center">
                <div class="col-md-5 rounded mb-3 text-center">
                    <div class="row" style="font-size: 3.5em;">
                        <b>100+</b>
                    </div>
                    <div class="row">
                        <b>Startups Funded</b>
                    </div>
                </div>
                <div class="col-md-2"></div>
                <div class="col-md-5 rounded mb-3 text-center">
                    <div class="row" style="font-size: 3.5em;">
                        <b>$500M+</b>
                    </div>
                    <div class="row">
                        <b>Total Capital Deployed</b>
                    </div>
                </div>
            </div>
            <div class="row my-5"></div>
            <div class="row mx-3">
                <div class="col-md-6 my-3">
                    <img class="card-img-top rounded" src="/images/about/invest.webp" alt="Investment Approach">
                </div>
                <div class="col-md-6 text-right my-3">
                    <div>
                        <h3> <b> Our Investment Approach </b></h3>
                    </div>
                    <br>
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
                        technology and innovation bring about widespread, positive change.</div>
                </div>
            </div>
            <div class="row my-4"></div>
            <div class="row mx-3 justify-content-center">
                <div class="col-md-8" style="text-align: center;">
                    <h3><b>“Investing in the future does not only mean foreseeing the future, but creating it”</b></h3>
                </div>
                <div class="row my-3"></div>
                <div class="col-md-8 justify-content-center" style="text-align: justify;">
                    <div> We believe that <strong>venture capital is not just about money</strong>. It's about
                        <strong>building relationships</strong>, providing guidance, and supporting our portfolio companies
                        every step of the way. We are committed to this philosophy and strive to make a difference in the
                        startup ecosystem.</div>
                    <br>
                    <div> We view venture capital as a <strong>catalyst for transformation and growth</strong>. It's about
                        <strong>empowering startups</strong>, fostering creativity, and promoting sustainable practices.
                        This commitment shapes our actions and initiatives, reinforcing our aim to become a <strong>positive
                            force in the entrepreneurial landscape</strong>.</div>
                </div>
            </div>
            <div class="row my-5"></div>
            <div class="row mx-3 justify-content-center">
                <h1 style="text-align: center;"> Featured Portfolio </h1>
            </div>
            <br>
            <div class="row mx-3 d-flex justify-content-center">
                <div class="row mx-3 justify-content-center">
                    <div v-for="project in projects" class="col mb-3 d-flex justify-content-center">
                        <ProjectCard :projectid="project.projectid" :title="project.title" :preview="project.preview"
                            :stage="project.stage" :areas="project.areas" :year="project.year"
                            :featured="project.featured" />
                    </div>
                </div>
            </div>
            <br>
            <div class="row mx-3 d-flex justify-content-center">
                <nuxt-link to="/projects" tag="button" type="button" class="btn btn-secondary d-flex justify-content-center">
                    Explore all projects
                </nuxt-link>
            </div>
            <div class="row my-5"></div>
            <div class="row mx-3 justify-content-center">
                <h1 style="text-align: center;"> Meet Our Team </h1>
            </div>
            <br>
            <div class="row mx-3 d-flex justify-content-center">
                <div class="row mx-3 justify-content-center">
                    <div v-for="person in people.slice(0, 3)" class="col mb-3 d-flex justify-content-center">
                        <PeopleCard :personid="person.personid" :name="person.name" :surname="person.surname"
                            :age="person.age" :email="person.email" :linkedin="person.linkedin" :CV="person.CV"
                            :role="person.role" />
                    </div>
                </div>
            </div>
            <br>
            <div class="row mx-3 d-flex justify-content-center">
                <nuxt-link to="/people" tag="button" type="button" class="btn btn-secondary d-flex justify-content-center">
                    Meet the whole team
                </nuxt-link>
            </div>
            <div class="row my-5"></div>
            <div class="row mx-3">
                <h2 style="text-align: center;"> Testimonials </h2>
            </div>
            <br>
            <div class="row mx-3 justify-content-center">
                <div class="col-md-3 mx-auto my-3 d-flex flex-column" style="text-align: center;">
                    <div class="quote">
                        “The guidance and resources we received from the team were invaluable to our success”
                    </div>
                    <div class="author mt-auto">
                        <b> - Portfolio Company CEO</b>
                    </div>
                </div>
                <div class="col-md-3 mx-auto my-3 d-flex flex-column" style="text-align: center;">
                    <div class="quote">
                        “They've provided more than capital, they've been a true partner in our journey”
                    </div>
                    <div class="author mt-auto">
                        <b> - Startup Founder</b>
                    </div>
                </div>
                <div class="col-md-3 mx-auto my-3 d-flex flex-column" style="text-align: center;">
                    <div class="quote">
                        “Their strategic insights and industry connections have been instrumental”
                    </div>
                    <div class="author mt-auto">
                        <b> - Portfolio Company COO</b>
                    </div>
                </div>
            </div>
            <br>
            <br>
        </div>
    </main>
</template>


<style scoped>
.custom-heading {
    font-size: 3.5em;
}

.rounded {
    border-radius: 75%;
}

.text-right {
    text-align: right;
}

.btn-secondary {
    width: 90%;
}


</style>

<script lang="ts">
export default {
    data() {
        return {
            projects: [],
            people: [],
        }
    },

    components: {
        ProjectCard,
        PeopleCard,
    },

    created() {
        this.getData()
    },

    methods: {
        async getData() {
            try {
                const projectsData = await makeCall(this.$config.public.SERVER_URL + "/getFeaturedProjects", 'GET');
                const peopleData = await makeCall(this.$config.public.SERVER_URL + "/getPeople", 'GET');
                console.log(projectsData);
                console.log(peopleData);
                this.projects = projectsData;
                this.people = peopleData;
            } catch (error) {
                alert("Error while fetching data")
                console.error(error);
            }
        }
    }
}
</script>