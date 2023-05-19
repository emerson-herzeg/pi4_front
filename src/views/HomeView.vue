<template>
  <div class="text-center">
    <span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent porttitor massa efficitur mauris mattis, eu malesuada libero volutpat. Aliquam pulvinar nisi sed ultrices convallis. Duis bibendum tortor quis tortor iaculis, ut tristique eros vestibulum. Nulla vitae nibh tincidunt, porttitor odio sed, posuere lectus.</span>
    <div class="d-grid gap-2">
      <router-link to="/forecast" class="btn btn-primary mt-5 btn-lg">Previsão</router-link>
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
