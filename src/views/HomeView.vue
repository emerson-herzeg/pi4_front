<template>
  <div class="text-center">
    <img :src="logoUnivesp">
    <div class="d-grid gap-2">

    <span style=" text-align: justify; padding: 20px">Esse site é parte do Projeto Integrador IV de 2023, de alunos dos cursos de Engenharia da Computação e
      Ciência de Dados, da Universidade Virtual do Estado de São Paulo, com o objetivo de prever a ocorrência de chuvas.
      Utilizando dados de sensores instalados na cidade de Campinas-SP,
      são aplicadas algumas técnicas e Machine Learning.</span>
      <router-link class="btn btn-primary mt-5 btn-lg" to="/forecast">Previsão</router-link>
    </div>
  </div>
</template>

<script>
import logoUnivesp from '../assets/logo-univesp.png'
export default {
  data() {
    return {
      logoUnivesp
    }
  }
}
</script>
