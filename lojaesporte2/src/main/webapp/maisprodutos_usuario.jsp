<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="maisprodutos_usuario.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="img/logo.png" width="140px" alt="Logo da empresa">
        </div>
        <nav>
            <ul>
                <li><a href="telaprincipal_usuario.jsp">Home</a></li>
                <li><a href="maisprodutos_usuario.jsp">Mais Produtos</a></li>
                <li><a href="#">Sobre Nós</a></li>
            </ul>
        </nav>
        <div class="user">
            <a href="index.jsp">Faça Login</a>
            <a href="cadastrodeusuario.jsp">Crie Seu Login</a>
        </div>
        <div class="cart-icon">
            <img src="img/cart-icon.png" alt="Ícone de Carrinho">
        </div>
    </header>
    <main>
        <section class="product-carousel" id="product-list">

        </section>
        <div id="pagination">
            
        </div>
    </main>
    <footer>
        <div class="footer">
            <p>&copy; 2023 GYM C.A.P.S. Todos os direitos reservados.</p>
        </div>
    </footer>
    <script>
    var val = 19.99
        // Suponha que você tenha um array de produtos
        const produtos = [
            { nome: "Produto 1", preco: "R$ " + val, imagem: "img/produto1.jpg", url: "visualizarproduto.jsp" },
            { nome: "Produto 2", preco: "R$ " + val, imagem: "img/imagem1.jpg"},
            { nome: "Produto 3", preco: "R$ " + val, imagem: "img/imagem2.jpg"},
            { nome: "Produto 4", preco: "R$ " + val, imagem: "img/fitness.png"},
            { nome: "Produto 5", preco: "R$ " + val, imagem: "img/imagem3.jpg"},
            { nome: "Produto 6", preco: "R$ " + val, imagem: "img/whey.jpg"},
            { nome: "Produto 7", preco: "R$ " + val, imagem: "img/whey2.png"},
            { nome: "Produto 8", preco: "R$ " + val, imagem: "img/imagem4.png"},
            { nome: "Produto 9", preco: "R$ " + val, imagem: "img/imagem4.png"},
            { nome: "Produto 10", preco: "R$ " + val, imagem: "img/halter.jpg"},
            { nome: "Produto 11", preco: "R$ " + val, imagem: "img/imagem4.png"},
            { nome: "Produto 12", preco: "R$ " + val, imagem: "img/produto1.jpg"},
            { nome: "Produto 1", preco: "R$ " + val , imagem: "img/imagem2.jpg"},
            { nome: "Produto 2", preco: "R$ " + val , imagem: "img/fitness.png"},
            { nome: "Produto 3", preco: "R$ " + val , imagem: "img/imagem3.jpg"},
            { nome: "Produto 4", preco: "R$ " + val, imagem: "img/imagem3.jpg"},
            { nome: "Produto 5", preco: "R$ " + val, imagem: "img/imagem3.jpg"},
            { nome: "Produto 6", preco: "R$ " + val, imagem: "img/produto1.jpg"},
            { nome: "Produto 7", preco: "R$ " + val, imagem: "img/imagem3.jpg"},
            { nome: "Produto 8", preco: "R$ " + val, imagem: "img/produto1.jpg"},
            { nome: "Produto 9", preco: "R$ " + val, imagem: "img/produto1.jpg"},
            { nome: "Produto 10", preco: "R$ " + val, imagem: "img/fitness.png"},
            { nome: "Produto 11", preco: "R$ " + val, imagem: "img/produto1.jpg"},
            { nome: "Produto 12", preco: "R$ " + val, imagem: "img/fitness.png"},
            { nome: "Produto 1", preco: "R$ " + val, imagem: "img/produto1.jpg" },
            { nome: "Produto 2", preco: "R$ " + val, imagem: "img/imagem3.jpg" },
            { nome: "Produto 3", preco: "R$ " + val, imagem: "img/imagem4.png" },
            { nome: "Produto 4", preco: "R$ " + val, imagem: "img/imagem4.png" },
            { nome: "Produto 5", preco: "R$ " + val, imagem: "img/whey.jpg" },
            { nome: "Produto 6", preco: "R$ " + val, imagem: "img/fitness.png" },
            { nome: "Produto 7", preco: "R$ " + val, imagem: "img/produto1.jpg" },
            { nome: "Produto 8", preco: "R$ " + val, imagem: "img/imagem3.jpg" },
            // Adicione mais produtos aqui
        ];

        // Função para exibir produtos em uma página específica
        function exibirProdutos(pageNumber, pageSize) {
            const productList = document.getElementById("product-list");
            productList.innerHTML = ""; // Limpa a lista de produtos

            const startIndex = (pageNumber - 1) * pageSize;
            const endIndex = startIndex + pageSize;

            for (let i = startIndex; i < endIndex && i < produtos.length; i++) {
                const product = produtos[i];
                const productSection = document.createElement("section");
                const nomeProduto = document.createElement("h2");
                const precoProduto = document.createElement("p");
                const imagemProduto = document.createElement("img");
                const linkProduto = document.createElement("a");

                linkProduto.href = product.url;
                nomeProduto.textContent = product.nome;
                precoProduto.textContent = product.preco;
                imagemProduto.src = product.imagem;

                imagemProduto.style.width = "150px";
                imagemProduto.style.height = "150px";


                productSection.appendChild(imagemProduto);
                productSection.appendChild(nomeProduto);
                productSection.appendChild(precoProduto);
                productSection.appendChild(linkProduto);
                productList.appendChild(productSection);

            }
        }

        // Chamada inicial para exibir a primeira página com 5 produtos
        exibirProdutos(1, 20);

        // Função para criar links de paginação
        function criarLinksDePaginacao(totalProdutos, pageSize) {
            const pagination = document.getElementById("pagination");
            pagination.innerHTML = "";

            const totalPages = Math.ceil(totalProdutos / pageSize);

            for (let i = 1; i <= totalPages; i++) {
                const pageLink = document.createElement("a");
                pageLink.href = "#";
                pageLink.textContent = i;
                pageLink.addEventListener("click", () => {
                    exibirProdutos(i, pageSize);
                });
                pagination.appendChild(pageLink);
            }
        }

        // Chamada inicial para criar links de paginação
        criarLinksDePaginacao(produtos.length, 20);
    </script>
</body>
</html>