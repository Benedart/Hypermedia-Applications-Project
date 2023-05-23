<script setup lang="ts">
import { makeCall } from '@/utils/common'
import PeopleCard from '@/components/PeopleCard.vue'
</script>

<template>
    <main>
        <h1> People</h1>
        <div class="container-fluid">
            <div class="search-wrapper panel-heading col-sm-12">
                <input type="text" v-model="search" placeholder="Search">
            </div>
            <!--<div v-if="!search" class="accordion" id="accordionPanelsStayOpen">
                <div v-for="role in people.role" class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                            :data-bs-target="`#panelsStayOpen-${person.role}`" aria-expanded="true"
                            :aria-controls="`panelsStayOpen-${person.role}`">
                            <b>{{ person.role }}</b>
                        </button>
                    </h2>
                    <div :id="`panelsStayOpen-${person.role}`" class="accordion-collapse collapse show">
                        <div class="accordion-body">
                            <div class="row g-3">
                                <div v-for="user in peopleByRole(person.role)" class="col-12 col-md-6 col-lg-4">
                                    <PeopleCard :personid ="user.personid" :name="user.name" :surname="user.surname"
                                        :age="user.age" :email="user.email" :linkedin="user.linkedin"
                                        :CV="user.CV" :role="user.role" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
            <div v-if = "search" class="row g-3">
                <div v-for="person in visiblePeople" class="col">
                    <PeopleCard :personid ="person.personid" :name ="person.name" :surname="person.surname" :age="person.age"
                        :email="person.email" :linkedin="person.linkedin" :CV="person.CV" :role="person.role" />
                </div>
            </div>
            <div v-if="!search" v-for="role in getRole(people)" class="row g-3">
                <h2 style = "margin-top: 300 px;"></h2>
                <h1 style = "margin-top: 100 px;">{{ role }}</h1>
                <div v-for="user in peopleByRole(role)" class="col-12 col-md-6 col-lg-4">
                    <PeopleCard :personid ="user.personid" :name="user.name" :surname="user.surname"
                                        :age="user.age" :email="user.email" :linkedin="user.linkedin"
                                        :CV="user.CV" :role="user.role" />
                </div>
            </div>
        </div>
    </main>
</template>

<script lang="ts">
export default {
    data() {
        return {
            
            // this will contain all the people, used to reset the filters
            people: [
                {
                    personid: -1,
                    name: 'Paolo',
                    surname: 'Rossi',
                    age: '37',
                    email : 'paolo.rossi@gmail.com',
                    linkedin: 'https://www.linkedin.com/feed/',
                    CV: 'Laureato e molto bravo in costruzioni lego',
                    role: 'CEO',
                    projects: [
                        {
                            projectid: -1,
                            title: 'project'
                        }
                    ],
                },
            ],
            /*
            // this will contain the projects of the visible people
            projects: [
                {
                    projectid: -1,
                    title: 'project'
                }
            ],
            */
            search: ""
        }
    },
   
    components: {
        
        PeopleCard
    },

    created() {
        this.getData()
    },

    computed: {
        // returns the list of people that match the search string
        visiblePeople: function () {
            let matchingPeople = this.people.filter(p => {
                let indexList = [0];
                for (let i = 0; i < (p.name + " " + p.surname).length ; i++) {
                    const character = (p.name + " " + p.surname).charAt(i);
                    if (character == " ")
                        indexList.push(i + 1);
                }
                // check if the search string is a substring of the project title (case insensitive)
                return indexList.includes((p.name + " " + p.surname).toLowerCase().indexOf(this.search.toLowerCase()));
            });

            console.log("SEARCH RESULTS:");
            console.log(matchingPeople);

            return matchingPeople;
        },
    }, 

    methods: {

        
        // returns the list of roles
        peopleByRole: function (role: string) {
            return this.people.filter(p => p.role === role)
        },
        
        
        // returns the role of the visible person
        getRole(people: any[]) {
            let roles = []

            // for each person, add the role that are not already in the list
            people.forEach(person => {
                console.log(person)
                if (!roles.includes(person.role)) {
                    roles.push(person.role)
                }
                
            })

            return roles;
        },
        //get projects for each person
        //controlla 
        /*
        getPojects: function(){
            
            let projects = []

            // for each project, add the areas that are not already in the list
            people.forEach(person => {
                console.log(person)
                person.projects.forEach(project => {
                    if (!projects.some(a => a.areaid === area.areaid)) {
                        areas.push(area)
                    }
                })
            })

            console.log("VISIBLE AREAS:")
            console.log(areas)

            this.areas = areas
        },*/
        

        // get the data from the server
        getData: function () {
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getPeople",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);

                            console.log(data)

                            // itintially all the projects are shown, so we save them in both arrays
                            this.people = data
                            
                            //this.getProjects(this.people)
                        } else {
                            alert("Error, couldn't retrieve data");
                        }
                    }
                }
            )
        },
    },
}
</script>

<style>
.card {
    cursor: pointer;
}

.card:hover {
    filter: brightness(80%);
    transition: 0.5s;
}
</style>