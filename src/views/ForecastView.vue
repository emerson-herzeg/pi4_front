<template>
  <div class="background">
    <div class="icon-container">
      <img v-if="loading" :src="loadingIcon" alt="" class="loading-icon spinLoading">
      <img v-else :src="currentIcon" alt="" class="responsive-image" :class="{ spin: currentIcon === sunIcon, moveHorizontal: currentIcon === rainIcon }">
      <p class="icon-text">{{ loading ? 'Aguarde...' : (currentIcon === sunIcon ? 'A previsão é de sol!' : 'Parece que vai chover...') }}</p>
      <div v-if="!loading" style="width: 100%;" class="p-5">
        <p><b>Últimos dados lidos:</b></p>
        {{dia}}/{{mes}}/{{ano}}<br>
        <table class="table table-bordered table-info">
          <tr>
            <td class="text-start">Temperatura</td>
            <td class="text-end">{{this.temperatura}} &deg;C</td>
          </tr>
          <tr>
            <td class="text-start">Humidade</td>
            <td class="text-end">{{this.humidade}} %</td>
          </tr>
          <tr>
            <td class="text-start">Pressão Atmosférica</td>
            <td class="text-end">{{this.pressao}} hPa</td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</template>

<style>
.responsive-image {
  max-width: 75%; /* ajuste conforme necessário */
  height: auto;
}

.loading-icon {
  max-width: 50%; /* ajuste este valor conforme necessário */
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

@keyframes spinLoading {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.spinLoading {
  animation: spin 4s linear infinite;
}
</style>

<script>
import sunIcon from '../assets/sun.png'
import rainIcon from '../assets/rain.png'
import loadingIcon from '../assets/loading.png'
import { getForecast } from '../api/index'

export default {
  data() {
    return {
      sunIcon,
      rainIcon,
      loadingIcon,
      currentIcon: '', // removido a chamada do método getRandomIcon
      loading: true,
      humidade: '',
      temperatura: '',
      pressao: '',
      dia: '',
      mes: '',
      ano: ''
    }
  },
  methods: {
    setWeatherIcon(previsao) {
      // Este método ajusta o ícone de acordo com o valor da previsão
      this.currentIcon = previsao === 1 ? this.rainIcon : this.sunIcon;
    }
  },
  created() {
    getForecast()
        .then(response => {
          console.log(response)
          this.humidade = response.data.BME280_hum
          this.temperatura = response.data.BME280_temp
          this.pressao = response.data.BME280_pres
          this.dia = response.data.dia
          this.mes = response.data.mes
          this.ano = response.data.ano
          this.setWeatherIcon(response.data.previsao)
          this.loading = false
        })
  }
}
</script>
