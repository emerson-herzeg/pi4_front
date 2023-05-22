<template>
  <div class="background">
    <div class="icon-container">
      <img v-if="!loading" :src="currentIcon" alt="" class="responsive-image" :class="{ spin: currentIcon === sunIcon, moveHorizontal: currentIcon === rainIcon }">
      <p class="icon-text">{{ loading ? 'Aguarde...' : (currentIcon === sunIcon ? 'A previsão é de sol!' : 'Parece que vai chover...') }}</p>
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
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
}

.icon-text {
  text-align: center;
  font-size: 1.5em;
  margin-top: 20px; /* adicione algum espaço entre a imagem e o texto */
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
import { getInfluxDB, getForecast } from '../api/index'

export default {
  data() {
    return {
      sunIcon,
      rainIcon,
      currentIcon: '', // removido a chamada do método getRandomIcon
      loading: true
    }
  },
  methods: {
    setWeatherIcon(previsao) {
      // Este método ajusta o ícone de acordo com o valor da previsão
      this.currentIcon = previsao === 1 ? this.rainIcon : this.sunIcon;
    }
  },
  created() {
    // Depois que o componente é criado, definimos currentIcon
    getInfluxDB()
        .then(response => {
          console.log(response.data)
          getForecast(response.data)
              .then(response => {
                console.log(response)
                this.setWeatherIcon(response.data.previsao)
                this.loading = false
              })
        })
  }
}
</script>
