<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhe do Produto</title>
    <link rel="stylesheet" type="text/css" href="descricaoproduto_usuario.css">
</head>

<body>
    <header>
        <!-- Your header content here -->
    </header>

    <div class="product-details">
        <div class="carousel-container">
            <div class="carousel">
                <div class="carousel-slide">
                    <!-- Image displayed here -->
                    <img id="productImage" alt="Imagem do Produto">
                </div>
            </div>
        </div>

        <div class="product-info">
            <h1>${nomeProduto}</h1>
            <p><strong>Avaliação:
                <%
                double avaliacaoDouble = Double.parseDouble(request.getAttribute("avaliacao").toString());
                int estrelas = (int) Math.round(avaliacaoDouble); // Arredonde a avaliação para o inteiro mais próximo
                for (int i = 0; i < estrelas; i++) {
                %>
                    &#9733; <!-- Caractere da estrela (★) -->
                <%
                }
                %>
            </p>
            <p><strong>Preço:</strong> R$ ${preco}</p>
            <p><strong>Descrição:</strong> ${descricao}</p>
            <button id="comprar-btn" disabled>Comprar</button>
        </div>
    </div>

  <script>
      var produtoId = <%= request.getAttribute("produtoId") %>; // Obtenha o ID do produto do atributo de solicitação

      // Construa a URL do servlet com o produtoId como parâmetro
      var servletURL = "imagem-servlet?produtoId=" + produtoId;

      // Requisição AJAX para o servlet que recupera a imagem
      var xhr = new XMLHttpRequest();
      xhr.open("GET", servletURL, true);

      xhr.onload = function() {
          if (xhr.status === 200) {
              var imageURL = xhr.responseText; // A resposta do servlet é a URL da imagem
              var productImage = document.getElementById("productImage");
              productImage.src = imageURL;
          } else {
              console.error("Erro ao buscar a imagem.");
          }
      };

      xhr.send();
  </script>



    <footer>
        <div class="rodape">
            &copy; 2023 Gym C.A.P.S. Todos os direitos reservados.
        </div>
    </footer>
</body>
</html>
