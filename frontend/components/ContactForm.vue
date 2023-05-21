<template>
  <div class="card-form">
    <div class="corner-circle top-left"></div>
    <div class="small-circle below-top-left"></div>
    <div class="corner-circle bottom-right"></div>
    <div class="small-circle above-bottom-right"></div>
    <h2>Get in touch</h2>
    <form @submit="handleSubmit" class="form-content">
      <div class="form-group">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" placeholder="Enter your full name" class="form-control">
      </div>
      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" placeholder="Enter your email address" class="form-control">
      </div>
      <div class="form-group">
        <label for="phone">Phone Number</label>
        <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" class="form-control">
      </div>
      <div class="form-group">
        <label for="message">Have anything to say?</label>
        <textarea id="message" name="message" placeholder="Your message here" class="form-control"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">Send</button>
    </form>
    <div class="confirmation" v-if="isSubmitted">
      Your message has been sent successfully!
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isSubmitted: false
    }
  },
  methods: {
    handleSubmit(event) {
      event.preventDefault();
      this.isSubmitted = true;
    }
  }
}
</script>

<style scoped>
.card-form {
  position: relative;
  padding: 25px;
  border: 1px solid #ccc;
  border-radius: 5px;
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
  color: #008000;  /* green color */
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


