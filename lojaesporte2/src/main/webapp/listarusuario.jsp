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
       <header>
            <div class="logo">
                <img src="img/logo.png" width="140px" alt="Logo da empresa">
            </div>
               <h1>Listas de Usuários</h1>
       </header>
     <% String mensagem = request.getParameter("mensagem"); %>
        <% if (mensagem != null && !mensagem.isEmpty()) { %>
            <div class="mensagem">
                <%= mensagem %>
            </div>
        <% } %>

    <form action="/listar" method="post">
        <div class="search-container">
            <label for="search">Buscar usu&aacute;rio:</label>
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
                        <td colspan="7">Nenhum usu&aacute;rio encontrado.</td>
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
                            <td><a href="alterarusuario.jsp?usuarioId=${usuario.id}&nome=${usuario.nome}&cpf=${usuario.cpf}&email=${usuario.email}&grupo=${usuario.grupo}&situacao=${usuario.situacao}">Alterar</a></td>
                            <td>
                            <form action="/Alteracaostatus" method="post">
                            <input type="hidden" name="usuarioID" value="${usuario.id}">
                                <input type="hidden" name="novaSituacao" value="${usuario.situacao}">
                                <button type="submit" name="usuariocpf" value="${usuario.cpf}" onclick="return confirm('Deseja realmente alterar o status deste usuário?')">Hab/Des</button>
                            </form>
                              </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</body>

</html>
