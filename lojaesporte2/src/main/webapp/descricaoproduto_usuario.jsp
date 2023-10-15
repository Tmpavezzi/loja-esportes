<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <img src="img/logo.png" width="140px" alt="Logo da empresa">
        </div>
        <nav>
            <ul>
                <li><a href="telaprincipal_usuario.jsp">Home</a></li>
                <li><a href="maisprodutos_usuario.jsp">Mais Produtos</a></li>
                <li><a href="#">Sobre Nós</a></li>
            </ul>
        </nav>
        <div class="user">
            <a href="index.jsp">Faça Login</a>
            <a href="cadastrodeusuario.jsp">Crie Seu Login</a>
        </div>
        <div class="cart-icon">
            <img src="img/cart-icon.png" alt="Ícone de Carrinho">
        </div>
    </header>

    <div class="product-details">
        <div class="carousel-container">
            <div class="carousel">
                <div class="carousel-slide">
                    <img src="data:image/jpeg;base64, ${imagemBytes}" alt="Imagem do Produto">
                </div>
                <!-- Adicione mais imagens se necessário -->
            </div>
        </div>

        <div class="product-info">
            <h1>${nomeProduto}</h1>
                   <p><strong>Avaliação: <%
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

    <footer>
        <div class="rodape">
            &copy; 2023 Gym C.A.P.S. Todos os direitos reservados.
        </div>
    </footer>
</body>
</html>
