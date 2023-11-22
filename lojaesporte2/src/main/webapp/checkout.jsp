<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="checkout.css">
    <title>Resumo da Compra</title>
</head>
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

<body>
    <div class="checkout-container">
        <h1>Resumo do Seu Pedido:</h1>
        <div class="order-summary">
            <table>
                <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Valor Unit&aacute;rio</th>
                        <th>Quantidade</th>
                        <th>Valor Total</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Preencha esta tabela com os produtos, valores e quantidades do pedido -->
                </tbody>
            </table>

            <p>Frete: R$ 10.00</p>
            <p>Total Geral: R$ 150.00</p>
            <p>Endere&ccedil;o de Entrega: Endere&ccedil;o 1</p>
            <p>Forma de Pagamento: Cart&atilde;o de Cr&eacute;dito</p>
        </div>

        <button id="concluirCompra">Concluir Compra</button>
        <button id="voltarEscolhaPagamento">Voltar</button>
    </div>

    <script>
        document.getElementById("voltarEscolhaPagamento").addEventListener("click", function () {
            window.location.href = "finalizarcompra.jsp";
        });

        document.getElementById("concluirCompra").addEventListener("click", function () {
            const pagamentoBemSucedido = true;

            if (pagamentoBemSucedido) {
                window.location.href = "pedidos.jsp";
            } else {
                alert("O pagamento falhou. Por favor, tente novamente.");
            }
        });

    </script>
</body>

</html>