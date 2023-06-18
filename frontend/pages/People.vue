<script setup lang="js">
import { makeCall } from '@/utils/common'
import PeopleCard from '@/components/PeopleCard.vue'

useSeoMeta({
    title: 'People - HyperMeow',
    description: 'Discover our team at HyperMeow. Fro, the CEO to the HR every single person that is supervising our projects. Get to know their names, roles, and backgrounds. Find contact information and connect with them on Linkedin.">',
    keywords: 'people, hypermeow, hypermeow people, hypermeow people page, profiles, organization, team, names, roles, contact information, Linkedin ',
})

</script>
<template>
    <div class="container-text-center">
        <div class="title">
            People
        </div>
        <div class="container" style="background-color: #FFFBFA;">
            <div class="row d-flex justify-content-center">
                <div class="row g-3">
                    <!-- Loop through each user in the people array -->
                    <div v-for="user in people" class="col" style="margin-bottom: 70px;">
                        <!-- Pass user data as props to the PeopleCard component -->
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
            // This array will contain all the people data, used for filtering and resetting
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
        // Call the function to retrieve person data from the server
        this.getPersonData()
    },

    computed: {
        // Returns the list of people that match the search string
        visiblePeople: function () {
            // Filter the people array based on the search string
            let matchingPeople = this.people.filter(p => {
                let indexList = [0];
                for (let i = 0; i < (p.name + " " + p.surname).length; i++) {
                    const character = (p.name + " " + p.surname).charAt(i);
                    if (character == " ")
                        indexList.push(i + 1);
                }
                // Check if the search string is a substring of the person's name or surname
                return indexList.includes((p.name + " " + p.surname).toLowerCase().indexOf(this.search.toLowerCase()));
            });

            console.log("SEARCH RESULTS:");
            console.log(matchingPeople);

            return matchingPeople;
        },
    },

    methods: {
        // Function to retrieve person data from the server
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
    text-align: center;  /* Centers the text horizontally within the element */
    margin-bottom: 5rem;  /* Adds a bottom margin of 5rem to create space below the element */
}

.container-text-center {
    margin-bottom: 10em;  /* Adds a bottom margin of 10em to create space below the element */
}
</style>