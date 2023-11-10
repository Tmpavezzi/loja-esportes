<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.com.lojaesporte2.model.cliente" %>
<!DOCTYPE html>
<% String message=(String) request.getAttribute("message"); %>
<% if (message != null) { %>
<div class="error-message">
    <%= message %>
</div>
<% } %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cadastrocliente.css">
    <title>Alterar Dados</title>
</head>
<body>
    <form action="/editar-dados" method="post">
        <h1>Alteração de Dados</h1>
        <% cliente cliente = (cliente) request.getAttribute("cliente"); %>
        <p>
            <label for="nome">Nome Completo:</label>
            <input type="text" class="nome" name="nome" value="<%= cliente.getNome_completo() %>" required pattern="^\w+\s\w+\s*$">
        </p>
        <p>
            <label for="dataNascimento">Data de Nascimento:</label>
            <input type="date" class="dataNascimento" name="dataNascimento" value="<%= cliente.getNascimento() %>" required>
        </p>
        <p>
            <label for="genero">Gênero:</label>
            <select class="genero" name="genero" required>
                <option value="masculino" <%= cliente.getGenero().equals("masculino") ? "selected" : "" %>>Masculino</option>
                <option value="feminino" <%= cliente.getGenero().equals("feminino") ? "selected" : "" %>>Feminino</option>
                <option value="outro" <%= cliente.getGenero().equals("outro") ? "selected" : "" %>>Outro</option>
            </select>
        </p>
        <p>
            <label for="senha">Senha:</label>
            <input type="password" class="senha" name="senha" required>
        </p>
        <input type="submit" value="Atualizar">
    </form>
</body>
</html>
