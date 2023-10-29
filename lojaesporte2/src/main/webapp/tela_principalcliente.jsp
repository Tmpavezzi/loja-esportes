<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="telaprincipal_usuario.css">
    <title>Seja Bem-Vindo</title>
    <style>
        /* Estilos CSS personalizados */
    </style>
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
                <li><a href="#">Acompanhar Pedidos</a></li>
            </ul>
        </nav>
        <div class="user">
            <c:choose>
                <c:when test="${empty sessionScope.userLoggedIn}">
                    <a href="index.jsp">Faça Login</a>
                    <a href="cadastrocliente.jsp">Crie Seu Login</a>
                </c:when>
                <c:otherwise>
                    <a href="/Logout" style="color: white;">Ver Perfil</a>
                    <a href="cadastrocliente.jsp" id="edit-data-link" style="color: white;">Editar Perfil</a>
                    <ul class="sub-options" id="edit-data-options" style="display: none;">
                        <li><a href="editar-endereco.jsp" id="edit-address-link" style="color: white;">Editar Endereço de Entrega</a></li>
                        <li><a href="editar-dados.jsp" id="edit-data-link" style="color: white;">Alterar Dados</a></li>
                        <li><a href="editar-endereco.jsp" id="add-address-link" style="color: white;">Adicionar Endereço de Entrega</a></li>
                    </ul>
                    <a href="/Logout" style="color: red;">Deslogar</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="cart-icon">
            <a href="carrinho.jsp">
                <img src="img/cart-icon.png" alt="Ícone de Carrinho">
            </a>
        </div>
    </header>
    <div id="carousel-container">
        <div id="carousel">
            <!-- Seus slides do carrossel aqui -->
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="editar-endereco.js"></script>
    <script>
        // JavaScript para o carrossel
    </script>
    <section class="product-carousel">
        <div class="product-card">
            <!-- Conteúdo do primeiro produto -->
        </div>
        <div class="product-card">
            <!-- Conteúdo do segundo produto -->
        </div>
    </section>
    <script>
        // JavaScript para o carrossel de produtos
    </script>
    <script src="perfil.js"></script>
    <div class="footer">
        <p>&copy; 2023 GYM C.A.P.S. Todos os direitos reservados.</p>
    </div>
</body>
</html>
