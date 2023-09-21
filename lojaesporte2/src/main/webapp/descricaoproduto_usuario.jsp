<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="descricaoproduto_usuario.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
    <title>Detalhes do Produto</title>
</head>

<body>
    <header>
        <div class="logo">
            <img src="img/logo.png" width="140px" alt="Logo da empresa">
        </div>
        <nav>
            <ul>
                <li><a href="telaprincipal_usuario.jsp">Home</a></li>
                <li><a href="#">Mais Produtos</a></li>
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
    <div class="product-details">
        <div class="carousel-container">
            <div class="carousel">
                <div class="carousel-slide"><img src="img/whey.jpg" alt="Imagem 1"></div>
                <div class="carousel-slide"><img src="img/produto1.jpg" alt="Imagem 2"></div>
            </div>
        </div>
        <div class="product-info">
            <h1>Whey IntegralMédica Sabor Baunilha</h1>
            <p>Para substituir proteínas, de uma forma mais saborosa.</p>
            <p><strong>Preço:</strong> R$ 139,99</p>
            <p><strong>Avaliação:</strong> ★★★★☆</p>
            <button id="comprar-btn" disabled>Comprar</button>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>
        const comprarBtn = document.getElementById('comprar-btn');
        comprarBtn.disabled = true;
        comprarBtn.addEventListener('click', () => {
            alert('Produto adicionado ao carrinho!');
        });
    </script>
    <script>
        $(document).ready(function () {
            $('.carousel').slick({
                autoplay: true,
                autoplaySpeed: 4000,
                dots: true,
                arrows: true
            });
        });
    </script>
    <footer>
        <div class="rodape">
            &copy; 2023 Gym C.A.P.S. Todos os direitos reservados.
        </div>
    </footer>
</body>

</html>