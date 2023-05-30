<script setup lang="ts">
import ContactForm from '@/components/ContactForm.vue'
</script>

<template>
  <main>
    <div class = "container-fluid">
      <div class = "row justify-content-center">
        <div class="col-md-4 d-flex align-items-center justify-content-center">
            <div class="text-center">
                <div class="row mt-6 custom-heading">
                    <b>Crazy title that will have a great impact</b>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant cras morbi hendrerit nunc vel sapien. In habitasse at diam suspendisse non vitae fermentum, pharetra arcu. Viverra a morbi ut donec in. Ac diam, at sed cras nisi. </p>
                    </div>
                </div>
                <div class="row d-flex justify-content-left">
                  <nuxt-link to="/about" tag="button" type="button" class="btn btn-rounded d-flex justify-content-left" style="width: auto;">
                    Learn more ->
                  </nuxt-link>
                </div>
            </div>
        </div>
        <div class="col-md-4 d-flex align-items-center justify-content-center my-2">
            <img class="rounded-image image-container" src="/images/index/crazyImage.webp" alt="HyperMeow">
        </div>
      </div>
      <div class = "row my-3"> </div>
      <div class = "row justify-content-center " style="align-items: center;">
        <div class = "d-flex justify-content-center align-items-center" style="max-width: 50%;">
          <div class="col-md-3 justify-content-center d-flex card-left align-items-center">
          <div class="card-left-inner d-flex justify-content-center align-items-center">

          </div>
          </div>
          <div class="col-md-9 justify-content-center d-flex align-items-center card-right" style="text-align: center;">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget duis mi nunc bibendum. Tellus elementum nec lorem eget dictumst. Risus in gravida eu, enim lorem. Sed consequat ut suspendisse eros. 
          </div>
        </div>
      </div>
      <br>
      <div class = "row d-flex justify-content-center" style="text-align: center;"> 
        <h2> What we do</h2>
      </div>
      <br>
      <div class = "row d-flex justify-content-center">
        <div class="card-right d-flex justify-content-center align-items-center" style="max-width: 50%;"> 
        </div>
      </div>
      <br>
      <div class = "row d-flex justify-content-center">
        <div class="card-left d-flex justify-content-center align-items-center" style="max-width: 50%;">
        </div>
      </div>
      <br>
      <div class = "row d-flex justify-content-center">
        <div class="card-right d-flex justify-content-center align-items-center" style="max-width: 50%;">
        </div>
      </div>
      <br>
      <div class="row justify-content-center mb-4 contact-form-container">
          <ContactForm style="width: 75%;"></ContactForm>
      </div>
      <br>
    </div>
  </main>
</template>

<style scoped>

.card-left {
    position: relative;
    background-color: #818181;
    border-radius: 90px 0px 0px 90px;
    height: 200px;
  }

  .card-left-inner {
    position: relative;
    background-color: #ffffff;
    border-radius: 90px 0px 0px 90px;
    width: 90%;
    height: 90%;
  }
  
  .card-right {
    position: relative;
    background-color: #818181;
    border-radius: 0px 90px 90px 0px;
    height: 200px;
  }

.custom-heading {
    font-size: 3.5em;
    line-height: 90%;
}

.btn-rounded {
    border-radius: 25px;
    background: linear-gradient(90deg, #555555, #A3A3A3);
    border: none;
    color: white; 
}

.rounded-image {
  border-radius: 50%;
  max-width: 75%;
}

.image-container {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>
