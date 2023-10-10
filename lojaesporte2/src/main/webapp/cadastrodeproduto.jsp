<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <form action="/cadastradoPorduto" method="post" enctype="multipart/form-data">
            <label for="NomeProduto">Nome do Produto (até 200 caracteres):</label>
            <input type="text" id="nome" name="nome" maxlength="200" required>

            <label for="AvaliacaoProduto">Avaliação (de 1 a 5 em incrementos de 0,5):</label>
            <input type="number" id="avaliacao" name="avaliacao" min="1" max="5" step="0.5" required>

            <label for="DescricaoProduto">Descrição Detalhada (até 2000 caracteres):</label>
            <textarea id="descricao" name="descricao" rows="5" maxlength="2000" required></textarea>

            <label for="PrecoProduto">Preço do Produto (2 casas decimais):</label>
            <input type="number" id="preco" name="preco" min="0" step="0.01" required>

            <label for="QuantidadeEstoque">Quantidade em Estoque (valor inteiro):</label>
            <input type="number" id="estoque" name="estoque" min="0" step="1" required>

            <label for="ImagemProduto">Imagens:</label>
            <input type="file" id="ImagemProduto" name="imagens" accept="image/*" multiple required>

            <label for="DefaultImage">Imagem de Capa:</label>
            <select id="DefaultImage" name="defaultImage" required>
                <option value="" disabled selected>Selecione uma imagem de capa</option>
            </select>

            <input type="submit" value="Salvar">
            <a href="listarproduto.jsp" class="botao">Cancelar</a>
        </form>
    </div>

    <script>
        const selectElement = document.getElementById("DefaultImage");
        const inputElement = document.getElementById("ImagemProduto");

        inputElement.addEventListener("change", () => {
            selectElement.innerHTML = "";

            const defaultOption = document.createElement("option");
            defaultOption.value = "";
            defaultOption.textContent = "Selecione uma imagem de capa";
            defaultOption.disabled = true;
            defaultOption.selected = true;
            selectElement.appendChild(defaultOption);

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
