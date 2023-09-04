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
        <input type="text" id="searchInput" placeholder="Pesquisar produto...">
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
            <!-- Aqui será onde listar os produtos manualmente (para termos base de onde vai ficar) -->
        </tbody>
    </table>

    <div class="pagination">
        <button id="prevPage">Anterior</button>
        <button id="nextPage">Próxima</button>
    </div>
</body>

</html>