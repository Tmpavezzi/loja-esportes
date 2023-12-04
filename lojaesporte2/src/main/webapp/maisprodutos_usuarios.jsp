<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="maisprodutos.css">
            <title>Lista de Produtos</title>
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
                        <li>
                            <form action="/maisprodutosusers" method="get" class="search-form" style="text-decoration: none; color: white; border-radius: 2px; margin-left: 5px; margin-right: 50px; transition-duration: .5s;">
                                <input type="hidden" name="nomeProduto" placeholder="Mais Produtos">
                                <button type="submit">Mais Produto</button>
                            </form>
                        </li>
                        <li><a href="pedidos.jsp">Acompanhar Pedidos</a></li>
                    </ul>
                </nav>
                <div class="user">
                    <a href="index.jsp">Fa&ccedil;a Login</a>
                    <a href="cadastrocliente.jsp">Crie Seu Login</a>
                </div>
                <div class="user-dropdown">
                    <img src="img/usuario.png" width="30px" height="30px" alt="Ícone do Usuário" id="user-icon">
                    <ul class="dropdown-options">
                        <li><a href="#" style="color: white;">Ver Perfil</a></li>
                        <li><a href="cadastrocliente.jsp" id="edit-data-link" style="color: white;">Editar Perfil</a>
                            <ul class="sub-options" id="edit-data-options" style="display: none;">
                                <li><a href="cadastrocliente.jsp" style="color: white;">Editar Endere&ccedil;o de
                                        Entrega</a></li>
                                <li><a href="cadastrocliente.jsp" style="color: white;">Alterar Dados</a></li>
                                <li><a href="cadastrocliente.jsp" style="color: white;">Adicionar Endere&ccedil;o de
                                        Entrega</a></li>
                            </ul>
                        </li>
                        <li><a href="#" style="color: red;">Deslogar</a></li>
                    </ul>
                </div>
                <div class="cart-icon">
                    <a href="carrinho.jsp">
                        <img src="img/cart-icon.png" alt="Ícone de Carrinho">
                    </a>
                </div>
            </header>
            <main>
                <form action="/maisprodutosusers" method="get" class="search-form" style="text-align: center;">
                    <input type="text" name="nomeProduto" placeholder="Pesquisar por nome...">
                    <button type="submit">Pesquisar</button>
                </form>

                <c:choose>
                    <c:when test="${empty produtos}">
                        <div class="nprod">
                            <p>Nenhum produto encontrado.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <section class="product-carousel">
                            <c:forEach var="maisprodutosusers" items="${produtos}" varStatus="loop">
                                <section class="product-card">
                                    <img src="data:image/jpeg;base64,${maisprodutosusers.imagemBase64}"
                                        alt="Imagem do Produto">
                                    <p>${maisprodutosusers.nome}</p>
                                    <p>R$ ${maisprodutosusers.preco}</p>
                                    <a
                                        href="maisprodutosusers?idProduto=${maisprodutosusers.ID}"><button>Comprar</button></a>
                                    <button class="add-to-cart-button" data-product-id="${maisprodutosusers.ID}"
                                        data-product-name="${maisprodutosusers.nome}"
                                        data-product-price="${maisprodutosusers.preco}"
                                        data-product-image="${maisprodutosusers.imagemBase64}">
                                        <form class="add-to-cart-button" action="AdicionarAoCarrinho" method="post">
                                            <input type="hidden" name="produtoId" value="${maisprodutosusers.ID}">
                                            <input type="hidden" name="produtoNome" value="${maisprodutosusers.nome}">
                                            <input type="hidden" name="produtoPreco" value="${maisprodutosusers.preco}">
                                            <input type="hidden" name="produtoImagem" value="${maisprodutosusers.imagemBase64}">
                                            <input type="submit" value="Adicionar ao carrinho">
                                        </form>
                                    </button>

                                </section>
                            </c:forEach>
                        </section>
                    </c:otherwise>
                </c:choose>


                <!-- Botões de paginação -->
                <div id="pagination">
                    <button id="prev-page-button">Página Anterior</button>
                    <button id="next-page-button">Próxima Página</button>
                </div>

            </main>
            <footer>
                <div class="footer">
                    <p>&copy; 2023 GYM C.A.P.S. Todos os direitos reservados.</p>
                </div>
            </footer>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var addToCartButtons = document.querySelectorAll(".add-to-cart-button");

                    addToCartButtons.forEach(function (button) {
                        button.addEventListener("click", function () {
                            var productId = button.getAttribute("data-product-id");
                            var productName = button.getAttribute("data-product-name");
                            var productPrice = button.getAttribute("data-product-price");
                            var productImage = button.getAttribute("data-product-image");

                            addToCart(productId, productName, productPrice, productImage);
                        });
                    });

                    function addToCart(productId, productName, productPrice, productImage) {
                        var cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
                        cartItems.push({
                            id: productId,
                            name: productName,
                            price: productPrice,
                            image: productImage5
                        });
                        localStorage.setItem("cartItems", JSON.stringify(cartItems));

                        console.log('Produto adicionado ao carrinho:', productName);
                    }
                });
            </script>
        </body>

        </html>