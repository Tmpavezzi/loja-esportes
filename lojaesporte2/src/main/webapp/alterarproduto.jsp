<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Editar Produto</title>
        <link rel="stylesheet" type="text/css" href="alterarproduto.css">
    </head>
    <body>
        <form action="/atualizarProduto" method="post" enctype="multipart/form-data">
            <h1>Editar Produto</h1>

            <input type="hidden" id="id" name="id" style="display: none;">

            <label for="nome">Nome do Produto:</label>
            <input type="text" id="nome" name="nome" required autocomplete="off">

            <label for="Quantidade">Quantidade em Estoque:</label>
            <input type="number" id="Quantidade" name="Quantidade" required>

            <label for="AvaliacaoProduto">Avaliação (de 1 a 5 em incrementos de 0,5):</label>
            <input type="number" id="AvaliacaoProduto" name="AvaliacaoProduto" min="1" max="5" step="0.5" required>

            <label for="DescricaoProduto">Descrição Detalhada (até 2000 caracteres):</label>
            <textarea id="DescricaoProduto" name="DescricaoProduto" rows="5" maxlength="2000" required></textarea>

            <label for="PrecoProduto">Preço do Produto:</label>
            <input type="number" id="preco" name="preco" required>

            <label for="ImagemProduto">Imagens:</label>
            <input type="file" id="ImagemProduto" name="ImagemProduto" accept="image/*" multiple required>

            <label for="defaultImage">Imagem Padrão:</label>
            <select id="defaultImage" name="defaultImage" required>

                <script>
                    const selectElement = document.getElementById("defaultImage");
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

            </select>

            <input type="submit" value="Salvar">
        </form>

        <script>
            var id = '<%= request.getParameter("id") %>';
            var nome = '<%= request.getParameter("nome") %>';
            var quantidade = '<%= request.getParameter("Quantidade") %>';
            var avaliacao = '<%= request.getParameter("AvaliacaoProduto") %>';
            var descricao = '<%= request.getParameter("DescricaoProduto") %>';
            var preco = '<%= request.getParameter("preco") %>';

            document.getElementById("id").value = id;
            document.getElementById("nome").value = nome;
            document.getElementById("Quantidade").value = quantidade;
            document.getElementById("AvaliacaoProduto").value = avaliacao;
            document.getElementById("DescricaoProduto").value = descricao;
            document.getElementById("preco").value = preco;
        </script>


    </body>

    </html>