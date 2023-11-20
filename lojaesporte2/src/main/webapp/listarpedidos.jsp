<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="listarpedidos.css">
    <title>Lista de Pedidos</title>
</head>

<body>
    <header>
        <div class="logo">
            <a href="telaprincipal_usuario.jsp">
                <img src="img/logo.png" width="140px" alt="Logo da empresa">
            </a>
        </div>
        <h1>Listas de Pedidos</h1>
    </header>

    <form action="/listar" method="post">
        <div class="search-container">
            <label for="search">Buscar Pedidos:</label>
            <input type="text" id="search" name="search" placeholder="Digite o numero do pedido">
        </div>
    </form>

    <table>
        <thead>
            <tr>
                <th>Data do Pedido</th>
                <th>Numero do Pedido</th>
                <th>Valor Total</th>
                <th>Status do Pedido</th>
            </tr>
        </thead>
        <tr>
            <td>122042392039</td>
            <td>Whey Protein Baunilha</td>
            <td>120.0</td>
            <td>Aguardando Pagamento</td>
            <td>
                <form action="/alteraStatusPedido" method="post">
                    <input type="hidden" name="id" value="#">
                    <input type="hidden" name="novaStatus" value="#">
                    <button type="submit" onclick="confirmarAlteracao(${listaprodutos.ID})">Alterar
                        Status</button>
                </form>
            </td>
        </tr>
        <tr>
            <td>122042392039</td>
            <td>Whey Protein Baunilha</td>
            <td>120.0</td>
            <td>Pagamento em Processamento</td>
            <td>
                <form action="/alteraStatusPedido" method="post">
                    <input type="hidden" name="id" value="#">
                    <input type="hidden" name="novaStatus" value="#">
                    <button type="submit" onclick="confirmarAlteracao(${listaprodutos.ID})">Alterar
                        Status</button>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="paginacao">
        <button id="prevPage">Anterior</button>
        <button id="nextPage">Próxima</button>
    </div>
    <script>
        function confirmarAlteracao(id) {
            if (confirm('Deseja realmente alterar o status deste pedido?')) {
                document.getElementById(`formAlterarStatus${id}`).submit();
            } else {
            }
        }
    </script>
</body>

</html>