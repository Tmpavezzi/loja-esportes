<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <title>Seja Bem-Vindo</title>
</head>

<body>
    <form action="/create-login" method="post">
        <h1>Fa&ccedil;a seu Login</h1>
        <label for="nome">E-mail:</label>
        <input type="text" id="name" name="nome" required>
        <label for="senha">Senha:</label>
        <input type="senha" id="senha" name="senha" required>
        <input type="submit" value="Entrar">
    </form>
</body>

</html>