<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <title>Seja Bem-Vindo</title>
</head>
<style>
.register {
    text-align: center;
}
.register p {
    color: white;
    margin-top: 10px;
    display: inline-block;
    font-size: 15px;
}
.register a {
    color: blue;
    text-decoration: none;
    display: inline-block;
    vertical-align: middle;
    text-decoration: underline;
}
</style>

<body>
    <form action="/create-login" method="post">
        <h1>Fa&ccedil;a seu Login</h1>
        <label for="nome">E-mail:</label>
        <input type="text" id="name" name="nome" required>
        <label for="senha">Senha:</label>
        <input type="senha" id="senha" name="senha" required>
        <input type="submit" value="Entrar">
    <div class="register">
         <p> Não possui uma conta? <a href="cadastrocliente.jsp">Fazer Cadastro</a></p>
    </div>
    </form>
</body>

</html>