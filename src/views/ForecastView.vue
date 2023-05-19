<template>
  <div class="background">
    <div class="sun-container">
      <img :src="sunIcon" alt="" class="responsive-image spin">
    </div>
  </div>
</template>
<style>
.responsive-image {
  max-width: 50%; /* ajuste conforme necessário */
  height: auto;
}

.sun-container {
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.spin {
  animation: spin 8s linear infinite;
}
</style>
<script>
import sunIcon from '../assets/sun.png'
export default {
  data() {
    return {
      sunIcon
    }
  }
}
</script>
