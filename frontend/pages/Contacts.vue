<script setup lang="ts">
  // Importing ContactForm component
  import ContactForm from '@/components/ContactForm.vue'
</script>

<template>
  <!-- Main content -->
  <main style="background-color: #FFFBFA;">
    
    <div style="max-width: 98.1vw;">
      <!-- Header row with contact details -->
      <div class="row">
        <div class="col-md-6 d-flex align-items-center justify-content-center">
          <div class="text-center">
            <!-- Header title -->
            <div class="row custom-heading" style="line-height: 80%;">
              <b>Contact us</b>
            </div>
            <!-- Header description -->
            <div class="row custom-margin">
              <div class="col-md-12 my-2">
                <h3>Do you want to present your project and want to collaborate? Contact us!</h3>
              </div>
            </div>
          </div>
        </div>

        <!-- Image on the right -->
        <div class="col-md-6 d-flex align-items-center p-0">
          <img class="centered-image" src="/images/contact/team.webp" alt="">
        </div>
      </div>
      
      <!-- Card container with contact details -->
      <div class="row justify-content-center pb-5 card-container" style="background: #E5E5E5;">
        <div class="row mx-3 justify-content-center">
          <!-- Office address card -->
          <div class="card mb-3 card-custom mx-auto mr-md-3 ml-md-3">
            <div class="row image-container">
              <img class="card-img-top img-custom" src="/images/contact/address.webp" alt="">
            </div>
            <br>
            <div class="row justify-content-center" style="color: #FFFBFA;">
              <h2>Our main office</h2>
              Via Camillo Golgi, 39, Milano, MI
            </div>
          </div>

          <!-- Phone number card -->
          <div class="card mb-3 card-custom mx-auto mr-md-3 ml-md-3">
            <div class="row image-container">
              <img class="card-img-top img-custom" src="/images/contact/phone.webp" alt="">
            </div>
            <br>
            <div class="row justify-content-center mx-3" style="color: #FFFBFA;">
              <h2>Phone number</h2>
              +39 3337183949
            </div>
          </div>

          <!-- Email card -->
          <div class="card mb-3 card-custom mx-auto mr-md-3 ml-md-3" style="color: #FFFBFA;">
            <div class="row image-container">
              <img class="card-img-top img-custom" src="/images/contact/email.webp" alt="">
            </div>
            <br>
            <div class="row justify-content-center">
              <h2>Email</h2>
              <a href="mailto:teamHyperMeow@gmail.com" class="email-link"
                style="color: #FFFBFA;">teamHyperMeow@gmail.com</a>
            </div>
          </div>
        </div>
        
        <!-- Contact form -->
        <div class="row justify-content-center mb-4 contact-form-container">
          <ContactForm style="width: 75%;"></ContactForm>
        </div>
      </div>
  </div>
  </main>
</template>

<style scoped>

/* Styling the heading */
.custom-heading {
    font-size: 5.5em;
    margin-top: 10%;
    color: #000022;
}

/* Styling the margin */
.custom-margin{
    margin-top: 3%;
    margin-bottom: 10%;
    color: #000022;
}

/* Styling the image container */
.image-container {
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Styling the centered image */
.centered-image {
    max-width: 100%;
    max-height: 100%;
    width: auto;
    height: auto;
    display: block;
    margin: 0;
}

/* Media queries for screen width between 760px and 1460px */
@media (min-width: 760px) and (max-width: 1460px) {
    /* Adjusting margin for the first and second child of card-custom class */
    .card-custom:nth-child(1),
    .card-custom:nth-child(2) {
        margin-top: 30px;
    }

    /* Adjusting margin for the third child of card-custom class */
    .card-custom:nth-child(3) {
        margin-top: 30px;
    }

    /* Adjusting the custom margin */
    .custom-margin{
        margin-top: 3%;
        margin-bottom: 5%;
    }

    /* Adjusting the custom heading */
    .custom-heading {
        font-size: 5.5em;
        margin-top: 5%;
    }
}

/* Media queries for screen width greater than 768px */
@media (min-width: 768px) {
    .card-custom {
        margin-top: -100px;
    }
}

/* Media queries for screen width less than 767px */
@media (max-width: 767px) {
    /* Adjusting the card container padding */
    .card-container {
        padding-top: 30px;
    }

    /* Adjusting the custom margin */
    .custom-margin{
        margin-top: 2%;
        margin-bottom: 3%;
    }

    /* Adjusting the custom heading */
    .custom-heading {
        font-size: 5.5em;
        margin-top: 2%;
    }
}

/* Styling the card container */
.card-container {
    margin-bottom: 50px;
}

/* Styling the card custom */
.card-custom {
    max-width: 300px;
    height: 300px;
    text-align: center;
    justify-content: center;
    background-color: #086788;
}

/* Styling the custom image */
.img-custom {
    max-width: 100px;
    max-height: 50px;
    width: auto;
    height: auto;
}

/* Styling the email link */
.email-link {
    color: black;
    text-decoration: none;
}

/* Styling the contact form container */
.contact-form-container {
    margin-top: 50px;
}
</style>
