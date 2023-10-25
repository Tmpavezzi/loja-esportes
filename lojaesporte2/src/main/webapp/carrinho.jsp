<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrinho de Compras</title>
</head>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    margin-left: auto;
    margin-right: auto;
    background: #e9e9e9;
}

.cart-container {
    background-color: black;
    color: white;
    width: 800px;
    margin: 20px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.product-card {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
}

.product-card .product-info {
        display: flex;
        align-items: center;
}

.product-card img {
     max-width: 80px;
     max-height: 80px;
     margin-right: 20px;
}

.product-card .product-name {
    font-weight: bold;
}

.product-card .product-details {
    flex: 1;
}

.product-card .product-actions {
    display: flex;
    align-items: center;
}

.product-card button {
    background-color: rgb(47, 0, 255);
    color: white;
    border: none;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    margin: 0 10px;
    cursor: pointer;
}

.product-card button.delete {
     background-color: red;
     border-radius: 50%;
     width: 30px;
     height: 30px;
     border: none;
     display: flex;
     justify-content: center;
     align-items: center;
}

.product-card button.delete img {
    max-width: 25px;
    max-height: 25px;
    margin: 0 5px;
}

.product-card .product-quantity {
     font-weight: bold;
     font-size: 20px;
}
header {
    background-color: black;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    margin: 0;
}

.logo img {
    width: 100px;
    height: auto;
}

h1 {
    margin: 0;
    margin-left: auto;
    margin-right: auto;
    color: white;
}

h4 {
    font-size: 25px;
}

nav ul {
    list-style-type: none;
    display: flex;
}

nav ul li {
    margin-right: 30px;
}

nav ul li a {
    text-decoration: none;
    color: white;
    border-radius: 2px;
    margin-left: 5px;
    margin-right: 50px;
    transition-duration: .5s;
}

nav ul li a:hover {
    background-color: #e9e9e9;
    color: black;
}

.user a:hover {
    background-color: #e9e9e9;
    color: black;
}

.user a {
    transition-duration: .5s;
    margin-right: 15px;
    margin-left: 20px;
    text-decoration: none;
    color: white;
}
.content {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
}

.user-dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-options {
    display: none;
    position: absolute;
    background-color: black;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.8);
    z-index: 1;
}

.dropdown-options li {
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    color: white;
}

.dropdown-options li:hover {
    background-color: black;
}

.cart-icon img {
    width: 40px;
    height: 40px;
    cursor: pointer;
}

</style>

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
        <div class="user-dropdown">
            <img src="img/usuario.png" width="30px" height="30px" alt="Ícone do Usuário" id="user-icon">
            <ul class="dropdown-options">
                <li><a href="#" style="color: white;">Ver Perfil</a></li>
                <li><a href="cadastrocliente.jsp" id="edit-data-link" style="color: white;">Editar Perfil</a></li>
                    <ul class="sub-options" id="edit-data-options" style="display: none;">
                    <li><a href="editar-endereco.jsp" id="edit-address-link" style="color: white;">Editar Endere&ccedil;o de Entrega</a></li>
                    <li><a href="editar-dados.jsp" id="edit-data-link" style="color: white;">Alterar Dados</a></li>
                    <li><a href="editar-endereco.jsp" id="add-address-link" style="color: white;">Adicionar Endere&ccedil;o de Entrega</a></li>
                    </ul>
                </li>
                <li><a href="#" style="color: red;">Deslogar</a></li>
            </ul>
        </div>
        <div class="cart-icon">
                <a href="carrinho.jsp">
            <img src="img/cart-icon.png" alt="Ícone de Carrinho">
                </a>
        </div>
    </header>
    <div class="cart-container">
        <h2>Seu Carrinho</h2>
        <div class="product-card">
            <div class="product-info">
                <img src="/img/whey.jpg" alt="Produto 1">
                <div class="product-details">
                    <div class="product-name">Produto 1</div>
                    <div class="product-price">R$ 19.99</div>
                </div>
            </div>
            <div class="product-actions">
                <button class="remove">-</button>
                <div class="product-quantity">1</div>
                <button class="add">+</button>
                <button class="delete">
                    <img src="/img/lixeira.png" alt="Remover Produto">
                </button>
            </div>
        </div>
        <div class="product-card">
            <div class="product-info">
                <img src="/img/whey.jpg" alt="Produto 2">
                <div class="product-details">
                    <div class="product-name">Produto 2</div>
                    <div class="product-price">R$ 29.99</div>
                </div>
            </div>
            <div class="product-actions">
                <button class="remove">-</button>
                <div class="product-quantity">2</div>
                <button class="add">+</button>
                <button class="delete">
                    <img src="/img/lixeira.png" alt="Remover Produto">
                </button>
            </div>
        </div>
    </div>
    <script src="carrinho.js"></script>
</body>

</html>
