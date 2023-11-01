<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>

    <% String message=(String) request.getAttribute("message"); %>
        <% if (message !=null) { %>
            <div class="error-message">
                <%= message %>
            </div>
            <% } %>
                <html lang="pt-br">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link rel="stylesheet" href="cadastrocliente.css">
                    <title>Editar Endereço de Entrega</title>
                </head>

                <body>
                    <form action="/cadastrado-usuario" method="post">
                        <h1>Edite Seu Endereço de Entrega</h1>
                        <p>
                            <label for="nome">Nome Completo:</label>
                            <input type="text" class="nome" name="nome" required pattern="^\w+\s\w+\s*$">
                        </p>
                        <p>
                            <label for="cpf">CPF:</label>
                            <input type="text" class="cpf" name="cpf" required pattern="\d{3}\.\d{3}\.\d{3}-\d{2}">
                        </p>
                        <p>
                            <label for="dataNascimento">Data de Nascimento:</label>
                            <input type="date" class="dataNascimento" name="dataNascimento" required>
                        </p>
                        <p>
                            <label for="genero">Gênero:</label>
                            <select class="genero" name="genero" required>
                                <option value="masculino">Masculino</option>
                                <option value="feminino">Feminino</option>
                                <option value="outro">Outro</option>
                            </select>
                        </p>
                        <p>
                            <label for="email">E-mail:</label>
                            <input type="email" class="email" name="email" required>
                        </p>

                        <p>
                            <label for="enderecoFaturamento">Endereço de Faturamento:</label>
                        <div id="enderecoFaturamentoContainer">
                            <input type="text" class="enderecoFaturamento" name="enderecoFaturamento" required>
                        </div>
                        </p>
                        <p>
                            <label for="enderecoEntrega">Endereço(s) de Entrega:</label>
                        <div id="enderecoEntregaContainer">
                            <input type="text" class="enderecoEntrega" name="enderecoEntrega" required>
                            <button type="button" class="addEnderecoEntrega">Adicionar Mais um Endereço de
                                Entrega</button>
                        </div>
                        </p>
                        <p>
                            <label for="enderecoEntrega">CEP:</label>
                            <input type="text" class="enderecoEntrega" name="enderecoEntrega[0].cep" required
                                pattern="\d{5}-\d{3}">
                        </p>
                        <p>
                            <label for="enderecoEntrega">Logradouro:</label>
                            <input type="text" class="enderecoEntrega" name="enderecoEntrega[0].logradouto" required>
                        </p>
                        <p>
                            <label for="enderecoEntrega">Número:</label>
                            <input type="text" class="enderecoEntrega" name="enderecoEntrega[0].numero" required>
                        </p>
                        <p>
                            <label for="enderecoEntrega">Complemento:</label>
                            <input type="text" class="enderecoEntrega" name="enderecoEntrega[0].complemento">
                        </p>
                        <p>
                            <label for="enderecoEntrega">Bairro:</label>
                            <input type="text" class="enderecoEntrega" name="enderecoEntrega[0].bairro" required>
                        </p>
                        <p>
                            <label for="enderecoEntrega">Cidade:</label>
                            <input type="text" class="enderecoEntrega" name="enderecoEntrega[0].cidade" required>
                        </p>
                        <p>
                            <label for="enderecoEntrega">UF:</label>
                            <input type="text" class="enderecoEntrega" name="enderecoEntrega[0].uf" required>
                        </p>
                        <p>
                            <label for="senha">Senha:</label>
                            <input type="password" class="senha" name="senha" required>
                        </p>
                        <p>
                            <label for="senha">Confirmar Senha:</label>
                            <input type="password" class="senha" name="senha" required>
                        </p>
                        <input type="submit" value="Cadastrar">
                    </form>
                    <script src="editar-endereco.js"></script>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            const enderecoEntregaContainer = document.getElementById('enderecoEntregaContainer');

                            function criarCampoEnderecoEntrega() {
                                const novoCampoEnderecoEntrega = document.createElement('div');
                                novoCampoEnderecoEntrega.innerHTML = `
                    <input type="text" class="enderecoEntrega" name="enderecoEntrega" required></textarea>
                    <button type="button" class="removerEnderecoEntrega">Remover Endereço de Entrega</button>
                `;
                                enderecoEntregaContainer.appendChild(novoCampoEnderecoEntrega);

                                novoCampoEnderecoEntrega.querySelector('.removerEnderecoEntrega').addEventListener('click', function () {
                                    enderecoEntregaContainer.removeChild(novoCampoEnderecoEntrega);
                                });
                            }
                            document.querySelector('.addEnderecoEntrega').addEventListener('click', criarCampoEnderecoEntrega);
                        });
                    </script>
                </body>

                </html>