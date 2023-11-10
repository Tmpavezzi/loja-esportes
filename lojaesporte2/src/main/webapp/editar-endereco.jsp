<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.com.lojaesporte2.model.enderecoentrega" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cadastrocliente.css">
    <title>Editar Endereço de Entrega</title>
</head>
<body>
    <form action="/editar-endereco-entrega" method="post">
        <h1>Editar Seu Endereço de Entrega</h1>
        <c:set var="endereco" value="${requestScope.endereco}" />
        <p>
            <label for="cep">CEP:</label>
            <input type="text" class="enderecoEntrega" name="cep" value="${endereco.cep}" required >
        </p>
        <p>
            <label for="logradouro">Logradouro:</label>
            <input type="text" class="enderecoEntrega" name="logradouro" value="${endereco.logradouto}" required>
        </p>
        <p>
            <label for="numero">Número:</label>
            <input type="text" class="enderecoEntrega" name="numero" value="${endereco.numero}" required>
        </p>
        <p>
            <label for="complemento">Complemento:</label>
            <input type="text" class="enderecoEntrega" name="complemento" value="${endereco.complemento}">
        </p>
        <p>
            <label for="bairro">Bairro:</label>
            <input type="text" class="enderecoEntrega" name="bairro" value="${endereco.bairro}" required>
        </p>
        <p>
            <label for="cidade">Cidade:</label>
            <input type="text" class="enderecoEntrega" name="cidade" value="${endereco.cidade}" required>
        </p>
        <p>
            <label for="uf">UF:</label>
            <input type="text" class="enderecoEntrega" name="uf" value="${endereco.uf}" required>
        </p>
        <input type="submit" value="Salvar Alterações">
    </form>
</body>
</html>
