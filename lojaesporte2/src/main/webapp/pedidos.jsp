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
                    <td>1</td>
                    <td>2023-11-03</td>
                    <td>50.00</td>
                    <td>Em andamento</td>
                    <td><button onclick="showDetails(1)">Detalhes</button></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>2023-11-04</td>
                    <td>75.50</td>
                    <td>Conclu&iacute;do</td>
                    <td><button onclick="showDetails(2)">Detalhes</button></td>
                </tr>
            </tbody>
        </table>
    </main>

    <script>
        // Função para mostrar detalhes (simulação)
        function showDetails(orderNumber) {
            alert('Detalhes do Pedido ' + orderNumber);
            // Adicione sua lógica para exibir os detalhes reais do pedido
        }

        // Chamada da função para popular a tabela
        populateOrdersTable();
    </script>
</body>
</html>
