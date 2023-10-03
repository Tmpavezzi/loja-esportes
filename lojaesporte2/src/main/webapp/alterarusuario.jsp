<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="alterarproduto.css">
    <title>Editar Usuário</title>
</head>

<body>
    <div class="container">
        <h1>Editar Usuário</h1>
        <form action="/atualizarUsuario" method="post">
            <input type="hidden" name="usuarioId" value="${param.usuarioId}">


            <label for="grupo">Grupo:</label>
            <select name="grupo" id="grupo">
                            <option value="adm" ${"adm".equals(param.grupo) ? 'selected="selected"' : ''}>Admin</option>
                            <option value="estoque" ${"estoque".equals(param.grupo) ? 'selected="selected"' : ''}>Estoque</option>
                        </select>

            <!-- Campo para o nome do usuário -->
             <label for="nome">Nome:</label>
                        <input type="text" id="nome" name="nome" required value="${param.nome}">

                        <!-- Campo para o CPF do usuário -->
                        <label for="cpf">CPF:</label>
                        <input type="text" id="cpf" name="cpf" required value="${param.cpf}">

                        <!-- Campo para a senha do usuário -->
                        <label for="senha">Senha:</label>
                        <input type="password" id="senha" name="senha" required value="${param.senha}">

                        <!-- Campo para confirmar a senha -->
                        <label for="confirmarSenha">Confirmar Senha:</label>
                        <input type="password" id="confirmarSenha" name="confirmarSenha" required value="${param.senha}">

                        <!-- Exibir mensagens de erro, se houver -->
                        <% if (request.getAttribute("message") != null) { %>
                            <p class="error-message"><%= request.getAttribute("message") %></p>
                        <% } %>

                        <!-- Botão de envio do formulário -->
                        <input type="submit" value="Salvar">
                    </form>
                </div>
            </body>

            </html>
