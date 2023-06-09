<script setup lang="ts">
import { makeCall } from '@/utils/common'
import PeopleCard from '@/components/PeopleCard.vue'
</script>

<template>
    <main style="background-color: #FFFBFA;">
        <div class="container-text-center" style="background-color: #FFFBFA;">
            <div class="title" style="background-color: #FFFBFA;">
                People
            </div>
            <div class="container" style="background-color: #FFFBFA;">
                <div class="row d-flex justify-content-center">
                    <div class="row g-3">
                        <div v-for="user in people" class="col" style="margin-bottom: 70px;">
                            <PeopleCard :personid="user.personid" :name="user.name" :surname="user.surname" :age="user.age"
                                :email="user.email" :linkedin="user.linkedin" :Description="user.Description" :role="user.role" />
                        </div>
                    </div>
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
                    age: 37,
                    email: 'paolo.rossi@gmail.com',
                    linkedin: 'https://www.linkedin.com/feed/',
                    Description: 'Si occupa prettamente di imballaggio',
                    role: 'CEO',
                    projects: [
                        {
                            featured: 0,
                            projectid: -1,
                            title: 'project',
                            stage: 'stage',
                            year: 1024,
                        }
                    ],
                },
            ],

            search: ""
        }
    },

    components: {
        PeopleCard
    },

    created() {
        this.getPersonData()
    },

    computed: {
        // returns the list of people that match the search string
        visiblePeople: function () {
            let matchingPeople = this.people.filter(p => {
                let indexList = [0];
                for (let i = 0; i < (p.name + " " + p.surname).length; i++) {
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
        // get the data from the server
        getPersonData: async function () {
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getPeople", 'GET');
                console.log(data);
                this.people = data;
            } catch (error) {
                alert("Error, couldn't retrieve people cards");
                console.error(error);
            }
        },
    },
}
</script>

<style scoped>
.title {
    font-size: 3.5em;
    text-align: center;
    font-family: secular one, sans-serif;
    color: #000022;
    margin-top : 1.5em;
}

.card:hover {
    transition: 0.5s;
    margin-top: 5em;
    transform: translateY(-0.5%);
    box-shadow: 0 4rem 8rem rgba(0, 1, 33, 0.5);
}



</style>