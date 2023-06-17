<template>
  <!-- Card form main container -->
  <div class="card-form">
    <!-- Decorative circles -->
    <div class="corner-circle top-left"></div>
    <div class="small-circle below-top-left"></div>
    <div class="corner-circle bottom-right"></div>
    <div class="small-circle above-bottom-right"></div>
    
    <!-- Form heading -->
    <h2>Get in touch</h2>
    
    <!-- Form body -->
    <form @submit="handleSubmit" class="form-content">
      <!-- Full name input -->
      <div class="form-group">
        <label for="name" style="color: #FFFBFA;">Full Name*</label>
        <input type="text" id="name" name="name" v-model="name" placeholder="Enter your full name" class="form-control">
        <!-- Error message for required full name -->
        <p class="error-text" v-if="errors.name === 'required'">It appears that you are missing Full Name. Please fill it in before submitting again.</p>
      </div>
      
      <!-- Email address input -->
      <div class="form-group">
        <label for="email" style="color: #FFFBFA;">Email Address*</label>
        <input type="email" id="email" name="email" v-model="email" placeholder="Enter your email address" class="form-control">
        <!-- Error messages for required and invalid email address -->
        <p class="error-text" v-if="errors.email === 'required'">It appears that you are missing Email Address. Please fill it in before submitting again.</p>
        <p class="error-text" v-if="errors.email === 'invalid'">It appears that you have entered an invalid email address. Please correct it before submitting again.</p>
      </div>
      
      <!-- Phone number input -->
      <div class="form-group">
        <label for="phone" style="color: #FFFBFA;">Phone Number*</label>
        <input type="tel" id="phone" name="phone" v-model="phone" placeholder="Enter your phone number" class="form-control">
        <!-- Error messages for required and invalid phone number -->
        <p class="error-text" v-if="errors.phone === 'required'">It appears that you have not entered a phone number. Please fill it in before submitting again.</p>
        <p class="error-text" v-if="errors.phone === 'invalid'">It appears that you have entered an invalid phone number. Please correct it before submitting again.</p>
      </div>
      
      <!-- Message text area -->
      <div class="form-group">
        <label for="message" style="color: #FFFBFA;">Have anything to say?*</label>
        <textarea id="message" name="message" v-model="message" placeholder="Your message here" class="form-control"></textarea>
        <!-- Error message for required message -->
        <p class="error-text" v-if="errors.message === 'required'">It appears that you are missing the message. Please fill it in before submitting again.</p>
      </div>
      
      <!-- Form submission button -->
      <button type="submit" class="btn btn-primary"><strong>Send</strong></button>
    </form>
    
    <!-- Confirmation message after successful submission -->
    <transition name="fade">
      <div class="confirmation" v-if="isSubmitted">
        Your message has been sent successfully!
      </div>
    </transition>
  </div>
</template>

<script>
// Vue component export
export default {
  // Component data
  data() {
    return {
      name: '',
      email: '',
      phone: '',
      message: '',
      isSubmitted: false,
      errors: {
        name: null,
        email: null,
        phone: null,
        message: null
      }
    }
  },
  // Component methods
  methods: {
    // Handle form submission
    handleSubmit(event) {
      // Prevent default form submission
      event.preventDefault();

      // Reset error messages
      this.errors = {
        name: null,
        email: null,
        phone: null,
        message: null
      };

      // Validate form inputs
      if (!this.name) {
        this.errors.name = 'required';
      }
      if (!this.email) {
        this.errors.email = 'required';
      } else if (!this.isValidEmail(this.email)) {
        this.errors.email = 'invalid';
      }
      if (!this.phone) {
        this.errors.phone = 'required';
      } else if (!this.isValidPhone(this.phone)) {
        this.errors.phone = 'invalid';
      }
      if (!this.message) {
        this.errors.message = 'required';
      }

      // If no errors, submit form and reset isSubmitted after 5 seconds
      if (Object.values(this.errors).every(error => !error)) {
        this.isSubmitted = true;
        setTimeout(() => {
          this.isSubmitted = false;
        }, 5000);
      }
    },
    // Check for valid email
    isValidEmail(email) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return emailRegex.test(email);
    },
    // Check for valid phone number
    isValidPhone(phone) {
      const phoneRegex = /^\d{10}$/;
      return phoneRegex.test(phone);
    }

  }
}
</script>


<style scoped>
  /* Style for the card form */
  .card-form {
    position: relative;
    padding: 25px;
    border: 1px solid #000022;
    border-radius: 15px;
    box-shadow: 2px 2px 6px 0px #000022;
    background-color: #000022;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  /* General style for the circles */
  .corner-circle,
  .small-circle {
    position: absolute;
    border-radius: 50%;
  }

  /* Large circle style */
  .corner-circle {
    background-color: #FFFBFA;
    width: 10vw;
    height: 10vw;
  }

  /* Small circle style */
  .small-circle {
    background-color: #D9D9D9;
    width: 2.5vw;
    height: 2.5vw;
  }

  /* Positioning for large circles */
  .top-left {
    top: 2vw;
    left: 2vw;
  }

  .bottom-right {
    bottom: 2vw;
    right: 2vw;
  }

  /* Positioning for small circles */
  .below-top-left {
    top: 11vw;
    left: 11vw;
  }

  .above-bottom-right {
    bottom: 11vw;
    right: 11vw;
  }

  /* Style for h2 */
  h2 {
    align-self: center;
    color: #FFFBFA;
  }

  /* Style for form content */
  .form-content {
    display: flex;
    flex-direction: column;
    width: 50%;
    align-items: center;
  }

  /* Style for form group */
  .form-group {
    display: flex;
    flex-direction: column;
    width: 100%;
    margin-bottom: 15px;
  }

  /* Style for form controls */
  .form-control {
    padding: 10px;
    border-radius: 3px;
    border: 1px solid #ccc;
  }

  /* Style for button */
  .btn {
    display: block;
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 3px;
    color: #fff;
    background-color: #086788;
  }

  .btn:hover,

  .btn:active {

    background-color:  rgb(13, 79, 106);
  } 

  /* Style for confirmation text */
  .confirmation {
    align-self: center;
    color: white;
    background-color: rgba(0, 128, 0, 0.5);
    padding: 10px;
    border-radius: 3px;
  }

  /* Style for error text */
  .error-text {
    color: white;
    background-color: rgba(255, 0, 0, 0.5);
    padding: 5px;
    border-radius: 3px;
  }

  /* Transition styles */
  .fade-enter-active, .fade-leave-active {
    transition: opacity 1s;
  }
  
  .fade-enter, .fade-leave-to {
    opacity: 0;
  }

  /* Mobile responsive styles */
  @media (max-width: 768px) {
    /* Adjust form content width */
    .form-content {
      width: 90%;
    }

    /* Adjust large circle size */
    .corner-circle {
      width: 40px;
      height: 40px;
    }

    /* Adjust small circle size */
    .small-circle {
      width: 15px;
      height: 15px;
    }

    /* Adjust large circle positions */
    .top-left {
      top: 10px;
      left: 10px;
    }

    .bottom-right {
      bottom: 10px;
      right: 10px;
    }

    /* Adjust small circle positions */
    .below-top-left {
      top: 50px;
      left: 50px;
    }

    .above-bottom-right {
      bottom: 50px;
      right: 50px;
    }
  }
</style>

