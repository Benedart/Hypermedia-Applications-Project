<template>
  <div class="card-form">
    <div class="corner-circle top-left"></div>
    <div class="small-circle below-top-left"></div>
    <div class="corner-circle bottom-right"></div>
    <div class="small-circle above-bottom-right"></div>
    <h2>Get in touch</h2>
    <form @submit="handleSubmit" class="form-content">
      <div class="form-group">
        <label for="name">Full Name*</label>
        <input type="text" id="name" name="name" v-model="name" placeholder="Enter your full name" class="form-control">
        <p class="error-text" v-if="errors.name === 'required'">Uh! Oh! It appears that you are missing Full Name. Please fill it in before submitting again.</p>
      </div>
      <div class="form-group">
        <label for="email">Email Address*</label>
        <input type="email" id="email" name="email" v-model="email" placeholder="Enter your email address" class="form-control">
        <p class="error-text" v-if="errors.email === 'required'">Uh! Oh! It appears that you are missing Email Address. Please fill it in before submitting again.</p>
        <p class="error-text" v-if="errors.email === 'invalid'">Uh! Oh! It appears that you have entered an invalid email address. Please correct it before submitting again.</p>
      </div>
      <div class="form-group">
        <label for="phone">Phone Number*</label>
        <input type="tel" id="phone" name="phone" v-model="phone" placeholder="Enter your phone number" class="form-control">
        <p class="error-text" v-if="errors.phone === 'required'">Uh! Oh! It appears that you have not entered a phone number. Please fill it in before submitting again.</p>
        <p class="error-text" v-if="errors.phone === 'invalid'">Uh! Oh! It appears that you have entered an invalid phone number. Please correct it before submitting again.</p>
      </div>
      <div class="form-group">
        <label for="message">Have anything to say?*</label>
        <textarea id="message" name="message" v-model="message" placeholder="Your message here" class="form-control"></textarea>
        <p class="error-text" v-if="errors.message === 'required'">Uh! Oh! It appears that you are missing the message. Please fill it in before submitting again.</p>
      </div>
      <button type="submit" class="btn btn-primary">Send</button>
    </form>
    <transition name="fade">
      <div class="confirmation" v-if="isSubmitted">
        Your message has been sent successfully!
      </div>
    </transition>
  </div>
</template>

<script>
export default {
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
  methods: {
    handleSubmit(event) {
      event.preventDefault();

      // Reset errors
      this.errors = {
        name: null,
        email: null,
        phone: null,
        message: null
      };

      // Perform form validation
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

      // Submit form if there are no errors
      if (Object.values(this.errors).every(error => !error)) {
        this.isSubmitted = true;
        setTimeout(() => {
          this.isSubmitted = false;
        }, 5000);
      }
    },
    isValidEmail(email) {
      // Perform email validation logic
      // Return true if valid, false otherwise
      // E.g., using a regular expression:
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return emailRegex.test(email);
    },
    isValidPhone(phone) {
      const phoneRegex = /^\d{10}$/;
      return phoneRegex.test(phone);
    }

  }
}
</script>

<style scoped>
.card-form {
  position: relative;
  padding: 25px;
  border: 1px solid #ccc;
  border-radius: 15px;
  box-shadow: 2px 2px 6px 0px #c0c0c0;
  background-color: #EBEBEB;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.corner-circle {
  position: absolute;
  background-color: #A3A3A3;
  border-radius: 50%;
  width: 10vw;
  height: 10vw;
}

.small-circle {
  position: absolute;
  background-color: #A3A3A3;
  border-radius: 50%;
  width: 2.5vw;
  height: 2.5vw;
}

.top-left {
  top: 2vw;
  left: 2vw;
}

.below-top-left {
  top: 11vw;
  left: 11vw;
}

.bottom-right {
  bottom: 2vw;
  right: 2vw;
}

.above-bottom-right {
  bottom: 11vw;
  right: 11vw;
}

h2 {
  align-self: center;
}

.form-content {
  display: flex;
  flex-direction: column;
  width: 50%;
  align-items: center;
}

.form-group {
  display: flex;
  flex-direction: column;
  width: 100%;
  margin-bottom: 15px;
}

.form-control {
  padding: 10px;
  border-radius: 3px;
  border: 1px solid #ccc;
}

.btn {
  display: block;
  width: 100%;
  padding: 10px;
  border: none;
  border-radius: 3px;
  color: #fff;
  background-color: #555555;
}

.confirmation {
  align-self: center;
  color: white;
  background-color: rgba(0, 128, 0, 0.5);
  padding: 10px;
  border-radius: 3px;
}

.error-text {
  color: white;
  background-color: rgba(255, 0, 0, 0.5);
  padding: 5px;
  border-radius: 3px;
}

.fade-enter-active, .fade-leave-active {
  transition: opacity 1s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}

@media (max-width: 768px) {
  .form-content {
    width: 90%;
  }

  .corner-circle {
    width: 40px;
    height: 40px;
  }

  .small-circle {
    width: 15px;
    height: 15px;
  }

  .top-left {
    top: 10px;
    left: 10px;
  }

  .below-top-left {
    top: 50px;
    left: 50px;
  }

  .bottom-right {
    bottom: 10px;
    right: 10px;
  }

  .above-bottom-right {
    bottom: 50px;
    right: 50px;
  }
}
</style>
