<script setup lang="ts">
import ContactForm from '@/components/ContactForm.vue'
</script>

<template>
    <main>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 d-flex align-items-center justify-content-center">
                    <div class="text-center">
                        <div class="row mt-6 custom-heading">
                            <b>Contact us</b>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h3>Do you love cats and want to collaborate? Contact us!</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 d-flex align-items-center justify-content-end ml-auto p-0">
                    <img class="centered-image" src="/images/contact/team.webp" alt="Team photo">
                </div>
            </div>
            <div class="row justify-content-center pb-5 card-container" style="background: #a9a9a9;">
                <div class="row mx-3 justify-content-center">
                    <div class="col-md-4 card mb-3 card-custom mx-auto mr-md-3 ml-md-3 first-card">
                        <div class="row">
                            <img class="card-img-top img-custom" src="/images/contact/address.webp" alt="Position Icon">
                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <h2>Our main office</h2>
                            Via Camillo Golgi, 39, Milano, MI
                        </div>
                    </div>
                    <div class="col-md-4 card mb-3 card-custom mx-auto mr-md-3 ml-md-3">
                        <div class="row">
                            <img class="card-img-top img-custom" src="/images/contact/phone.webp" alt="Phone Icon">
                        </div>
                        <br>
                        <div class="row justify-content-center mx-3">
                            <h2>Phone number</h2>
                            +39 3337183949
                        </div>
                    </div>
                    <div class="col-md-4 card mb-3 card-custom mx-auto mr-md-3 ml-md-3">
                        <div class="row">
                            <img class="card-img-top img-custom" src="/images/contact/email.webp" alt="Email Icon">
                        </div>
                        <br>
                        <div class="row justify-content-center">
                            <h2>Email</h2>
                            <a href="mailto:teamHyperMeow@gmail.com" class="email-link">teamHyperMeow@gmail.com</a>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-4 contact-form-container">
                    <ContactForm style="width: 75%;"></ContactForm>
                </div>
            </div>
        </div>
    </main>
</template>

<style scoped>
.custom-heading {
    font-size: 3.5em;
}

.centered-image {
    max-width: 100%;
    height: auto;
    display: block; 
    margin: 0; 
}

@media (min-width: 768px) {
  .card-custom {
    margin-top: -100px;
  }
}

@media (max-width: 767px) {
  .card-container {
    padding-top: 30px;
  }

  .first-card {
    margin-top: 40px; /* Added this to create space when less than 3 cards are displayed */
  }
}

.card-container {
    margin-bottom: 50px; /* Added this to create space between the cards and the form */
}

.card-custom {
    display: flex;
    max-width: 300px;
    height: 300px;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.img-custom {
    max-width: 100px;
    max-height: 50px;
    width: auto;
    height: auto;
}

.email-link {
    color: black;
    text-decoration: none;
}

.contact-form-container {
    margin-top: 50px; /* Added this to create space above the form */
}
</style>
