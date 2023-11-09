<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="maisprodutos_usuario.css">
    <style>
        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0px 4px 6px rgb(17, 0, 255);
            padding: 20px;
            margin: 55px;
            display: inline-block;
            flex-wrap: wrap;
            justify-content: space-between;
            text-align: center;
            transition: transform 0.2s ease;
            vertical-align: top;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 5px 10px 30px 10px rgb(17, 0, 255);
        }

        .product-card img {
            max-width: 150px;
            height: auto;
            margin-bottom: 10px;
        }

        .product-card h2 {
            font-size: 1.5rem;
            margin: 10px 0;
        }

        .product-card p {
            font-size: 1.2rem;
            color: black;
            margin-bottom: 15px;
        }

        .product-card button {
            background-color: #1600db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .product-card button:hover {
            background-color: rgb(55, 0, 255);
        }

        #pagination {
            text-align: center;
            margin-top: 20px;
        }

        #pagination button {
            display: inline-block;
            padding: 5px 10px;
            margin: 0 5px;
            background-color: #1600db;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .user-dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-options {
            display: none;
            position: absolute;
            background-color: black;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.8);
            z-index: 1;
        }

        .dropdown-options li {
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            color: white;
        }

        .search {
            text-align: center;
            margin: 20px 0;
        }

        button#searchButton:hover {
            background-color: #0056b3;
        }

        input[type="text"] {
            padding: 5px;
            width: 300px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            margin: 0 10px;
        }

        .nprod {
            text-align: center
        }

        .dropdown-options li:hover {
            background-color: black;
        }
    </style>
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
            <a href="index.jsp">Fa&ccedil;a Login</a>
            <a href="cadastrocliente.jsp">Crie Seu Login</a>
        </div>
        <div class="user-dropdown">
            <img src="img/usuario.png" width="30px" height="30px" alt="Ícone do Usuário" id="user-icon">
            <ul class="dropdown-options">
                <li><a href="#" style="color: white;">Ver Perfil</a></li>
                <li><a href="cadastrocliente.jsp" id="edit-data-link" style="color: white;">Editar Perfil</a>
                    <ul class="sub-options" id="edit-data-options" style="display: none;">
                        <li><a href="cadastrocliente.jsp" style="color: white;">Editar Endere&ccedil;o de Entrega</a></li>
                        <li><a href="cadastrocliente.jsp" style="color: white;">Alterar Dados</a></li>
                        <li><a href="cadastrocliente.jsp" style="color: white;">Adicionar Endere&ccedil;o de Entrega</a></li>
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
                            <img src="data:image/jpeg;base64,${maisprodutosusers.imagemBase64}" alt="Imagem do Produto">
                            <p>${maisprodutosusers.nome}</p>
                            <p>R$ ${maisprodutosusers.preco}</p>
                            <a href="maisprodutosusers?idProduto=${maisprodutosusers.ID}"><button>Comprar</button></a>
                            <a href="#"><button>Adicionar ao Carrinho</button></a>
                        </section>
                    </c:forEach>
                </section>
            </c:otherwise>
        </c:choose>

        <!-- Botões de paginação -->
        <div id="pagination">
            <button id="prev-page-button" disabled>Página Anterior</button>
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
            var products = document.querySelectorAll(".product-card");
            var currentPage = 1;
            var productsPerPage = 9;

            function showPage(page) {
                var start = (page - 1) * productsPerPage;
                var end = start + productsPerPage;
                for (var i = 0; i < products.length; i++) {
                    products[i].style.display = "none";
                }
                for (var i = start; i < end; i++) {
                    if (products[i]) {
                        products[i].style.display = "inline-block";
                    }
                }
            }

            function updatePaginationButtons() {
                var prevButton = document.getElementById("prev-page-button");
                var nextButton = document.getElementById("next-page-button");
                prevButton.disabled = currentPage === 1;
                nextButton.disabled = currentPage * productsPerPage >= products.length;
            }

            document.getElementById("prev-page-button").addEventListener("click", function () {
                if (currentPage > 1) {
                    currentPage--;
                    showPage(currentPage);
                    updatePaginationButtons();
                }
            });

            document.getElementById("next-page-button").addEventListener("click", function () {
                if (currentPage * productsPerPage < products.length) {
                    currentPage++;
                    showPage(currentPage);
                    updatePaginationButtons();
                }
            });

            // Inicialmente, exiba a primeira página
            showPage(currentPage);
            updatePaginationButtons();
        });
    </script>
</body>
</html>
