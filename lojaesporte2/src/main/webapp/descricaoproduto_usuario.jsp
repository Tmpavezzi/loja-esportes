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
                <div class="logo">
                    <a href="telaprincipal_usuario.jsp">
                        <img src="img/logo.png" width="140px" alt="Logo da empresa">
                    </a>
                </div>
                <nav>
                    <ul>
                        <li><a href="telaprincipal_usuario.jsp">Home</a></li>
                        <li><a href="maisprodutos_usuarios.jsp">Mais Produtos</a></li>
                        <li><a href="#">Acompanhar Pedidos</a></li>
                    </ul>
                </nav>
                <div class="user">
                    <c:choose>
                        <c:when test="${empty sessionScope.userLoggedIn}">
                            <a href="index.jsp">Fa&ccedil;a Login</a>
                            <a href="cadastrocliente.jsp">Crie Seu Login</a>
                        </c:when>
                        <c:otherwise>
                </div>
                <div class="user-dropdown">
                    <img src="img/usuario.png" width="30px" height="30px" alt="Ícone do Usuário" id="user-icon">
                    <ul class="dropdown-options">
                        <li><a href="/Logout" style="color: white;">Ver Perfil</a></li>
                        <li><a href="cadastrocliente.jsp" id="edit-data-link" style="color: white;">Editar Perfil</a>
                        </li>
                        <ul class="sub-options" id="edit-data-options" style="display: none;">
                            <li><a href="editar-endereco.jsp" id="edit-address-link" style="color: white;">Editar
                                    Endere&ccedil;o de Entrega</a></li>
                            <li><a href="editar-dados.jsp" id="edit-data-link" style="color: white;">Alterar Dados</a>
                            </li>
                            <li><a href="editar-endereco.jsp" id="add-address-link" style="color: white;">Adicionar
                                    Endere&ccedil;o de Entrega</a></li>
                        </ul>
                        </li>
                        <li><a href="/Logout" style="color: red;">Deslogar</a></li>
                    </ul>
                    </c:otherwise>
                    </c:choose>
                </div>
                <div class="cart-icon">
                    <a href="carrinho.jsp">
                        <img src="img/cart-icon.png" alt="Ícone de Carrinho">
                    </a>
                </div>
            </header>

            <div class="product-details">
                <div class="carousel-container">
                    <div class="carousel">
                        <div class="carousel-slide">
                            <img id="productImage" alt="Imagem do Produto">
                        </div>
                    </div>
                </div>

                <div class="product-info">
                    <h1>${nomeProduto}</h1>
                    <p><strong>Avaliação:
                        <%
                            double avaliacaoDouble = Double.parseDouble(request.getAttribute("avaliacao").toString());
                            int estrelas = (int) Math.round(avaliacaoDouble); // Arredonde a avaliação para o inteiro
                            for (int i = 0; i < estrelas; i++) {
                        %>
                            &#9733; <!-- Caractere da estrela (★) -->
                        <% } %>
                    </p>
                    <p><strong>Preço:</strong> R$ ${preco}</p>
                    <p><strong>Descrição:</strong> ${descricao}</p>
                    <button id="comprar-btn" disabled>Comprar</button>
                </div>
            </div>

            <script>
                var produtoId = <%= request.getAttribute("produtoId") %>;

                var servletURL = "imagemservlet?produtoId=" + produtoId;

                var xhr = new XMLHttpRequest();
                xhr.open("GET", servletURL, true);

                xhr.onload = function () {
                    if (xhr.status === 200) {
                        var imageURL = xhr.responseText;
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