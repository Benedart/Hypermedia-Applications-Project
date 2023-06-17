<script setup lang="js">
import { makeCall } from '@/utils/common'
import PeopleCard from '@/components/PeopleCard.vue'
</script>

<template>
    <div class="container-text-center">
        <div class="title">
            People
        </div>
        <div class="container" style="background-color: #FFFBFA;">
            <div class="row d-flex justify-content-center">
                <div class="row g-3">
                    <div v-for="user in people" class="col" style="margin-bottom: 70px;">
                        <PeopleCard :personid="user.personid" :name="user.name" :surname="user.surname" :age="user.age"
                            :email="user.email" :linkedin="user.linkedin" :Description="user.Description"
                            :role="user.role" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script lang="js">
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
    text-align: center;
    margin-bottom: 5rem;
}

.container-text-center {
    margin-bottom: 10em;
}
</style>