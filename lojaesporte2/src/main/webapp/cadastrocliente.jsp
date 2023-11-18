<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cadastrocliente.css">
    <title>Cadastre-se</title>

      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <script>
             // Função para preencher os campos de endereço
             function preencherEnderecoFaturamento() {
                 $("#cep_faturamento, #cep_entrega").blur(function () {
                     console.log("Blur event triggered");
                     var cep = $(this).val();
                     cep = cep.replace('-', '');

                     // Armazene a referência correta ao objeto this
                     var self = this;

                     // Verifique se o CEP possui 8 dígitos
                     if (cep.length === 8) {
                         // Faça a chamada à API do ViaCEP
                         $.get("https://viacep.com.br/ws/" + cep + "/json/", function (data) {
                             console.log("API response:", data);
                             if (!data.erro) {
                                 // Determine o prefixo com base no ID
                                 var prefixo = $(self).attr("id") === "cep_faturamento" ? "enderecoFaturamento" : "enderecoEntrega";
                                 // Chame a função para preencher os campos
                                 preencherCamposEndereco(prefixo, data);
                             } else {
                                 alert('CEP não encontrado.');
                             }
                         });
                     }
                 });
             }

             function preencherCamposEndereco(prefixo, result) {
                 console.log("Preenchendo campos de endereço...");
                 console.log("Prefixo:", prefixo);
                 console.log("Resultado:", result);

                 const campos = ['logradouro', 'numero', 'complemento', 'bairro', 'cidade', 'uf'];

                 // Iterar sobre todos os campos do formulário
                 $("form input, form select").each(function () {
                     const campo = $(this).attr("name");
                     // Verificar se o campo pertence ao endereço atual
                     if (campo && campo.startsWith(prefixo)) {
                         // Obter o nome do campo (ex: enderecoFaturamento[0].logradouro)
                         const nomeCampo = campo.split('.').pop();
                         const valorCampo = result[nomeCampo] !== undefined ? result[nomeCampo] : "";
                         console.log(`Preenchendo ${campo} com valor:`, valorCampo);
                         $(this).val(valorCampo);
                     }
                 });
             }

             // Chame a função após o carregamento do documento
             $(document).ready(function () {
                 preencherEnderecoFaturamento();
             });
         </script>
</head>
<body>
    <form action="/cadatradocliente" method="post">
        <h1>Cadastre-se Agora!</h1>
        <p>
            <label for="nome">Nome Completo:</label>
            <input type="text" class="nome" name="nome">
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
            <label for="enderecoFaturamento">CEP Faturamento:</label>
            <input type="text" class="enderecoFaturamento" id="cep_faturamento" name="enderecoFaturamento[0].cep" required>
        </p>
        <p>
            <label for="enderecoFaturamento">Logradouro:</label>
            <input type="text" class="enderecoFaturamento" id="logradouro_faturamento" name="enderecoFaturamento[0].logradouro" required>
        </p>
        <p>
            <label for="enderecoFaturamento">Número:</label>
            <input type="text" class="enderecoFaturamento" id="numero_faturamento" name="enderecoFaturamento[0].numero" required>
        </p>
        <p>
            <label for="enderecoFaturamento">Complemento:</label>
            <input type="text" class="enderecoFaturamento" id="complemento_faturamento" name="enderecoFaturamento[0].complemento">
        </p>
        <p>
            <label for="enderecoFaturamento">Bairro:</label>
            <input type="text" class="enderecoFaturamento" id="bairro_faturamento" name="enderecoFaturamento[0].bairro" required>
        </p>
        <p>
            <label for="enderecoFaturamento">Cidade:</label>
            <input type="text" class="enderecoFaturamento" id="localidade_faturamento" name="enderecoFaturamento[0].localidade" required>
        </p>
        <p>
            <label for="enderecoFaturamento">UF:</label>
            <input type="text" class="enderecoFaturamento" id="uf_faturamento" name="enderecoFaturamento[0].uf" required>
        </p>
        <p>
            <label for="enderecoEntrega">CEP Entrega:</label>
            <input type="text" class="enderecoEntrega" id="cep_entrega" name="enderecoEntrega[1].cep" required pattern="\d{5}-\d{3}">
        </p>
        <p>
            <label for="enderecoEntrega">Logradouro:</label>
            <input type="text" class="enderecoEntrega" name="enderecoEntrega[1].logradouro" required>
        </p>
        <p>
            <label for="enderecoEntrega">Número:</label>
            <input type="text" class="enderecoEntrega" name="enderecoEntrega[1].numero" required>
        </p>
        <p>
            <label for="enderecoEntrega">Complemento:</label>
            <input type="text" class="enderecoEntrega" name="enderecoEntrega[1].complemento">
        </p>
        <p>
            <label for="enderecoEntrega">Bairro:</label>
            <input type="text" class="enderecoEntrega" name="enderecoEntrega[1].bairro" required>
        </p>
        <p>
            <label for="enderecoEntrega">Cidade:</label>
            <input type="text" class="enderecoEntrega" name="enderecoEntrega[1].localidade" required>
        </p>
        <p>
            <label for="enderecoEntrega">UF:</label>
            <input type="text" class="enderecoEntrega" name="enderecoEntrega[1].uf" required>
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
</body>
</html>
