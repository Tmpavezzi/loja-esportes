function desabilitarCamposEndereco() {
    const camposEndereco = document.querySelectorAll('.senha, .nome, .cpf, .dataNascimento, .genero, .email, .cep, .enderecoFaturamento');
    camposEndereco.forEach(function (campo) {
        campo.disabled = true;
    });
}
function habilitarCamposEnderecoEntrega() {
    const camposEnderecoEntrega = document.querySelectorAll('.enderecoEntrega');
    camposEnderecoEntrega.forEach(function (campo) {
        campo.disabled = false;
    });
}

document.addEventListener('DOMContentLoaded', function () {
    desabilitarCamposEndereco();

    const editAddressLink = document.getElementById('edit-address-link');
    const addAddressLink = document.getElementById('add-address-link');

    editAddressLink.addEventListener('click', function () {
        desabilitarCamposEndereco();
        habilitarCamposEnderecoEntrega();
    });

    addAddressLink.addEventListener('click', function () {
        desabilitarCamposEndereco();
        habilitarCamposEnderecoEntrega();
    });

});
