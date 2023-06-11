<script setup lang="ts">
import { makeCall } from '@/utils/common'
import ProjectCard from '@/components/ProjectCard.vue'
import PeopleCard from '@/components/PeopleCard.vue'
</script>

<template>
  <main>
    <div class="container-fluid">
        <div class="custom-row">
          <div class="title">If you don’t believe in it, we do.</div>
          <div class="subtitle">Dedicated to fueling innovation and driving growth.  We collaborate with visionary entrepreneurs and disruptive startups igniting breakthrough technologies and ideas, empowering the next generation of game-changers.</div>
          <nuxt-link to="/about" tag="button" type="button" class="custom-btn d-flex justify-content-left" >
                  About us
          </nuxt-link>
        </div>
        <br>
        <br>
        <div class = "row custom-margins justify-content-center">
          <div class = "col-md-10 d-flex justify-content-center mx-3">
            <h3><p class="custom-bold" style="text-align: center;">“HyperMeow is very good at doing the things it does. Like a lot. Aren’t you convinced yet? I pinky promise”</p></h3>
          </div>
          <div class="row my-3"></div>
          <div class = "col-md-6" style="text-align: justify;">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget duis mi nunc bibendum. Tellus elementum nec lorem eget dictumst. Risus in gravida eu, enim lorem. Sed consequat ut suspendisse eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget duis mi nunc bibendum. Tellus elementum nec lorem eget dictumst. Risus in gravida eu, enim lorem. Sed consequat ut suspendisse eros. </p>
          </div>
          <div class="row my-3"></div>
          <div class="row mx-3 justify-content-center">
                <div class="col-md-6 rounded mb-3 text-center">
                    <div class="row" style="font-size: 3.5em;">
                        <p class="custom-bold">1000+</p>
                    </div>
                    <div class="row">
                        <p class="custom-bold">Founders in Residence</p>
                    </div>
                </div>
                <div class="col-md-6 rounded mb-3 text-center">
                    <div class="row" style="font-size: 3.5em;">
                        <p class="custom-bold">5</p>
                    </div>
                    <div class="row">
                        <p class="custom-bold">Incubated Unicorns</p>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row my-3"></div>
            <div class="row mx-3 justify-content-center">
                <h1 style="text-align: center;"> Featured Projects </h1>
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
                    Explore all projects
                </nuxt-link>
            </div>
            <div class="row my-5"></div>
            <div class ="py-5" style = "background-color: #D9D9D9;">
              <div class="row mx-3 justify-content-center">
                <h1 style="text-align: center;"> Our People </h1>
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
                      Meet the whole team
                  </nuxt-link>
              </div>
            </div>
            <div class="row my-5"></div>
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
  margin-right: -15px;
  margin-left: -15px;

}

.rounded {
    border-radius: 75%;
}

.custom-bold {
    font-weight: bold;
    color: #086788;
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
  max-width: 50%;
  text-align:start;
  margin-left: 1em;
  margin-top:5em;
  color:snow;
  font-family: Avenir, sans-serif;
}

.subtitle{
  width: 45%;
  text-align:start;
  margin-left:-42.5em;
  margin-top: 30em;
  
  color:snow;
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
    margin: auto;
    color: #086788;
    background-color: #E5E5E5;
    border: none;
    border-radius: 0.4rem;
    transition: 0.2s;
    cursor: pointer;
    letter-spacing: 0.1rem;
    margin-top: 37em;
    margin-bottom:10em;
    margin-left:-35.3em;
    font-family: Avenir, sans-serif;
}

.btn:hover,
.btn:active {
    background-color: #c2cffc;
}


</style>

