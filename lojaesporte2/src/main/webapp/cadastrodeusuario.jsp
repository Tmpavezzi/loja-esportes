<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cadastrodeusuario.css">
    <title>Escolha dos módulos</title>
</head>

<body>
    <form action="cadastra-usuario" method="post">

        <h1>Cadastrar/Alterar usuarios</h1>

        <p>
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required>
        </p>
        <p>
        <label for="email">E-mail:</label>
        <input type="email" id="email" name="email" required>
        </p>
        <p>
        <label for="status">Status:</label>
        </p>
        <input type="radio" id="status" name="status" value="activate"> Ativar
        <input type="radio" id="status" name="status" value="deactivate"> Desativar

    </form>

</body>

</html>