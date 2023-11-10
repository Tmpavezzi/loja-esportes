<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cadastrocliente.css">
    <title>Adicionar Endereço de Entrega</title>
</head>
<body>
    <form action="/adicionar-endereco-entrega" method="post">
        <h1>Adicionar Endereço de Entrega</h1>
        <p>
            <label for="cep">CEP:</label>
            <input type="text" class="enderecoEntrega" name="cep" required>
        </p>
        <p>
            <label for="logradouro">Logradouro:</label>
            <input type="text" class="enderecoEntrega" name="logradouro" required>
        </p>
        <p>
            <label for="numero">Número:</label>
            <input type="text" class="enderecoEntrega" name="numero" required>
        </p>
        <p>
            <label for="complemento">Complemento:</label>
            <input type="text" class="enderecoEntrega" name="complemento">
        </p>
        <p>
            <label for="bairro">Bairro:</label>
            <input type="text" class="enderecoEntrega" name="bairro" required>
        </p>
        <p>
            <label for="cidade">Cidade:</label>
            <input type="text" class="enderecoEntrega" name="cidade" required>
        </p>
        <p>
            <label for="uf">UF:</label>
            <input type="text" class="enderecoEntrega" name="uf" required>
        </p>
        <input type="submit" value="Adicionar Endereço de Entrega">
    </form>
</body>
</html>
