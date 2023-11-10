<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="listarproduto.css">
            <title>Lista de Produtos</title>
        </head>

        <body>
            <header>
                <div class="logo">
                <a href="telaprincipal_usuario.jsp">
                    <img src="img/logo.png" width="140px" alt="Logo da empresa">
                </a>
                </div>
                <h1>Listas de Produtos</h1>
            </header>

            <table>
                <thead>

                <form action="/listarprodutos" method="get" class="search-form">
                        <input type="text" name="nomeProduto" placeholder="Pesquisar por nome...">
                        <button type="submit">Pesquisar</button>
                    </form>
                   <table>
                          <thead>
                              <tr>
                                  <th>Código</th>
                                  <th>Nome do Produto</th>
                                  <th>Quantidade</th>
                                  <th>Valor</th>
                                  <th>Status</th>
                                  <th>Alterar</th>
                                  <th>Visualizar</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:choose>
                                  <c:when test="${empty produtos}">
                                      <tr>
                                          <td colspan="7">Nenhum produto encontrado.</td>
                                      </tr>
                                  </c:when>
                                  <c:otherwise>
                                      <c:forEach var="listaprodutos" items="${produtos}">
                                          <tr>
                                              <td>${listaprodutos.ID}</td>
                                              <td>${listaprodutos.nome}</td>
                                              <td>${listaprodutos.estoque}</td>
                                              <td>${listaprodutos.preco}</td>
                                              <td>${listaprodutos.status}</td>
<<<<<<< HEAD
                                         <%--   <td><img src="data:image/jpeg;base64,${listaprodutos.imagemBase64}" alt="Imagem do Produto"></td> --%>
                                           <td><a href="alterarproduto.jsp" class="button">Alterar</a></td>
                                          <td><a href="imagem?id=${listaprodutos.ID}" class="button">Visualizar</a></td>
=======
                                              <td>
                                             <td>
                                                <form action="/alteraStatusPorduto" method="post" id="formAlterarStatus${listaprodutos.ID}">
                                                    <input type="hidden" name="id" value="${listaprodutos.ID}">
                                                    <input type="hidden" name="novaStatus" value="${listaprodutos.status}">
                                                    <button type="submit" onclick="confirmarAlteracao(${listaprodutos.ID})">Alterar Status</button>
                                                </form>
                                                </td>
                                            </td>
                                      <!--   <td><img src="data:image/jpeg;base64,${listaprodutos.imagemBase64}" alt="Imagem do Produto"></td> -->
                                          <td><a href="alterarproduto.jsp?id=${listaprodutos.ID}&nome=${listaprodutos.nome}&Quantidade=${listaprodutos.estoque}&AvaliacaoProduto=${listaprodutos.avaliacao}&DescricaoProduto=${listaprodutos.descricao}&preco=${listaprodutos.preco}">Alterar</a></td>
                                          <td><a href="imagem?id=${listaprodutos.ID}">Visualizar</a></td>
>>>>>>> 4835e0a4c8cedb6ca39c46a6983045b5125315dc
                                          </tr>
                                      </c:forEach>
                                  </c:otherwise>
                              </c:choose>
                          </tbody>
                      </table>

            <div class="paginacao">
                <button id="prevPage">Anterior</button>
                <button id="nextPage">Próxima</button>
                <a href="cadastrodeproduto.jsp" class="botao">+ Adicionar Produtos</a>
            </div>
            <script>
                function confirmarAlteracao(id) {
                    if (confirm('Deseja realmente alterar o status deste produto?')) {
                          document.getElementById(`formAlterarStatus${id}`).submit();
                    } else {
                    }
                }
            </script>
        </body>

        </html>