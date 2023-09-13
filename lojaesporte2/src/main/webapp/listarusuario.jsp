<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="listarusuario.css">
    <title>Lista de Usuários</title>
</head>

<body>
    <h1>Lista de Usuários</h1>

    <form action="/listar" method="post">
        <div class="search-container">
            <label for="search">Buscar usuário:</label>
            <input type="text" id="search" name="search" placeholder="Digite o nome do usuário">
             </div>
    </form>
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>CPF</th>
                <th>Email</th>
                <th>Grupo</th>
                <th>Status</th>
                <th>Alterar</th>
                <th>Hab/Des</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${empty usuarios}">
                    <tr>
                        <td colspan="7">Nenhum usuário encontrado.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="usuario" items="${usuarios}">
                        <tr>
                            <td>${usuario.nome}</td>
                            <td>${usuario.cpf}</td>
                            <td>${usuario.email}</td>
                            <td>${usuario.grupo}</td>
                            <td>${usuario.situacao}</td>
                            <td><a href="alterar.jsp" class="button">Alterar</a></td>
                            <td><a href="#" class="button">Inabilitar</a></td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</body>

</html>
