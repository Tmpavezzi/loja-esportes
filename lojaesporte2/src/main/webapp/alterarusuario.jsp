<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="alterarusuario.css">
    <title>Editar Usuário</title>
</head>

<body>
    <div class="container">
        <h1>Editar Usuário</h1>
        <form action="/atualizar_usuario" method="post">
            <label for="grupo">Grupo:</label>
            <select name="grupo" id="grupo">
                <option value="admin">Admin</option>
                <option value="usuario">Usuário</option>
            </select>

            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>

            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" required>

            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" required>

            <label for="confirmarSenha">Confirmar Senha:</label>
            <input type="password" id="confirmarSenha" name="confirmarSenha" required>

            <input type="submit" value="Salvar">
        </form>
    </div>
</body>

</html>