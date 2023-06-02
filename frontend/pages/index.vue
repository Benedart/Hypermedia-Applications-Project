<script setup lang="ts">
import ContactForm from '@/components/ContactForm.vue'
</script>

<template>
  <main>
    <div class = "container-fluid">
      <div class = "row d-flex justify-content-around">
        <div class ="col-md-1"></div>
        <div class="col-md-5 d-flex align-items-center justify-content-center">
            <div class="text-left" style="width: 75%;">
                <div class="row mt-6 custom-heading" style="text-align: left;">
                    <b>Crazy title that will have a great impact</b>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-12" style="text-align: left;">
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
        <div class="col-md-5 d-flex align-items-center justify-content-center my-2">
            <img class="rounded-image image-container" src="/images/index/crazyImage.webp" alt="HyperMeow">
        </div>
        <div class = "col-md-1"></div>
      </div>
      <div class = "row my-3"> </div>
      <div class = "row justify-content-center " style="align-items: center;">
        <div class = "d-flex justify-content-center align-items-center" style="max-width: 75%;">
          <div class="col-md-3 justify-content-center d-flex card-left-comp align-items-center">
          <div class="card-left-inner d-flex justify-content-center align-items-center border-end border-success">
              <div class="col-md-2 d-flex justify-content-center"> <h2> About HyperMeow</h2></div>
          </div>
          </div>
          <div class="col-md-9 justify-content-center d-flex align-items-center card-right-comp" style="text-align: justify;">
            <div class = "col-md-8 mx-2"> <p class = "my-2"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
              Eget duis mi nunc bibendum. Tellus elementum nec lorem eget dictumst. 
              Risus in gravida eu, enim lorem. Sed consequat ut suspendisse eros.</p>
              <p class = "my-2"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
              Eget duis mi nunc bibendum. Tellus elementum nec lorem eget dictumst. 
              Risus in gravida eu, enim lorem. Sed consequat ut suspendisse eros.</p>
            </div>
          </div>
        </div>
      </div>
      <br>
      <br>
      <div class = "row my-3"> </div>
      <div class = "row d-flex justify-content-center" style="text-align: center;"> 
        <h2> <strong> What we do </strong></h2>
      </div>
      <br>
      <div class = "row d-flex justify-content-center">
        <div class="card-right d-flex justify-content-center align-items-center" style="max-width: 75%;"> 
          <div class = "col-md-9 d-flex justify-content-center align-items-center">
            <div class="text-left">
              <div class = "row">
              <b> Projects </b>
           </div>
           <br>
          <div class = "row">
           <p class = "my-2"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat bibendum sit felis, sollicitudin et.</p>
          </div>
          <br>
          <div class = "row">
            <nuxt-link to="/projects" tag="button" type="button" class="btn btn-rounded d-flex justify-content-left" style="width: auto;">
                Learn more ->
            </nuxt-link>
          </div>
            </div>
          </div>
          <div class ="col-md-4 d-flex justify-content-center align-items-center">
            <img class="card-image" src="/images/index/crazyImage.webp" alt="HyperMeow">
          </div>
        </div>
      </div>
      <br>
      <div class = "row d-flex justify-content-center">
        <div class="card-left d-flex justify-content-center align-items-center" style="max-width: 75%;">
          <div class ="col-md-4 d-flex justify-content-center">
            <img class="card-image" src="/images/index/crazyImage.webp" alt="HyperMeow">
          </div>
          <div class = "col-md-9 d-flex justify-content-center align-items-center">
            <div class="text-left">
              <div class = "row">
              <b> People </b>
           </div>
           <br>
          <div class = "row">
           <p class = "my-2"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat bibendum sit felis, sollicitudin et.</p>
          </div>
          <br>
          <div class = "row">
            <nuxt-link to="/people" tag="button" type="button" class="btn btn-rounded d-flex justify-content-left" style="width: auto;">
                Learn more ->
            </nuxt-link>
          </div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <div class = "row d-flex justify-content-center">
        <div class="card-right d-flex justify-content-center align-items-center" style="max-width: 75%;">
          <div class = "col-md-9 d-flex justify-content-center align-items-center">
            <div class="text-left">
              <div class = "row">
              <b> Areas </b>
           </div>
           <br>
          <div class = "row">
           <p class = "my-2"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat bibendum sit felis, sollicitudin et.</p>
          </div>
          <br>
          <div class = "row">
            <nuxt-link to="/areas" tag="button" type="button" class="btn btn-rounded d-flex justify-content-left" style="width: auto;">
                Learn more ->
            </nuxt-link>
          </div>
            </div>
          </div>
          <div class ="col-md-4">
            <img class="card-image" src="/images/index/crazyImage.webp" alt="HyperMeow">
          </div>
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
    height: auto;
    min-height: 200px;
}

.card-left-comp {
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
    height: auto;
    min-height: 200px;
}

.card-right-comp {
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
    width: 80%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.card-image{
    width: 50%;
    justify-content: center;
    align-items: center;
}

.logo {
    display: block;
    margin: 0 auto 2rem;
}

@media screen and (max-width: 1024px) {
    .custom-heading {
        font-size: 2.5em;
    }
    .rounded-image,
    .card-image {
        max-width: 80%;
    }
    .card-left,
    .card-right {
        height: 150px;
    }
}

@media screen and (max-width: 768px) {
    .custom-heading {
        font-size: 2em;
    }
    .rounded-image,
    .card-image {
        max-width: 90%;
    }
    .card-left,
    .card-right {
        height: 120px;
    }
}

@media screen and (max-width: 576px) {
    .custom-heading {
        font-size: 1.5em;
    }
    .rounded-image,
    .card-image {
        max-width: 100%;
    }
    .card-left,
    .card-right {
        height: 100px;
    }
}

</style>

