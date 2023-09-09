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
        <th>ID</th>
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
      <tr>
        <td>1</td>
        <td>Jonas</td>
        <td>123.456.789-00</td>
        <td>jonas@gmail.com</td>
        <td>adm</td>
        <td>Ativo</td>
        <td><a href="cadastrodeusuario.jsp">Alterar</a></td><br>
        <td>Inabilitar</td>

      </tr>
      <tr>
      <td>2</td>
        <td>Bruno</td>
        <td>987.654.321-00</td>
        <td>bruno@gmail.com</td>
        <td>estoque</td>
        <td>Ativo</td>
        <td><a href="cadastrodeusuario.jsp">Alterar</a></td><br>
        <td>Habilitar</td>

      </tr>
      <tr>
        <td>3</td>
        <td>Tiago</td>
        <td>654.551.321-00</td>
        <td>Tiago@gmail.com</td>
        <td>estoque</td>
        <td>Ativo</td>
        <td><a href="cadastrodeusuario.jsp">Alterar</a></td><br>
        <td>Inabilitar</td>

      </tr>
    </tbody>
  </table>
</body>

</html>