<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="telaprincipal_usuario.css">
    <title>Seja Bem-Vindo</title>
    <style>
        #carousel-container {
            width: 100%;
            overflow: hidden;
        }

        #carousel {
            width: 100%;
            display: flex;
            transition: all 1s;
        }

        .carousel-item {
            width: 100%;
            display: none;
        }

        .carousel-item img {
            width: 100%;
            height: auto;
        }

        .carousel-controls {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 100%;
            display: flex;
            justify-content: space-between;
        }

        .carousel-controls img {
            cursor: pointer;
        }
    </style>
</head>

<body>
    <header>
        <div class="logo">
        <a href="telaprincipal_usuario.jsp">
            <img src="img/logo.png" width="140px" alt="Logo da empresa">
        </a>
        </div>
        <nav>
            <ul>
                <li><a href="telaprincipal_usuario.jsp">Home</a></li>
                <li><a href="maisprodutos_usuarios.jsp">Mais Produtos</a></li>
                <li><a href="pedidos.jsp">Acompanhar Pedidos</a></li>
            </ul>
        </nav>
        <div class="user">
          <c:choose>
          <c:when test="${empty sessionScope.userLoggedIn}">
            <a href="index.jsp">Fa&ccedil;a Login</a>
            <a href="cadastrocliente.jsp">Crie Seu Login</a>
            </c:when>
                 <c:otherwise>
             </div>
        <div class="user-dropdown">
            <img src="img/usuario.png" width="30px" height="30px" alt="Ícone do Usuário" id="user-icon">
            <ul class="dropdown-options">
                <li><a href="/Logout" style="color: white;">Ver Perfil</a></li>
                <li><a href="cadastrocliente.jsp" id="edit-data-link" style="color: white;">Editar Perfil</a></li>
                <ul class="sub-options" id="edit-data-options" style="display: none;">
                    <li><a href="editar-endereco.jsp" id="edit-address-link" style="color: white;">Editar
                            Endere&ccedil;o de Entrega</a></li>
                    <li><a href="editar-dados.jsp" id="edit-data-link" style="color: white;">Alterar Dados</a></li>
                    <li><a href="editar-endereco.jsp" id="add-address-link" style="color: white;">Adicionar
                            Endere&ccedil;o de Entrega</a></li>
                </ul>
                </li>
                <li><a href="/Logout" style="color: red;">Deslogar</a></li>
            </ul>
                </c:otherwise>
                      </c:choose>
        </div>
        <div class="cart-icon">
            <a href="carrinho.jsp">
                <img src="img/cart-icon.png" alt="Ícone de Carrinho">
            </a>
        </div>
    </header>
    <div id="carousel-container">
        <div id="carousel">
            <div class="carousel-item">
                <img src="/img/imagem1.jpg" alt="Imagem 1">
            </div>
            <div class="carousel-item">
                <img src="/img/imagem2.jpg" alt="Imagem 2">
            </div>
            <div class="carousel-item">
                <img src="/img/imagem3.png" alt="Imagem 3">
            </div>
            <div class="carousel-item">
                <img src="/img/imagem4.jpg" alt="Imagem 4">
            </div>
            <div class="carousel-item">
                <img src="/img/imagem5.jpg" alt="Imagem 5">
            </div>
            <div class="carousel-controls">
                <img id="prev" src="/img/seta-esquerda.png" alt="Anterior">
                <img id="next" src="/img/seta-direita.png" alt="Próximo">
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="editar-endereco.js"></script>
    <script>
        $(document).ready(function () {
            const $carousel = $('#carousel');
            const $carouselContainer = $('#carousel-container');

            let currentIndex = 0;
            const totalItems = $('.carousel-item').length;

            // Exibir o primeiro item
            $('.carousel-item:first').show();

            $('#next').on('click', function () {
                currentIndex = (currentIndex + 1) % totalItems;
                updateCarousel();
            });

            $('#prev').on('click', function () {
                currentIndex = (currentIndex - 1 + totalItems) % totalItems;
                updateCarousel();
            });

            // Função para atualizar o carrossel
            function updateCarousel() {
                $('.carousel-item').hide();
                $('.carousel-item:eq(' + currentIndex + ')').fadeIn(1000);
            }

            // Automatizar a transição de slides a cada 5 segundos
            setInterval(function () {
                $('#next').click();
            }, 5000);
        });
    </script>
    <section class="product-carousel">
        <div class="product-card">
            <img src="img/creatina integralmedica.jpg" alt="Produto 1">
            <h2>Creatina IntegralMedica 300g</h2>
            <h4>R$ 110,00</h4>
            <a href="#" class="detail-button">Detalhes</a>
        </div>

        <div class="product-card">
            <img src="img/pre-treino maxtitanium.jpg" alt="Produto 2">
            <h2>Pre-Treino MaxTitanium 300g</h2>
            <h3>Sabor Limao</h3>
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
    <script src="perfil.js"></script>
    <div class="footer">
        <p>&copy; 2023 GYM C.A.P.S. Todos os direitos reservados.</p>
    </div>
</body>

</html>