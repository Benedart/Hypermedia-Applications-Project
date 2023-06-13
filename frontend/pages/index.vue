<script setup lang="ts">
import { makeCall } from '@/utils/common'
import ProjectCard from '@/components/ProjectCard.vue'
import PeopleCard from '@/components/PeopleCard.vue'
</script>

<template>
  <main>
    <div class="container-fluid">
        <div class="custom-row" style="min-height: 60em; padding-bottom: 10em;">
          <div class="title col-md-5" style="line-height: 95%;">If you don’t believe in it, we do.</div>
          <div class="subtitle col-md-4">Dedicated to fueling innovation and driving growth. 
            <p>We collaborate with visionary entrepreneurs and disruptive startups igniting breakthrough technologies and ideas, empowering the next generation of game-changers.</p></div>
          <div class="col-md-4 mx-3 d-flex justify-content-start">
                <nuxt-link to="/about" tag="button" type="button" class="custom-btn d-flex">
                    <b>About us</b>
                </nuxt-link>
          </div>
        </div>
        <div class = "col-md-7 d-flex justify-content-center mx-auto">
            <h3 class="custom-bold" style="text-align: center; margin-top:2.5em;">HyperMeow is a global investment leader, 
                <p class="custom-bold">reshaping opportunities in Italy and beyond with unprecedented growth.</p></h3>
        </div>
        <div class = "col-md-6 sm-separator mx-auto" style="text-align: justify; font-size: 1.3em;">
            <p>For over 50 years, we have been partnering with businesses, organizations, and institutions, assisting them in overcoming their most complex challenges, creating value, and accelerating their growth through sustainable and inclusive transformation processes.</p>
            <p>We are dedicated to contributing to the development of the communities we serve and safeguarding our planet through research projects in social, technological, healthcare, and environmental domains.</p>
            <p>We ensure equal opportunities for professional growth for all individuals working with us, promoting the values of diversity, inclusion, and meritocracy. </p>
        </div>
        <div class="row mx-3 d-flex justify-content-center sm-separator">
                <div class="col-md-6 rounded mb-3 text-center">
                    <div class="row" style="font-size: 8.75em;">
                        <p class="custom-bold" style="font-family:'Times New Roman', Times, serif;">1000+</p>
                    </div>
                    <div class="row">
                        <p class="custom-bold-num">Founders in Residence</p>
                    </div>
                </div>
                <div class="col-md-6 rounded mb-3 text-center">
                    <div class="row" style="font-size: 8.75em;">
                        <p class="custom-bold" style="font-family:'Times New Roman', Times, serif;">5</p>
                    </div>
                    <div class="row">
                        <p class="custom-bold-num">Incubated Unicorns</p>
                    </div>
                </div>
            </div>
            <hr style = "width: 70%; margin: 0 auto;">
            <div class="row mx-3 justify-content-center separator-margin">
                <h1 style="text-align: center; color: #000022;"> Featured Projects </h1>
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
                <nuxt-link to="/projects" tag="button" type="button"
                    class="btn btn-secondary d-flex justify-content-center">
                    <b>Explore all projects</b>
                </nuxt-link>
            </div>
            <div class ="separator-margin py-5 background-extender" style = "background-color: #D9D9D9;">
              <div class="row mx-3 justify-content-center">
                    <h1 style="text-align: center; color: #000022; "> Our People </h1>
              </div>
              <br>
              <div class="row mx-3 d-flex justify-content-center">
                  <div class="row mx-3 justify-content-center">
                      <div v-for="person in people.slice(0, 3)" class="col mb-3 d-flex justify-content-center">
                          <PeopleCard :personid="person.personid" :name="person.name" :surname="person.surname"
                              :age="person.age" :email="person.email" :linkedin="person.linkedin" :CV="person.CV"
                              :Description="person.Description" :role="person.role" />
                      </div>
                  </div>
              </div>
            
              <br>
              <div class="row mx-3 d-flex justify-content-center">
                  <nuxt-link to="/people" tag="button" type="button" class="btn btn-secondary d-flex justify-content-center">
                    <b>Meet the whole team</b>
                  </nuxt-link>
              </div>
            </div>
            <div class="row mx-3 d-flex image-wood">
                <h1 style="text-align: center; color: #000022; margin-top:1em;font-size:2.5em;">Areas that we explored</h1>
                <div class="col-md-7 my-3 justify-content-center text-style px-5">
                    <p class="custom-bold" style="text-align: start; font-size: 1.5em; margin-top:3em;">Investing in Healthcare, Ecosustainability, Technology, and Growth.</p>
                    <p style="text-align: justify; font-size: 1.3em;">From revolutionizing healthcare to championing ecosustainability, leveraging technology, and fostering growth, we are at the forefront of driving innovation.</p>
                    <p style="text-align: justify; font-size: 1.3em;">Join us on our mission to shape the future of these dynamic industries.</p>
                </div>
                <nuxt-link to="/areas" tag="button" type="button" class="custom-btn d-flex justify-content-center" style="background-color: #086788; color:snow;">
                   <b>All areas</b>
                </nuxt-link>
            </div>
        </div>
  </main>
