<!DOCTYPE html>
<html>

<head>
    <title>Seja Bem-Vindo</title>
    <link rel="stylesheet" type="text/css" href="alterarusuario_adm.css">
</head>

<body>
    <form action="/atualizar_usuario" method="post">
        <h1>Editar Usuario</h1>

        <label for="grupo">Grupo:</label>
        <select name="grupo" id="grupo">
            <option value="">Selecione o Grupo</option>
            <option value="admin">Administrador</option>
            <option value="usuario">Usuario</option>
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
</body>

</html>