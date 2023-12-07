<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="finalizarcompra.css">
    <title>Finaliza&ccedil;&atilde;o da Compra</title>
</head>
<header>
    <div class="logo">
        <a href="telaprincipal_usuario.jsp">
            <img src="img/logo.png" width="140px" alt="Logo da empresa">
        </a>
    </div>
    <nav>
        <ul>
            <li><a href="telaprincipal_usuario.jsp">Home</a></li>
            <li>
                <form action="/maisprodutosusers" method="get" class="search-form" style="text-decoration: none; color: white; border-radius: 2px; margin-left: 5px; margin-right: 50px; transition-duration: .5s;">
                    <input type="hidden" name="nomeProduto" placeholder="Mais Produtos">
                    <button class="nav mais-produtos-button" type="submit">Mais Produto</button>
                </form>
            </li>
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

<body>
    <div class="checkout-container">
        <h1>Finaliza&ccedil;&atilde;o da Compra:</h1>
        <div class="checkout-form">
            <!-- Se o cliente não estiver logado, redirecionar para a tela de login -->

            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome">

           <label for="email">E-mail:</label>
           <input type="email" id="email" name="email">

               <label for="logradouros">Logradouro:</label>
               <select id="logradouros" name="logradouros">
                   <c:forEach var="logradouro" items="${logradourosOptions}">
                       <option value="${logradouro.value}">${logradouro.text}</option>
                   </c:forEach>
               </select>

            <label for="formaPagamento">Forma de Pagamento:</label>
            <select id="formaPagamento" name="formaPagamento" disabled>
                <option value="#">Selecione a forma de pagamento</option>
                <option value="cartao">Cart&atilde;o de Cr&eacute;dito</option>
                <option value="boleto">Boleto Banc&aacute;rio</option>
            </select>

            <div id="cartaoCampos" style="display: none;">
                <label for="numeroCartao">N&uacute;mero do Cart&atilde;o:</label>
                <input type="text" id="numeroCartao" name="numeroCartao" placeholder="XXXX XXXX XXXX XXXX">

                <label for="codigoVerificador">C&oacute;digo Verificador:</label>
                <input type="text" id="codigoVerificador" name="codigoVerificador" placeholder="CVV">

                <label for="nomeCompleto">Nome Completo no Cart&atilde;o:</label>
                <input type="text" id="nomeCompleto" name="nomeCompleto">

                <label for="dataVencimento">Data de Vencimento:</label>
                <input type="text" id="dataVencimento" name="dataVencimento" placeholder="MM/AA">

                <label for="parcelas">Quantidade de Parcelas:</label>
                <input type="number" id="parcelas" name="parcelas">
            </div>
            <button id="prosseguirCompra">
                <a href="checkout.jsp" style="text-decoration: none; color: inherit;">Finalizar Pedido
            </button>
            <button id="voltarEscolhaPagamento">
                <a href="carrinho.jsp" style="text-decoration: none; color: inherit;">Voltar
            </button>
        </div>
    </div>


  <script>
          function carregarLogradouros() {
              var email = document.getElementById("email").value;

              if (email.trim() !== "") {
                  var xhr = new XMLHttpRequest();
                  xhr.onreadystatechange = function () {
                      if (xhr.readyState == 4) {
                          if (xhr.status == 200) {
                              // Remova este trecho de código relacionado ao preenchimento das opções
                          } else {
                              console.error("Falha na requisição com status:", xhr.status);
                          }
                      }
                  };

                  // Use POST se estiver enviando dados sensíveis; caso contrário, GET é suficiente
                  xhr.open("GET", "/CarregarLogradouroServlet?email=" + encodeURIComponent(email), true);
                  xhr.send();
              } else {
                  alert("Por favor, preencha o campo de e-mail.");
              }
          }

          // Chama a função ao carregar a página ou quando o email é alterado
          document.getElementById("email").addEventListener("input", carregarLogradouros);
          document.addEventListener("DOMContentLoaded", carregarLogradouros);
      </script>
</body>

</html>