<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<% String message = (String) request.getAttribute("message"); %>
<% if (message != null) { %>
    <div class="error-message">
        <%= message %>
    </div>
<% } %>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cadastrodeusuario.css">
    <title>Escolha dos módulos</title>
</head>

<body>
    <form action="/cadastrado-usuario" method="post">
        <h1>Cadastrar/Alterar Usuários</h1>
        <p>
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>
        </p>
        <p>
            <label for="cpf">CPF:</label>
            <input type="number" id="CPF" name="CPF" required>
        </p>
        <p>
            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" required>
        </p>
        <p>
            <label for="senha">Senha:</label>
            <input type="password" class="senha" name="senha" required>
        </p>
        <p>
            <label for="senha">Confirmar Senha:</label>
            <input type="password" class="senha" name="senha" required>
        </p>
        <p>
            <label for="grupo">Grupo/Cargo:</label>
            <select name="role">
                <option value="">Selecione o Cargo</option>
                <option value="administrativo">Administrativo</option>
                <option value="estoquista">Estoquista</option>
            </select>
        </p>
        <p>
            <label for="status">Status:</label>
            <input type="radio" id="statusAtivar" name="status" value="ATIVO">
            <label for="statusAtivar">Ativar</label>
            <input type="radio" id="statusDesativar" name="status" value="INATIVO">
            <label for="statusDesativar">Desativar</label>
        </p>
        <input type="submit" value="Cadastrar">
    </form>

</body>

</html>