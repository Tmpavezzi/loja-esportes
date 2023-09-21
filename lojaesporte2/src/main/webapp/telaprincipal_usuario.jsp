<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="telaprincipal_usuario.css">
    <title>seja Bem-Vindo</title>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const bannerImages = document.querySelectorAll(".banner img");
            let currentImageIndex = 0;

            function showNextImage() {
                bannerImages[currentImageIndex].classList.remove("active");
                currentImageIndex = (currentImageIndex + 1) % bannerImages.length;
                bannerImages[currentImageIndex].classList.add("active");
            }
            setInterval(showNextImage, 3000);
        });
    </script>
</head>

<body>
    <header>
        <div class="logo">
            <img src="img/logo.png" width="140px" alt="Logo da empresa">
        </div>
        <nav>
            <ul>
                <li><a href="telaprincipal_usuario.jsp">Home</a></li>
                <li><a href="telaprodutos.jsp">Mais Produtos</a></li>
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

    <div class="banner">
        <img src="img/imagem1.jpg" alt="Imagem 1" class="active">
        <img src="img/imagem2.jpg" alt="Imagem 2">
        <img src="img/imagem3.jpg" alt="Imagem 3">
        <img src="img/imagem4.png" alt="Imagem 4">
    </div>

    <section class="product-carousel">
        <div class="product-card">
            <img src="img/produto1.jpg" alt="Produto 1">
            <h2>KIT IntegralMédica</h2>
            <h3>02 Wheys Concentrados 907kg + 02 Creatinas 150g + 02 Coqueteleiras</h3>
            <h4>R$ 350,00</h4>
            <a href="#" class="detail-button">Detalhes</a>
        </div>

        <div class="product-card">
            <img src="img/whey.jpg" alt="Produto 2">
            <h2>Whey - MyWhey IntegralMédica</h2>
            <h3>Sabor Baunilha</h3>
            <h4>R$ 135,00</h4>
            <a href="#" class="detail-button">Detalhes</a>
        </div>
    </section>
    <script>$(document).ready(function () {
            $(".product-carousel").slick({
                infinite: true,
                slidesToShow: 3,
                slidesToScroll: 1,
                prevArrow: "<button class='slick-prev'>&#10094;</button>",
                nextArrow: "<button class='slick-next'>&#10095;</button>",
            });
        });
    </script>

    <div class="footer">
        <p>&copy; 2023 GYM C.A.P.S. Todos os direitos reservados.</p>
    </div>

</body>

</html>