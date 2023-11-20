<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="carrinho.css">
    <title>Carrinho de Compras</title>

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
                            <li><a href="cadastrocliente.jsp" id="edit-data-link" style="color: white;">Editar Perfil</a>
                                <ul class="sub-options" id="edit-data-options" style="display: none;">
                                    <li><a href="editar-endereco.jsp" id="edit-address-link" style="color: white;">Editar
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

        <div id="cart-items-container"></div>

        <!-- Adicione informações de subtotal, frete e total aqui -->
        <div class="product-subtotal">Subtotal: R$ <span class="subtotal" id="subtotal">0.00</span></div>
        <div class="product-shipping">Frete: R$ <span class="shipping" id="frete">0.00</span></div>
        <div class="total">Total: R$ <span class="grand-total" id="total">0.00</span></div>

        <!-- Botão para a próxima etapa -->
        <button class="finalizar-pedido" onclick="window.location.href='checkout.jsp';">
            Próxima Etapa
        </button>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Obter dados do carrinho do localStorage
            var carrinho = JSON.parse(localStorage.getItem("cartItems")) || { produtos: [] };

            // Renderizar itens do carrinho
            renderizarItensDoCarrinho();

            // Função para renderizar os itens do carrinho
           function renderizarItensDoCarrinho() {
               var cartItemsContainer = document.getElementById("cart-items-container");
               cartItemsContainer.innerHTML = "";

               if (carrinho && carrinho.produtos) {
                   carrinho.produtos.forEach(function (produto) {
                       var productCard = document.createElement("div");
                       productCard.className = "product-card";

                       // Criar o HTML do item do carrinho
                       var produtoHTML = `
                          <div class="product-info">
                              <img src="data:image/jpeg;base64,${produto.imagem}" alt="${produto.nome}">
                              <div class="product-details">
                                  <div class="product-name">${produto.nome}</div>
                                  <div class="product-price">R$ <span class="price">${produto.preco}</span></div>
                              </div>
                          </div>
                          <div class="product-actions">
                              <button class="remove" onclick="removerItem('${produto.nome}')">-</button>
                              <div class="product-quantity">${produto.quantidade}</div>
                              <button class="add" onclick="adicionarItem('${produto.nome}')">+</button>
                              <button class="delete" onclick="removerItem('${produto.nome}')">
                                  <img src="img/lixeira.png" alt="Remover Produto">
                              </button>
                          </div>
                       `;

                       productCard.innerHTML = produtoHTML;

                       cartItemsContainer.appendChild(productCard);
                   });
               }

               // Atualizar subtotal, frete e total
               atualizarTotal();

               // Log para validar dados
               console.log("Dados do Carrinho:", carrinho);
           }

            // Função para adicionar um item ao carrinho
            window.adicionarItem = function (nomeProduto) {
                var produtoExistente = carrinho.produtos.find(produto => produto.nome === nomeProduto);

                if (produtoExistente) {
                    produtoExistente.quantidade++;
                }

                renderizarItensDoCarrinho();
            };

            // Função para remover um item do carrinho
            window.removerItem = function (nomeProduto) {
                var produtoExistente = carrinho.produtos.find(produto => produto.nome === nomeProduto);

                if (produtoExistente) {
                    if (produtoExistente.quantidade > 1) {
                        produtoExistente.quantidade--;
                    } else {
                        carrinho.produtos = carrinho.produtos.filter(produto => produto.nome !== nomeProduto);
                    }
                }

                renderizarItensDoCarrinho();
            };

            // Função para finalizar o pedido
            function finalizarPedido() {
                // Implemente a lógica para finalizar o pedido
                // ...

                // Redirecione para a próxima página
                window.location.href = "finalizarcompra.jsp";
            }

            // Função para atualizar subtotal, frete e total
           function atualizarTotal() {
               var subtotal = 0;
               var frete = 0.00; // Adicione a lógica de cálculo do frete, se necessário
               var total = 0;

               // Verificar se carrinho e carrinho.produtos são definidos
               if (carrinho && carrinho.produtos && carrinho.produtos.length > 0) {
                   subtotal = carrinho.produtos.reduce((total, produto) => total + produto.preco * produto.quantidade, 0);
                   total = subtotal + frete;
               }

               document.getElementById("subtotal").innerText = subtotal.toFixed(2);
               document.getElementById("frete").innerText = frete.toFixed(2);
               document.getElementById("total").innerText = total.toFixed(2);

               // Log para validar dados
               console.log("Subtotal:", subtotal.toFixed(2), "Frete:", frete.toFixed(2), "Total:", total.toFixed(2));
           }
        });
    </script>
</body>

</html>
