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
                <div v-if="people.length > 0" class="row g-3">
                    <!-- Loop through each user in the people array -->
                    <div v-for="user in people" class="col" style="margin-bottom: 70px;">
                        <!-- Pass user data as props to the PeopleCard component -->
                        <PeopleCard :personid="user.personid" :name="user.name" :surname="user.surname" :age="user.age"
                            :linkedin="user.linkedin" :Description="user.Description" :role="user.role" />
                    </div>
                </div>
                <div v-else-if="!queryError" class="d-flex justify-content-center">
                    <div class="spinner-border m-5" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
                <div v-else class="container-text-center">
                    <div class="error">There was an error while fetching data</div>
                    <div class="error-subtitle">Contact the website owner at teamHyperMeow@gmail.com</div>
                    <div class="icon"><i class="bi bi-emoji-frown"></i></div>
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
            people: [],

            search: "",

            queryError: false,
        }
    },

    components: {
        PeopleCard
    },

    created() {
        // Call the function to retrieve person data from the server
        this.getPersonData()
    },

    methods: {
        // Function to retrieve person data from the server
        getPersonData: async function () {
            try {
                const data = await makeCall(this.$config.public.SERVER_URL + "/getPeople", 'GET');
               // console.log(data);
                this.people = data;
            } catch (error) {
                console.error("Error, couldn't retrieve people cards");
                console.error(error);
                this.queryError = true;
            }
        },
    },
}
</script>

<style scoped>
.title {
    text-align: center;
    /* Centers the text horizontally within the element */
    margin-bottom: 1rem;
    /* Adds a bottom margin of 1rem to create space below the element */
}

.container-text-center {
    margin-bottom: 10em;
    /* Adds a bottom margin of 10em to create space below the element */
}
</style>