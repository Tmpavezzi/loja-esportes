<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cadastrodeproduto.css">
    <title>Cadastro de Produto</title>
</head>

<body>
    <div class="container">
        <h1>Cadastrar Produto Novo</h1>
        <form action="#" method="POST" enctype="multipart/form-data">
            <label for="NomeProduto">Nome do Produto (até 200 caracteres):</label>
            <input type="text" id="NomeProduto" name="NomeProduto" maxlength="200" required>

            <label for="AvaliacaoProduto">Avaliação (de 1 a 5 em incrementos de 0,5):</label>
            <input type="number" id="AvaliacaoProduto" name="AvaliacaoProduto" max="5" step="0.5" required>

            <label for="DescricaoProduto">Descrição Detalhada (até 2000 caracteres):</label>
            <textarea id="DescricaoProduto" name="DescricaoProduto" rows="5" maxlength="2000" required></textarea>

            <label for="PrecoProduto">Preço do Produto (2 casas decimais):</label>
            <input type="number" id="PrecoProduto" name="PrecoProduto" min="0" step="0.01" required>

            <label for="QuantidadeEstoque">Quantidade em Estoque (valor inteiro):</label>
            <input type="number" id="QuantidadeEstoque" name="QuantidadeEstoque" min="0" step="1" required>

            <label for="ImagemProduto">Imagens:</label>
            <input type="file" id="ImagemProduto" name="ImagemProduto" accept="image/*" multiple required>

            <label for="defaultImage">Imagem Padrão:</label>
            <select id="defaultImage" name="defaultImage" required>
                <!-- Opções de imagens carregadas -->
            </select>

            <button type="submit">Salvar</button>
            <a href="listarproduto.jsp" class="botao">Cancelar</a>
        </form>
    </div>
</body>

</html>