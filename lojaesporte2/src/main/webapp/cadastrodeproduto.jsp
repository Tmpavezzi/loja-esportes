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
            <label for="NomeProduto">Nome do Produto (at&eacute; 200 caracteres):</label>
            <input type="text" id="NomeProduto" name="NomeProduto" maxlength="200" required>

            <label for="AvaliacaoProduto">Avalia&ccedil;&atilde;o (de 1 a 5 em incrementos de 0,5):</label>
            <input type="number" id="AvaliacaoProduto" name="AvaliacaoProduto" max="5" step="0.5" required>

            <label for="DescricaoProduto">Descri&ccedil;&atilde;o Detalhada (at&eacute; 2000 caracteres):</label>
            <textarea id="DescricaoProduto" name="DescricaoProduto" rows="5" maxlength="2000" required></textarea>

            <label for="PrecoProduto">Pre&ccedil;o do Produto (2 casas decimais):</label>
            <input type="number" id="PrecoProduto" name="PrecoProduto" min="0" step="0.01" required>

            <label for="QuantidadeEstoque">Quantidade em Estoque (valor inteiro):</label>
            <input type="number" id="QuantidadeEstoque" name="QuantidadeEstoque" min="0" step="1" required>

            <label for="ImagemProduto">Imagens:</label>
            <input type="file" id="ImagemProduto" name="ImagemProduto" accept="image/*" multiple required>

            <label for="defaultImage">Imagem de Capa:</label>
            <select id="defaultImage" name="defaultImage" required>
                <option value="" disabled selected>Selecione uma imagem de capa</option>
            </select>

                <input type="submit" value="Salvar">
                <a href="listarproduto.jsp" class="botao">Cancelar</a>
        </form>
    </div>

    <script>
        // Selecione o elemento <select> e o elemento <input> de imagens
        const selectElement = document.getElementById("defaultImage");
        const inputElement = document.getElementById("ImagemProduto");

        // Adicione um ouvinte de eventos para detectar quando as imagens são carregadas
        inputElement.addEventListener("change", () => {
            // Limpe todas as opções existentes no elemento <select>
            selectElement.innerHTML = "";

            // Adicione uma opção padrão
            const defaultOption = document.createElement("option");
            defaultOption.value = "";
            defaultOption.textContent = "Selecione uma imagem de capa";
            defaultOption.disabled = true;
            defaultOption.selected = true;
            selectElement.appendChild(defaultOption);

            // Adicione uma opção para cada imagem carregada
            for (let i = 0; i < inputElement.files.length; i++) {
                const imageFile = inputElement.files[i];
                const option = document.createElement("option");
                option.value = imageFile.name;
                option.textContent = imageFile.name;
                selectElement.appendChild(option);
            }
        });
    </script>

</body>

</html>