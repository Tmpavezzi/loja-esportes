<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="listarprodutos.css">
    <title>Backoffice - Lista de Produtos</title>
</head>

<body>
    <header>
        <div class="logo">
            <img src="img/logo.png" width="140px" alt="Logo da empresa">
        </div>
        <h1>Listas de Produtos</h1>
    </header>

    <div class="search">
        <input type="text" id="searchInput" placeholder="Pesquisar produto">
        <button id="searchButton">Pesquisar</button>
    </div>

    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Nome do Produto</th>
                <th>Quantidade</th>
                <th>Valor</th>
                <th>Status</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>001</td>
                <td>Whey Protein 100%</td>
                <td>50</td>
                <td>R$ 120.00</td>
                <td>Ativo</td>
                <td>
                    <a href="#" class="button">Alterar</a>
                    <a href="#" class="button">Inativar</a>
                    <a href="#" class="button">Visualizar</a>
                </td>
            </tr>
            <!-- Aqui é o espaço onde ficará os produtos que será inserido manualmente 
            (para termos base de onde vai ficar) -->
        </tbody>
    </table>

    <div class="paginacao">
        <button id="prevPage">Anterior</button>
        <button id="nextPage">Próxima</button>
        <button id="btnAddProduto">+ Adicionar Produtos</button>
    </div>
</body>

</html>