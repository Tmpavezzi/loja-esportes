<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
            <c:if test="${not empty sessionScope.carrinho}">
                        <c:forEach var="produto" items="${sessionScope.carrinho}">
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
            <button class="finalizar-pedido" onclick="finalizarCompra()">
                Finalizar Compra
            </button>
             </c:if>
        </div>
   <script>
       function calcularTotalPedido(carrinho) {
           // Implementação do cálculo do total do pedido
           var total = 0;

           for (var i = 0; i < carrinho.length; i++) {
               var produto = carrinho[i];
               total += produto.preco * produto.quantidade;
           }

           return total;
       }

       function finalizarCompra() {
           console.log("Função finalizarCompra() chamada");

           var carrinho = []; // Obtenha o array do carrinho da sua página, pode ser uma variável JavaScript ou outra fonte

           // Cria um formulário dinâmico
           var form = document.createElement("form");
           form.setAttribute("method", "post");
           form.setAttribute("action", "/FinalizarCompraServlet");

           // Adiciona os campos ao formulário
           var totalPedidoInput = document.createElement("input");
           totalPedidoInput.setAttribute("type", "hidden");
           totalPedidoInput.setAttribute("name", "totalPedido");
           totalPedidoInput.setAttribute("value", calcularTotalPedido(carrinho));
           form.appendChild(totalPedidoInput);

           carrinho.forEach(function (produto, index) {
               var nomeInput = document.createElement("input");
               nomeInput.setAttribute("type", "hidden");
               nomeInput.setAttribute("name", "produtoNome" + index);
               nomeInput.setAttribute("value", produto.nome);
               form.appendChild(nomeInput);

               var precoInput = document.createElement("input");
               precoInput.setAttribute("type", "hidden");
               precoInput.setAttribute("name", "produtoPreco" + index);
               precoInput.setAttribute("value", produto.preco);
               form.appendChild(precoInput);

               var quantidadeInput = document.createElement("input");
               quantidadeInput.setAttribute("type", "hidden");
               quantidadeInput.setAttribute("name", "produtoQuantidade" + index);
               quantidadeInput.setAttribute("value", produto.quantidade);
               form.appendChild(quantidadeInput);
           });

           // Adiciona o formulário ao corpo do documento e o submete
           document.body.appendChild(form);
           form.submit();
       }
   </script>
            <script src="carrinho.js"></script>
    </body>
    </html>