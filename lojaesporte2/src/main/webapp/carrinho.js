const products = document.querySelectorAll('.product-card');
let subtotal = 0;
let shipping = 5.00;

// Função para calcular e exibir os valores dinamicamente
function updateValues() {
    subtotal = 0;
    products.forEach((product) => {
        const quantityElement = product.querySelector('.product-quantity');
        const priceElement = product.querySelector('.price');
        const productQuantity = parseInt(quantityElement.textContent);
        const productPrice = parseFloat(priceElement.textContent);
        subtotal += productQuantity * productPrice;
    });

    const totalElement = document.querySelector('.grand-total');
    const total = subtotal + shipping;

    totalElement.textContent = total.toFixed(2);

    const subtotalElement = document.querySelector('.subtotal');
    subtotalElement.textContent = subtotal.toFixed(2);

    const shippingElement = document.querySelector('.shipping');
    shippingElement.textContent = shipping.toFixed(2);
}

products.forEach((product) => {
    const addButton = product.querySelector('.add');
    const diminuiButton = product.querySelector('.diminui');
    const quantityElement = product.querySelector('.product-quantity');
    const removeButton = product.querySelector('.remove');

    addButton.addEventListener('click', () => {
        let quantity = parseInt(quantityElement.textContent);
        quantity++;
        quantityElement.textContent = quantity;
        updateValues();
    });

    diminuiButton.addEventListener('click', () => {
        let quantity = parseInt(quantityElement.textContent);
        if (quantity > 1) {
            quantity--;
            quantityElement.textContent = quantity;
            updateValues();
        }
    });

    removeButton.addEventListener('click', () => {
        product.diminui();
        updateValues();
    });
});

updateValues();