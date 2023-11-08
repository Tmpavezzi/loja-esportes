    document.getElementById("prosseguirCompra").addEventListener("click", function (e) {
        e.preventDefault(); // Impede o envio do formulário por padrão

        var enderecoSelecionado = document.getElementById("endereco").value;
        var formaPagamentoSelecionada = document.getElementById("formaPagamento").value;

        if (enderecoSelecionado === "" || formaPagamentoSelecionada === "") {
            alert("Preencha todos os campos em branco.");
        } else if ((formaPagamentoSelecionada === "cartao" || formaPagamentoSelecionada === "debito") && !validateCreditCardFields()) {
            alert("Preencha os campos do cartão de crédito/débito corretamente.");
        } else {
            // Se todos os campos estiverem preenchidos corretamente, redirecione para a página de checkout
            window.location.href = "checkout.jsp";
        }
    });

    // Função para validar os campos do cartão de crédito/débito
    function validateCreditCardFields() {
        var numeroCartao = document.getElementById("numeroCartao").value;
        var codigoVerificador = document.getElementById("codigoVerificador").value;
        var nomeCompleto = document.getElementById("nomeCompleto").value;
        var dataVencimento = document.getElementById("dataVencimento").value;
        var parcelas = document.getElementById("parcelas").value;

        // Adicione aqui a lógica de validação dos campos do cartão
        // Retorna true se os campos estiverem corretos e false caso contrário
        // Por exemplo:
        if (numeroCartao === "" || codigoVerificador === "" || nomeCompleto === "" || dataVencimento === "" || parcelas === "") {
            return false;
        }

        return true;
    }

    // Adicione um ouvinte de eventos para verificar os campos ao alterar qualquer campo do formulário
    var formInputs = document.querySelectorAll("input, select");
    formInputs.forEach(function (input) {
        input.addEventListener("input", function () {
            validateFormFields();
        });
    });

    // Função para validar e habilitar/desabilitar o botão "Finalizar Pedido"
    function validateFormFields() {
        var enderecoSelecionado = document.getElementById("endereco").value;
        var formaPagamentoSelecionada = document.getElementById("formaPagamento").value;

        var button = document.getElementById("prosseguirCompra");

        if (enderecoSelecionado !== "" && formaPagamentoSelecionada !== "") {
            if (
                (formaPagamentoSelecionada === "cartao" || formaPagamentoSelecionada === "debito") &&
                !validateCreditCardFields()
            ) {
                button.disabled = true;
            } else {
                button.disabled = false;
            }
        } else {
            button.disabled = true;
        }
    }

    // Verifique os campos de formulário quando a página for carregada
    validateFormFields();