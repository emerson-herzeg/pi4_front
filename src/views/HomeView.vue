<template>
  <div class="text-center">
    <div class="d-grid gap-2">
    <span>Esse site é parte do Projeto Integrador IV de 2023 da Universidade Virtual de São Paulo com o objetivo
      de prever a ocorrência de chuvas utilizando dados de sensores instalados da cidade e analisados por um modelo
      matemático complexo. Clique no botão abaixo para saber se irá chover ou não. Para mais informações clique no botão Saiba Mais. </span>
      <router-link class="btn btn-primary mt-5 btn-lg" to="/forecast">Previsão</router-link>
    </div>
  </div>
</template>

<script>
export default {
  setup() {
    const handleForecast = () => {
      // Lógica para lidar com a previsão
    }

    return {
      handleForecast
    }
  }
}
</script>
