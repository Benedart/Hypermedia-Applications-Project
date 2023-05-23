<template>
        <div class="card h-100" style="width: 18rem;">
            <router-link :to="`/person/${personid}`" style="display: contents;">
            <img class="card-img-top" :src="`/images/People/${personid}.webp`" :alt="personid">
            <div class="card-body">
                <h5 class="card-title">{{ name + " " + surname + ", " + age  }}</h5>
                <h3 class="card-subtitle">{{ role }}</h3>
            </div> </router-link>
            <div class="card-footer">
                <a :href="`mailto:${email}`" class="float-start"><img class="card-img-top img-custom" src="/images/contact/email.webp" alt="Email Icon" style ="width: 30px; height: auto;"></a>
                <a :href="linkedin" class="float-end"><img class="card-img-top img-custom" src="/images/contact/linkedin.webp" alt="Linkedin Icon" style ="width: 30px; height: auto;"></a>
            </div>
        </div>
</template>

<!--<template>
    <router-link :to="`/person/${personid}`" style="display: contents;">
        <div class="card h-100" style="width: 18rem;">
            <img class="card-img-top" :src="`/images/People/${personid}.webp`" :alt="personid">
            <div class="card-body">
                <h5 class="card-title">{{ name + " " + surname + ", " + age  }}</h5>
                <h3 class="card-subtitle">{{ role }}</h3>
            </div> 
            <div class="card-footer">
                <span class="float-start">{{ email }}</span>
                <span class="float-end">{{ linkedin }}</span>
            </div>
        </div>
    </router-link>
</template>-->



<script lang="ts">

export default {
    data() {
        return {
            peopleDetails: {

                personid : -1,
                name : 'name',
                surname : 'surname',
                age : 'age',
                email : 'email',
                linkedin : 'linkedin',
                CV: 'CV',
                role : 'role'
            
            },
        }
    },

    props: {
        personid: Number,
        name: String,
        surname: String,
        age: Number,
        email: String,
        linkedin: String,
        CV: String,
        role: String

    },

    //to switch the link in base of the personid
    methods: {
        /*getLinkedinLink(personid) {
            switch (personid) {
                case 1:
                    return 'https://www.linkedin.com/in/james-thompson-5753a859/';
                case 2:
                    return 'https://www.linkedin.com/in/lindamartinez100/';
                case 3:
                    return 'https://www.linkedin.com/in/emily-chen-82b20431/';
                case 4:
                    return 'https://www.linkedin.com/in/mark-robinson-959230177/';
                case 5:
                    return 'https://www.linkedin.com/in/sarah-johnson-35032723a/';
                case 6:
                    return 'https://www.linkedin.com/in/david-brown-1835b2b8/';
                case 7:
                    return 'https://www.linkedin.com/in/lauraadams/';
                case 8:
                    return ' https://www.linkedin.com/in/mikewilliams1125/';
                case 9:
                    return 'https://www.linkedin.com/in/karenlmx/';
                case 10:
                    return 'https://www.linkedin.com/in/alex-marti-80546544/';
                case 11:
                    return 'https://www.linkedin.com/in/jane-smith-41915517/';
                case 12:
                    return 'https://www.linkedin.com/in/john-d-33aa471b4/';
                case 13:
                    return 'https://www.linkedin.com/in/emily-green-21a61a158/';
                case 14:
                    return 'https://www.linkedin.com/in/mikebrown79/';
                case 15:
                    return 'https://www.linkedin.com/in/sarahmthomp/';
                case 16:
                    return 'https://www.linkedin.com/in/jamesmorganwhite/';
                case 17:
                    return 'https://www.linkedin.com/in/laura-martinez-18533693/';
                case 18:
                    return 'https://www.linkedin.com/in/danielleeuk/';
                case 19:
                    return 'https://www.linkedin.com/in/peterbjohnson/';
                case 20:
                    return 'https://www.linkedin.com/in/lisa-williams-icnbs/';
                case 21:
                    return 'https://www.linkedin.com/in/thomasdavidjohnson/';
                case 22:
                    return 'https://www.linkedin.com/in/marie-williams-ba76b0214/';
                case 23:
                    return 'https://www.linkedin.com/in/jasminecturner/';
                case 24:
                    return 'https://www.linkedin.com/in/kevin-chen-998913112/';
                case 25:
                    return 'https://www.linkedin.com/in/ashley-martin2/';
                case 26:
                    return 'https://www.linkedin.com/in/asmith7663/';
                case 27:
                    return 'https://www.linkedin.com/in/rachel-faye-adams/';
                case 28:
                    return 'https://www.linkedin.com/in/noah-evans-4a3aa6236/';
                case 29:
                    return 'https://www.linkedin.com/in/michelle-clark-1b372431/';
                case 30:
                    return 'https://www.linkedin.com/in/lucaswmorgan/';
                case 31:
                    return 'https://www.linkedin.com/in/katherine-ross-646a21192/';
                case 32:
                    return 'https://www.linkedin.com/in/benjaminjohnson01/';
                case 33:
                    return 'https://www.linkedin.com/in/olivia-m-miller/';
                case 34:
                    return 'https://www.linkedin.com/in/ethan-wilson-596991214/';
                case 35:
                    return 'https://www.linkedin.com/in/rebeccaturner111/';
                case 36:
                    return 'https://www.linkedin.com/in/martin-lee-b8287752/';
                case 37:
                    return 'https://www.linkedin.com/in/djackso/';
                case 38:
                    return 'https://www.linkedin.com/in/samantha-lee-35a169b6/';
                case 39:
                    return 'https://www.linkedin.com/in/allisonwgrant/';
                case 40:
                    return 'https://www.linkedin.com/in/charleskim7/';
                default:
                    return ''; // Valore di default nel caso in cui personid non corrisponda a nessun caso
            }
        }*/
    },
    

}

</script> 

