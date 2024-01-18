document.addEventListener('DOMContentLoaded', function () {
    // Campos obrigatórios
    var nomeInput = document.getElementById('nome');
    var emailInput = document.getElementById('email');
    var enderecoSelect = document.getElementById('endereco');

    // Campo de seleção de forma de pagamento
    var formaPagamentoSelect = document.getElementById('formaPagamento');

    // Campos do cartão de crédito
    var cartaoCampos = document.getElementById('cartaoCampos');
    var numeroCartaoInput = document.getElementById('numeroCartao');
    var codigoVerificadorInput = document.getElementById('codigoVerificador');
    var nomeCompletoInput = document.getElementById('nomeCompleto');
    var dataVencimentoInput = document.getElementById('dataVencimento');
    var parcelasInput = document.getElementById('parcelas');

    // Botão de finalizar pedido
    var prosseguirCompraButton = document.getElementById('prosseguirCompra');

    // Adiciona um ouvinte de evento para verificar os campos obrigatórios
    [nomeInput, emailInput, enderecoSelect].forEach(function (element) {
        element.addEventListener('input', verificarCamposObrigatorios);
    });

    // Adiciona um ouvinte de evento para selecionar/desselecionar os campos do cartão
    formaPagamentoSelect.addEventListener('change', function () {
        if (formaPagamentoSelect.value === 'cartao') {
            exibirCamposCartao();
        } else {
            ocultarCamposCartao();
        }
    });

    // Função para verificar campos obrigatórios
    function verificarCamposObrigatorios() {
        var camposPreenchidos = nomeInput.value !== '' && emailInput.value !== '' && enderecoSelect.value !== '';
        formaPagamentoSelect.disabled = !camposPreenchidos;

        // Ativa ou desativa o botão de finalizar compra com base nos campos preenchidos
        prosseguirCompraButton.disabled = !camposPreenchidos;
    }

    // Função para exibir campos do cartão
    function exibirCamposCartao() {
        cartaoCampos.style.display = 'block';
        [numeroCartaoInput, codigoVerificadorInput, nomeCompletoInput, dataVencimentoInput, parcelasInput].forEach(function (element) {
            element.required = true;
        });
    }

    // Função para ocultar campos do cartão
    function ocultarCamposCartao() {
        cartaoCampos.style.display = 'none';
        [numeroCartaoInput, codigoVerificadorInput, nomeCompletoInput, dataVencimentoInput, parcelasInput].forEach(function (element) {
            element.required = false;
        });
    }
});