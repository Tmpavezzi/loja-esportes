<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="carrinho.css">
        <title>Carrinho de Compras</title>
    </head>
    <style>
    .mais-produtos-button {
        text-decoration: none;
        color: white;
        border-radius: 2px;
        margin-left: 5px;
        margin-right: 50px;
        transition-duration: .5s;
        background: none;
        border: none;
        cursor: pointer;
    }

    .mais-produtos-button:hover {
        background-color: #e9e9e9;
        color: black;
    }
    </style>
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
                            <button class="nav mais-produtos-button" type="submit">Mais Produto</button>
                        </form>
                    </li>
                    <li><a href="pedidos.jsp">Acompanhar Pedidos</a></li>
                </ul>
            </nav>
            <div class="user">
                <c:choose>
                    <c:when test="${empty sessionScope.userLoggedIn}">
                        <a href="index.jsp">Fa&ccedil;a Login</a>
                        <a href="cadastrocliente.jsp">Crie Seu Login</a>
                    </c:when>
                    <c:otherwise>
                        <div class="user-dropdown">
                            <img src="img/usuario.png" width="30px" height="30px" alt="Ícone do Usuário" id="user-icon">
                            <ul class="dropdown-options">
                                <li><a href="/Logout" style="color: white;">Ver Perfil</a></li>
                                <li><a href="cadastrocliente.jsp" id="edit-data-link" style="color: white;">Editar
                                        Perfil</a>
                                    <ul class="sub-options" id="edit-data-options" style="display: none;">
                                        <li><a href="editar-endereco.jsp" id="edit-address-link"
                                                style="color: white;">Editar
                                                Endere&ccedil;o de Entrega</a></li>
                                        <li><a href="editar-dados.jsp" id="edit-data-link" style="color: white;">Alterar
                                                Dados</a></li>
                                        <li><a href="editar-endereco.jsp" id="add-address-link"
                                                style="color: white;">Adicionar Endere&ccedil;o de Entrega</a></li>
                                    </ul>
                                </li>
                                <li><a href="/Logout" style="color: red;">Deslogar</a></li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="cart-icon">
                <a href="carrinho.jsp">
                    <img src="img/cart-icon.png" alt="Ícone de Carrinho">
                </a>
            </div>
        </header>

        <div class="cart-container">
            <h2>Seu Carrinho</h2>
            <c:forEach var="produto" items="${carrinho}">
                <div class="product-card">
                    <div class="product-info">

                       <img src="data:image/jpeg;base64, ${produto.imagemBase64}" alt="Imagem do Produto"/>
                         <div class="product-details">
                           <div class="product-name">${produto.nome}</div>
                           <div class="product-price">R$ <span class="price"> ${produto.preco} </span></div>
                            </div>
                                </div>
                                <div class="product-actions">
                                    <button class="remove">-</button>
                                    <span class="product-quantity">1</span>
                                    <button class="add">+</button>
                                    <button class="delete">
                                        <img src="/img/lixeira.png" alt="Remover Produto">
                                    </button>
                                </div>
                            </div>

            </c:forEach>
            <div class="product-subtotal">Subtotal: R$ <span class="subtotal">0.00</span></div>
            <div class="product-shipping">Frete: R$ <span class="shipping">5.00</span></div>
            <div class="total">Total: R$ <span class="grand-total">0.00</span></div>
            <button class="finalizar-pedido">
                <a href="finalizarcompra.jsp" style="text-decoration: none; color: inherit;">Finalizar Compra
            </button>
        </div>
        <!--<script>
                    document.addEventListener("DOMContentLoaded", function () {
                        console.log("Página carregada");

                        var carrinho = JSON.parse(localStorage.getItem("cartItems")) || [];

                        function renderizarItensDoCarrinho() {
                            console.log("Entrou na função renderizarItensDoCarrinho");

                            var cartItemsContainer = document.getElementById("cart-items-container");
                            cartItemsContainer.innerHTML = "";

                            if (!carrinho || carrinho.length === 0) {
                                console.log("Carrinho vazio");
                                cartItemsContainer.innerHTML = "<p>Carrinho vazio</p>";
                                return;
                            }

                            carrinho.forEach(function (produto) {
                                console.log("Produto no carrinho:", produto);

                                var productCard = document.createElement("div");
                                productCard.className = "product-card";

                                var produtoHTML = `
                      <div class="product-info">
                          <img src="${produto.image}" alt="${produto.name}">
                          <div class="product-details">
                              <div class="product-name">${produto.name}</div>
                              <div class="product-price">R$ <span class="price">${produto.price.toFixed(2)}</span></div>
                          </div>
                      </div>
                      <div class="product-actions">
                      <button class="diminui">-</button>
                             <div class="product-quantity">1</div>
                             <button class="add">+</button>
                          <button class="remove" onclick="removerItem('${produto.name}')">
                               <img src="/img/lixeira.png" alt="Remover Produto">
                          </button>
                      </div>
                  `;

                                productCard.innerHTML = produtoHTML;
                                cartItemsContainer.appendChild(productCard);
                            });

                            console.log("Renderização concluída");
                        }

                        function atualizarTotal() {
                            console.log("Entrou na função atualizarTotal");

                            var subtotal = 0;

                            if (carrinho && carrinho.length > 0) {
                                subtotal = carrinho.reduce(function (total, produto) {
                                    return total + parseFloat(produto.price);
                                }, 0);
                            }

                            document.getElementById("subtotal").innerText = subtotal.toFixed(2);

                            console.log("Atualização do total concluída");
                        }

                        window.adicionarItem = function (nomeProduto, precoProduto, imagemProduto) {
                            console.log("Adicionando item:", nomeProduto, "Preço:", precoProduto);

                            var produtoExistente = carrinho.find(produto => produto.name === nomeProduto);

                            if (produtoExistente) {
                                produtoExistente.price += precoProduto;
                            } else {
                                carrinho.push({
                                    name: nomeProduto,
                                    price: precoProduto,
                                    image: imagemProduto
                                });
                            }

                            console.log("Novo carrinho:", carrinho);

                            localStorage.setItem("cartItems", JSON.stringify(carrinho));
                            renderizarItensDoCarrinho();
                            atualizarTotal();

                            console.log("Item adicionado, carrinho:", carrinho);
                        };


                        window.removerItem = function (nomeProduto) {
                            console.log("Antes da remoção:", carrinho);

                            carrinho = carrinho.filter(produto => produto.name !== nomeProduto);

                            console.log("Após a remoção:", carrinho);

                            localStorage.setItem("cartItems", JSON.stringify(carrinho));
                            renderizarItensDoCarrinho();
                            atualizarTotal();

                            console.log("Item removido, carrinho:", carrinho);
                        };

                        renderizarItensDoCarrinho();
                        atualizarTotal();
                    });
                </script> -->
            <script src="carrinho.js"></script>
    </body>
    </html>