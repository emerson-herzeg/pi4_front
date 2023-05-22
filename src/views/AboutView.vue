<template>
  <div class="about">
    <div class="container">
      <h1>Sobre</h1>
      <div class="scrollable-content">
        <p>A previsão de chuvas no aplicativo é feita utilizando uma abordagem baseada em algoritmos de Machine Learning. Foram realizados experimentos utilizando diferentes técnicas e algoritmos, como Regressão Logística, Árvores de Decisão, Random Forest, Gradient Boosting, Redes Neurais Perceptron Multicamadas (MLP), K-Nearest Neighbors (KNN) e Support Vector Machines (SVM).
          <br>
          Após análise exploratória dos dados coletados pelo sensor BME280 e os devidos tratamentos, a melhor abordagem identificada foi a combinação de Oversampling com o algoritmo Random Forest. Essa abordagem mostrou um desempenho excepcional, com alta precisão e recall na previsão de chuvas.
          <br>
          O Random Forest é um algoritmo de aprendizado de máquina que combina várias árvores de decisão para realizar classificações precisas. A técnica de Oversampling é utilizada para lidar com o desequilíbrio de classes no conjunto de dados, aumentando a representação da classe minoritária.
          <br>
          A previsão de chuvas é baseada em características como temperatura, umidade, pressão atmosférica, entre outras. Essas informações são alimentadas no modelo de Random Forest, que aprende a reconhecer padrões e realizar previsões precisas com base nos dados históricos.
          <br>
          É importante destacar que a previsão de chuvas no aplicativo é baseada em dados coletados na cidade de Campinas-SP e que existem algumas limitações, como a inclusão de um conjunto limitado de variáveis e a restrição geográfica. No entanto, a abordagem selecionada tem se mostrado eficaz na previsão de chuvas e no fornecimento de informações relevantes para a população em relação às condições climáticas.
        </p>
      </div>
    </div>
  </div>
</template>

<style>
.about {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100%;
}

.container {
  max-width: 800px;
  padding: 00px 00px; /* Ajuste das margens superior e inferior */
}

.scrollable-content {
  max-height: 400px; /* Defina a altura máxima desejada */
  overflow-y: auto;
  padding: 10px;
  background-color: transparent;
  border: none;
  text-align: justify; /* Adição do estilo para justificar o texto */
}
</style>