</template>

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

<style scoped>


.custom-row{
  background-image: url("./images/index/plant.webp");
  margin-top:-8em;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  margin-right: -15px;
  margin-left: -15px;

}

.background-extender{
    margin-left: -100px; 
    margin-right: -100px; 
    padding-left: 100px; 
    padding-right: 100px;
}

.image-wood{
    background-image: url("./images/index/wood.webp");
    display: flex;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

.separator-margin{
    margin-top: 80px;
}

.sm-separator{
    margin-top: 40px;
}

/* larghezza dello schermo fino a 768px */
@media (max-width: 768px) {
    .separator-margin{
    margin-top: 40px;
}

.sm-separator{
    margin-top: 20px;
}
}

/* larghezza dello schermo fino a 480px */
@media (max-width: 480px) {
    .separator-margin{
    margin-top: 15px;
}

.sm-separator{
    margin-top: 15px;
}

}

.rounded {
    border-radius: 75%;
}

.custom-bold {
    text-align: center;
    font-weight: bold;
    color: #000022;
    
}
.custom-bold-num {
    font-size: 1.5em; 
    margin-top:-2em;
    font-weight: bold;
    color: #000022;
    
}

.btn-secondary {
    width: 90%;
    background-color: #086788;
    margin-top: 2%;
}

.custom-margins {
    margin-left: 100px;
    margin-right: 100px;
}

.title{
  max-width: 60%;
  text-align:start;
  margin-left: 2em;
  margin-top:4.8em;
  color:snow;
  font-family: Poppins, sans-serif;
}

.subtitle{
  max-width: 45%;
  text-align:start;
  margin-top: 2em;
  margin-left: 5.5em;
  color:snow;
  font-size: 1.3em;
  font-family: Avenir, sans-serif;
}
.custom-btn {
    display: inline-block;
    padding: .375rem .75rem;
    vertical-align: middle;
    user-select: none;
    width: auto;
    font-size: 1rem;
    font-weight: 450;
    text-align: center;
    align-items:start;
    color: #000022;
    background-color: #E5E5E5;
    border: none;
    border-radius: 0.4rem;
    transition: 0.2s;
    cursor: pointer;
    letter-spacing: 0.1rem;
    justify-content: start;
    margin-top: 2em;
    margin-left: 5.5em;
    font-family: Avenir, sans-serif;
}

.btn:hover,
.btn:active {
    background-color: #c2cffc;
}

@media(max-width: 725px){
    .title{
  max-width: 50%;
  text-align:start;
  align-items: start;
  margin-left: 2em;
  margin-top:3.5em;
  color:snow;
  font-family: Poppins, sans-serif;
}

.subtitle{
  max-width: 45%;
  text-align:start;
  align-items: start;
  margin-top: 1.5em;
  margin-left: 5.5em;
  color:snow;
  font-size: 1.3em;
  font-family: Avenir, sans-serif;
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
    font-family: Avenir, sans-serif;
}
}

@media(max-width: 560px){
    .title{
  max-width: 50%;
  text-align:start;
  align-items: start;
  margin-left: 2em;
  margin-top:3em;
  color:snow;
  font-family: Poppins, sans-serif;
}

.subtitle{
  max-width: 45%;
  text-align: start;
  align-items: start;
  margin-top: 1em;
  margin-left: 5.5em;
  color:snow;
  font-size: 1.3em;
  font-family: Avenir, sans-serif;
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
    font-family: Avenir, sans-serif;
    justify-content: center;
}
}


</style>

