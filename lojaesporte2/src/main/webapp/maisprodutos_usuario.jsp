<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Produtos</title>
    <link rel="stylesheet" href="maisprodutos_usuario.css">
    <style>
            .product-card {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0px 4px 6px rgb(17, 0, 255);
                padding: 20px;
                margin: 55px;
                display: inline-block;
                flex-wrap: wrap;
                justify-content: space-between;
                text-align: center;
                transition: transform 0.2s ease;
                vertical-align: top;
            }
            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 5px 10px 30px 10px rgb(17, 0, 255);
            }

            .product-card img {
                max-width: 150px;
                height: auto;
                margin-bottom: 10px;
            }

            .product-card h2 {
                font-size: 1.5rem;
                margin: 10px 0;
            }

            .product-card p {
                font-size: 1.2rem;
                color: black;
                margin-bottom: 15px;
            }

            .product-card button {
                background-color: #1600db;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 1rem;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .product-card button:hover {
                background-color: rgb(55, 0, 255);
            }

            #pagination {
                 text-align: center;
                 margin-top: 20px;
            }

            #pagination a {
                    display: inline-block;
                    padding: 5px 10px;
                    margin: 0 5px;
                    border: 1px solid #ccc;
                    background-color: black;
                    color: white;
                    text-decoration: none;
                    border-radius: 4px;
                }

                #pagination a:hover {
                    background-color: blue;
                }
                #prev-page-button, #next-page-button {
                    display: inline-block;
                    padding: 5px 10px;
                    margin: 0 5px;
                    background-color: #1600db;
                    color: #fff;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                }

                #prev-page-button:hover, #next-page-button:hover {
                    background-color: rgb(55, 0, 255);
                }
        </style>
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
                <li><a href="#">Acompanhar Pedidos</a></li>
            </ul>
        </nav>
        <div class="user">
            <a href="index.jsp">Fa&ccedil;a Login</a>
            <a href="cadastrocliente.jsp">Crie Seu Login</a>
        </div>
        <div class="cart-icon">
            <img src="img/cart-icon.png" alt="Ícone de Carrinho">
        </div>
    </header>
    <main>
        <section class="product-carousel" id="product-list">

        </section>
        <div id="pagination">
           <button id="prev-page-button">Página Anterior</button>
           <!-- Links de página gerados dinamicamente -->
           <button id="next-page-button">Próxima Página</button>
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
            { nome: "Produto 1", preco: "R$ " + val, imagem: "img/produto1.jpg", url: "descricaoproduto_usuario.jsp" },
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
                const cardContainer = document.createElement("div");
                cardContainer.classList.add("product-card");
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

                const botaoDetalhes = document.createElement("button");
                botaoDetalhes.textContent = "Detalhes";

                botaoDetalhes.addEventListener("click", () => {
                window.location.href = product.url;
                });

                cardContainer.appendChild(imagemProduto);
                cardContainer.appendChild(nomeProduto);
                cardContainer.appendChild(precoProduto);
                cardContainer.appendChild(linkProduto);
                linkProduto.appendChild(botaoDetalhes);
                productSection.appendChild(cardContainer);
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
