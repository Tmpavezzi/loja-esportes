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
            <img src="img/logo.png" width="140px" alt="Logo da empresa">
        </div>
        <h1>Listas de Produtos</h1>
    </header>

    <form action="/listarprodutos" method="post">
            <div class="search">
                <label for="search">Buscar produto:</label>
                <input type="text" id="search" name="search" placeholder="Digite o nome do produto">
                 </div>
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
                            <td>${listaprodutos.id}</td>
                            <td>${listaprodutos.desc}</td>
                            <td>${listaprodutos.quantidade}</td>
                            <td>${listaprodutos.valor}</td>
                            <td>${listaprodutos.statusformatado}</td>
                            <td><a href="cadastrodeproduto.jsp">Alterar</a></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

    <div class="paginacao">
        <button id="prevPage">Anterior</button>
        <button id="nextPage">Próxima</button>
    </div>
</body>

</html>