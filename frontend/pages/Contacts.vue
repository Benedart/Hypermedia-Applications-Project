<script setup lang="ts">
import { makeCall } from '@/utils/common'
</script>

<template>
    <main>
        <div class="container-fluid">
            <br>
            <br>
            <br>
            <div class="row mx-3 mt-6 custom-heading">
                <b>Contact us</b>
            </div>
            <br>
            <div class="row mx-3">
                <div class="col-md-12">
                     <h3> Blablablablablablablablablablabla blablalbla bla blabla! </h3>
                </div>
            </div>
            <br>
            <br>
            <div class="lower-third-bg"></div>
            <div class="card-container row mx-3 justify-content-center">
                <div class="col-md-4 card mb-3 card-custom mx-auto mr-md-2 ml-md-3">
                    <div class="row">
                        <img class="card-img-top img-custom" :src="`/images/contact/address.webp`" alt="Position Icon">
                    </div>
                    <br>
                    <div class="row">
                        <h2>Our main office</h2>
                        <br>
                        Indirizzo incredibilmente incredibile
                    </div>
                </div>
                <div class="col-md-4 card mb-3 card-custom mx-auto mr-md-3 ml-md-3">
                    <div class="row">
                        <img class="card-img-top img-custom" :src="`/images/contact/phone.webp`" alt="Phone Icon">
                    </div>
                    <br>
                    <div class="row">
                        <h2>Phone number</h2>
                        <br>
                        Numero pazzesco
                    </div>
                </div>
                <div class="col-md-4 card mb-3 card-custom mx-auto mr-md-3 ml-md-2">
                    <div class="row">
                        <img class="card-img-top img-custom" :src="`/images/contact/email.webp`" alt="Email Icon">
                    </div>
                    <br>
                    <div class="row">
                        <h2>Email</h2>
                        <br>
                        Erba gatta gratis: <a href="mailto:teamHyperMeow@gmail.com">teamHyperMeow@gmail.com</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>

<style scoped>
.custom-heading {
      font-size: 3.5em; /* Imposta la dimensione del testo a n  volte la dimensione predefinita */
    }
.lower-third-bg {
    position: absolute;
    bottom: 0;
    width: 100%;
    height: 33.33vh;
    background: #a9a9a9;
}

.card-container {
    position: relative;
    bottom: 2.22vh; 
    padding-top: 2.22vh;
}

.card-custom {
    max-width: 300px; /* Limita la larghezza massima delle card a x px */
    height: 300px;
    align-items: center; /* Allinea verticalmente al centro */
    justify-content: center; /* Allinea orizzontalmente al centro */
    text-align: center;
}

.img-custom {
    max-width: 100px; /* Imposta la larghezza massima a x pixel */
    max-height: 50; /* Imposta l'altezza massima a x pixel */
    width: auto; /* Imposta la larghezza automaticamente in base all'altezza */
    height: auto; /* Imposta l'altezza automaticamente in base alla larghezza */
}
</style>
