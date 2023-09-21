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
        // Suponha que você tenha um array de produtos
        const produtos = [
            { nome: "Produto 1", preco: 19.99 },
            { nome: "Produto 2", preco: 29.99 },
            { nome: "Produto 3", preco: 39.99 },
            { nome: "Produto 4", preco: 49.99 },
            { nome: "Produto 5", preco: 59.99 },
            { nome: "Produto 6", preco: 69.99 },
            { nome: "Produto 7", preco: 79.99 },
            { nome: "Produto 8", preco: 89.99 },
            { nome: "Produto 9", preco: 99.99 },
            { nome: "Produto 10", preco: 109.99 },
            { nome: "Produto 11", preco: 119.99 },
            { nome: "Produto 12", preco: 129.99 },
            { nome: "Produto 1", preco: 19.99 },
            { nome: "Produto 2", preco: 29.99 },
            { nome: "Produto 3", preco: 39.99 },
            { nome: "Produto 4", preco: 49.99 },
            { nome: "Produto 5", preco: 59.99 },
            { nome: "Produto 6", preco: 69.99 },
            { nome: "Produto 7", preco: 79.99 },
            { nome: "Produto 8", preco: 89.99 },
            { nome: "Produto 9", preco: 99.99 },
            { nome: "Produto 10", preco: 109.99 },
            { nome: "Produto 11", preco: 119.99 },
            { nome: "Produto 12", preco: 129.99 },
            { nome: "Produto 1", preco: 19.99 },
            { nome: "Produto 2", preco: 29.99 },
            { nome: "Produto 3", preco: 39.99 },
            { nome: "Produto 4", preco: 49.99 },
            { nome: "Produto 5", preco: 59.99 },
            { nome: "Produto 6", preco: 69.99 },
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
                const productElement = document.createElement("div");
                productElement.className = "product";
                productElement.innerHTML = `<h3>${product.nome}</h3><p>Preço: R$ ${product.preco.toFixed(2)}</p>`;
                productList.appendChild(productElement);
            }
        }

        // Chamada inicial para exibir a primeira página com 5 produtos
        exibirProdutos(1, 30);

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
        criarLinksDePaginacao(produtos.length, 30);
    </script>
</body>
</html>
