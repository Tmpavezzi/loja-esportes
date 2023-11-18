<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cadastrocliente.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Função para preencher os campos de endereço
        function preencherEndereco() {
            console.log("Script carregado. Aguardando evento blur no campo CEP.");

            $("#cep").blur(function () {
                console.log("Evento blur acionado no campo CEP.");

                var cep = $(this).val();
                cep = cep.replace('-', '');

                console.log("CEP digitado:", cep);

                if (cep.length === 8) {
                    console.log("Requisição para ViaCEP...");

                    $.get("https://viacep.com.br/ws/" + cep + "/json/", function (data) {
                        console.log("Resposta da API ViaCEP:", data);

                        if (!data.erro) {
                            console.log("Preenchendo campos de endereço...");
                            preencherCamposEndereco(data);
                        } else {
                            console.log('CEP não encontrado.');
                            limparCamposEndereco();
                        }
                    });
                }
            });
        }

        function preencherCamposEndereco(result) {
            console.log("Preenchendo campos com os dados do endereço:", result);
            $("#logradouro").val(result.logradouro);
            $("#numero").val(result.numero);
            $("#complemento").val(result.complemento);
            $("#bairro").val(result.bairro);
            $("#cidade").val(result.localidade);
            $("#uf").val(result.uf);
        }

        function limparCamposEndereco() {
            console.log("Limpando campos de endereço.");
            $("#logradouro, #numero, #complemento, #bairro, #cidade, #uf").val("");
        }

        $(document).ready(function () {
            console.log("Documento pronto. Iniciando script.");
            preencherEndereco();
        });
    </script>
    <title>Adicionar Endereço de Entrega</title>
</head>
<body>
    <form action="/adicionar-endereco-entrega" method="post">
        <h1>Adicionar Endereço de Entrega</h1>
        <p>
            <label for="cep">CEP:</label>
            <input type="text" class="enderecoEntrega" id="cep" name="cep" required>
        </p>
        <p>
            <label for="logradouro">Logradouro:</label>
            <input type="text" class="enderecoEntrega" id="logradouro" name="logradouro" required>
        </p>
        <p>
            <label for="numero">Número:</label>
            <input type="text" class="enderecoEntrega" id="numero" name="numero" required>
        </p>
        <p>
            <label for="complemento">Complemento:</label>
            <input type="text" class="enderecoEntrega" id="complemento" name="complemento">
        </p>
        <p>
            <label for="bairro">Bairro:</label>
            <input type="text" class="enderecoEntrega" id="bairro" name="bairro" required>
        </p>
        <p>
            <label for="cidade">Cidade:</label>
            <input type="text" class="enderecoEntrega" id="cidade" name="cidade" required>
        </p>
        <p>
            <label for="uf">UF:</label>
            <input type="text" class="enderecoEntrega" id="uf" name="uf" required>
        </p>
          <input type="hidden" id="clientId" name="clientId" value="<%= request.getParameter("clientId") %>">
        <input type="submit" value="Adicionar Endereço de Entrega">
    </form>
</body>
</html>
