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
        </div>
        <div class="user-dropdown">
            <img src="img/usuario.png" width="30px" height="30px" alt="Ícone do Usuário" id="user-icon">
            <ul class="dropdown-options">
                <li><a href="/Logout" style="color: white;">Ver Perfil</a></li>
                <li><a href="cadastrocliente.jsp" id="edit-data-link" style="color: white;">Editar Perfil</a></li>
                <ul class="sub-options" id="edit-data-options" style="display: none;">
                    <li><a href="editar-endereco.jsp" id="edit-address-link" style="color: white;">Editar
                            Endere&ccedil;o de Entrega</a></li>
                    <li><a href="editar-dados.jsp" id="edit-data-link" style="color: white;">Alterar Dados</a></li>
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
    <div class="cart-container">
        <h2>Seu Carrinho</h2>
        <div class="product-card">
            <div class="product-info">
                <img src="img/whey.jpg" alt="Produto 1">
                <div class="product-details">
                    <div class="product-name">Produto 1</div>
                    <div class="product-price">R$ <span class="price">19.99</span></div>
                </div>
            </div>
            <div class="product-actions">
                <button class="remove">-</button>
                <div class="product-quantity">1</div>
                <button class="add">+</button>
                <button class="delete">
                    <img src="img/lixeira.png" alt="Remover Produto">
                </button>
            </div>
        </div>
        <div class="product-card">
            <div class="product-info">
                <img src="img/whey.jpg" alt="Produto 2">
                <div class="product-details">
                    <div class="product-name">Produto 2</div>
                    <div class="product-price">R$ <span class="price">29.99</span></div>
                </div>
            </div>
            <div class="product-actions">
                <button class="remove">-</button>
                <div class="product-quantity">2</div>
                <button class="add">+</button>
                <button class="delete">
                    <img src="img/lixeira.png" alt="Remover Produto">
                </button>
            </div>
        </div>
        <div class="product-subtotal">Subtotal: R$ <span class="subtotal">0.00</span></div>
        <div class="product-shipping">Frete: R$ <span class="shipping">5.00</span></div>
        <div class="total">Total: R$ <span class="grand-total">0.00</span></div>
        <button class="finalizar-pedido">
            <a href="finalizarcompra.jsp" style="text-decoration: none; color: inherit;">Pr&oacute;xima Etapa
        </button>
    </div>
    <script src="carrinho.js"></script>
</body>

</html>