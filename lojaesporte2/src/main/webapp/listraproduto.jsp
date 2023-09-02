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

<div class="search-container">
    <label for="search">Buscar usuário:</label>
    <input type="text" id="search" name="search" placeholder="Digite o nome do usuário">
</div>

<table>
    <thead>
    <tr>
        <th>Nome</th>
        <th>Email</th>
        <th>Status</th>
        <th>Alterar</th>
        <th>Hab/Des</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>Jonas</td>
        <td>jonas@gmail.com</td>
        <td>Ativo</td>
        <td><a href="cadastrodeusuario.jsp">Alterar</a></td><br>
        <td>Inabilitar</td>

    </tr>
    <tr>
        <td>Bruno</td>
        <td>bruno@gmail.com</td>
        <td>Ativo</td>
        <td><a href="cadastrodeusuario.jsp">Alterar</a></td><br>
        <td>Habilitar</td>

    </tr>
    <tr>
        <td>Tiago</td>
        <td>Tiago@gmail.com</td>
        <td>Ativo</td>
        <td><a href="cadastrodeusuario.jsp">Alterar</a></td><br>
        <td>Inabilitar</td>

    </tr>
    </tbody>
</table>
</body>

</html>
</html>