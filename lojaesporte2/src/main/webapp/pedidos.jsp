<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="pedidos.css">
    <title>Lista de Pedidos</title>
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
    <main>
        <table>
            <thead>
                <tr>
                    <th>N&uacute;mero do Pedido</th>
                    <th>Data</th>
                    <th>Valor Total</th>
                    <th>Status</th>
                    <th>Detalhes</th>
                </tr>
            </thead>
            <tbody id="ordersTableBody">
                <tr>
                    <td>158978450</td>
                    <td>27-11-2023</td>
                    <td>379.97</td>
                    <td>Concluido</td>
                    <td><button onclick="showDetails('158978450')">Detalhes</button></td>
                </tr>
            </tbody>
        </table>
    </main>
    <div id="orderDetailsModal" style="display: none;">
function showDetails(orderNumber) {
            // Suponha que você tenha detalhes do pedido em algum formato de dados
            const orderDetails = {
                orderNumber: orderNumber,
                date: '27-11-2023',
                totalAmount: '379.97',
                status: 'Concluído',
                shippingAddress: 'Rua Pedroso Alvarenga, 32',
                paymentMethod: 'Cartão de Crédito'
                // Adicione outros detalhes conforme necessário
            };

            // Construa a mensagem de detalhes (pode ser uma estrutura HTML)
            const detailsMessage = `
                <p><strong>Número do Pedido:</strong> ${orderDetails.orderNumber}</p>
                <p><strong>Data:</strong> ${orderDetails.date}</p>
                <p><strong>Valor Total:</strong> R$ ${orderDetails.totalAmount}</p>
                <p><strong>Status:</strong> ${orderDetails.status}</p>
                <p><strong>Endereço de Entrega:</strong> ${orderDetails.shippingAddress}</p>
                <p><strong>Forma de Pagamento:</strong> ${orderDetails.paymentMethod}</p>
                <!-- Adicione outras informações conforme necessário -->
            `;

            // Exiba os detalhes em uma modal (pode ser substituído por outra lógica, como uma modal real)
            const orderDetailsModal = document.getElementById('orderDetailsModal');
            orderDetailsModal.innerHTML = detailsMessage;
            orderDetailsModal.style.display = 'block';
        }
    </script>
</body>
</html>
