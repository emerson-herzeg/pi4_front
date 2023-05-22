<script setup>
import { onMounted } from 'vue'
import { RouterLink, RouterView } from 'vue-router'

onMounted(() => {

})
</script>

<template>
  <nav class="navbar fixed-bottom navbar-light">
    <div class="container-fluid justify-content-around">
      <router-link to="/" class="btn btn-primary">
        <i class="bi bi-house-door-fill"></i>
      </router-link>
      <router-link to="/about" class="btn btn-primary" title="Informações">
        <i class="bi bi-info-square-fill"></i>
      </router-link>
    </div>
  </nav>
  <div class="container d-flex justify-content-center align-items-center">
    <RouterView />
  </div>
</template>

<style>
.btn {
  border-radius: 0 !important;
}
.container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

body {
  margin: 0;
  color: #ffffff !important;
  font-size: 1.19em !important;
  font-weight: bold;
  background: linear-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)), url('@/assets/fundo.jpg') center center / cover no-repeat fixed;
}

body, html {
  margin: 0;
  padding: 0;
  height: 100%;
  overflow: hidden;
}
</style>
