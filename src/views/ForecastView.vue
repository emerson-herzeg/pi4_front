<template>
  <div class="background">
    <div class="icon-container">
      <img :src="currentIcon" alt="" class="responsive-image" :class="{ spin: currentIcon === sunIcon, moveHorizontal: currentIcon === rainIcon }">
    </div>
  </div>
</template>

<style>
.responsive-image {
  max-width: 75%; /* ajuste conforme necessário */
  height: auto;
}

.icon-container {
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

@keyframes moveHorizontal {
  0% { transform: translateX(-30%); }
  50% { transform: translateX(30%); }
  100% { transform: translateX(-30%); }
}

.moveHorizontal {
  animation: moveHorizontal 5s ease-in-out infinite;
}
</style>

<script>
import sunIcon from '../assets/sun.png'
import rainIcon from '../assets/rain.png'
export default {
  data() {
    return {
      sunIcon,
      rainIcon,
      currentIcon:this.getRandomIcon() // Altere isso para rainIcon para exibir a nuvem
    }
  },
  methods: {
    getRandomIcon() {
      // Este método seleciona aleatoriamente um dos ícones
      return Math.random() < 0.5 ? this.sunIcon : this.rainIcon;
    }
  },
  created() {
    // Depois que o componente é criado, definimos currentIcon
    this.currentIcon = this.getRandomIcon();
  }
}
</script>
