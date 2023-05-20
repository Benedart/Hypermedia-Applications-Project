<script setup lang="ts">
import { makeCall } from '@/utils/common'
</script>

<template>
    <main>
        <h1>Contact us</h1>
        <div class = "containter-fluid">
            <br>
            <div class="row mx-3">
                <div class="col-md-12">
                     <h3> Blablablablablablablablablablabla blablalbla bla blabla! </h3>
                </div>
            </div>
            <br>
            <div class="row mx-3">
                <div class="col-md-3 card mb-3">
                    <div class = "row">
                        <img class="card-img-top" :src="`/images/contact/address.webp`" alt="Position Icon">
                    </div>
                    <div class = "row">
                        <h2>Our main office</h2>
                        <br>
                        Indirizzo incredibilmente incredibile
                    </div>
                </div>
                <div class = "col-md-1"></div>
                <div class="col-md-3 card mb-3">
                    <div class = "row">
                        <img class="card-img-top" :src="`/images/contact/phone.webp`" alt="Phone Icon">
                    </div>
                    <div class = "row">
                        <h2>Phone number</h2>
                        <br>
                        Numero incredibilmente incredibile
                    </div>
                </div>
                <div class = "col-md-1"></div>
                <div class="col-md-3 card mb-3">
                    <div class = "row">
                        <img class="card-img-top" :src="`/images/contact/email.webp`" alt="Email Icon">
                    </div>
                    <div class = "row">
                        <h2>EMAIL</h2>
                        <br>
                        <a href="mailto:teamHyperMeow@gmail.com">teamHyperMeow@gmail.com</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>

<style></style>