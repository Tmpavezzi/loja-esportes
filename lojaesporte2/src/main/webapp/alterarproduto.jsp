<!DOCTYPE html>
<html>

<head>
    <title>Seja Bem-Vindo</title>
    <link rel="stylesheet" type="text/css" href="alterarproduto.css">
</head>

<body>
    <form action="/atualizar_produto" method="post">
        <h1>Editar Produto</h1>

        <label for="nome">Nome do Produto:</label>
        <input type="text" id="nome" name="nome" required>

        <label for="quantidade">Quantidade em Estoque:</label>
        <input type="number" id="Quantidade" name="Quantidade" required>

        <label for="AvaliacaoProduto">Avaliação (de 1 a 5 em incrementos de 0,5):</label>
        <input type="number" id="AvaliacaoProduto" name="AvaliacaoProduto" max="5" step="0.5" required>

        <label for="DescricaoProduto">Descrição Detalhada (até 2000 caracteres):</label>
        <textarea id="DescricaoProduto" name="DescricaoProduto" rows="5" maxlength="2000" required></textarea>

        <label for="PrecoProduto">Preço do Produto:</label>
        <input type="number" id="preco" name="preco" required>

        <label for="ImagemProduto">Imagens:</label>
        <input type="file" id="ImagemProduto" name="ImagemProduto" accept="image/*" multiple required>

        <label for="defaultImage">Imagem Padrão:</label>
        <select id="defaultImage" name="defaultImage" required></select>

            <input type="submit" value="Salvar">
    </form>
</body>

</html>