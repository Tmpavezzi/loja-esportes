document.addEventListener("DOMContentLoaded", function () {
    const productCards = document.querySelectorAll('.product-card');
    const subtotalElement = document.querySelector('.subtotal');
    const shippingElement = document.querySelector('.shipping');
    const grandTotalElement = document.querySelector('.grand-total');

    productCards.forEach((productCard) => {
        const addButton = productCard.querySelector('.add');
        const removeButton = productCard.querySelector('.remove');
        const deleteButton = productCard.querySelector('.delete');
        const quantityElement = productCard.querySelector('.product-quantity');
        const priceElement = productCard.querySelector('.price');

        addButton.addEventListener('click', () => {
            updateQuantity(quantityElement, 1);
        });

        removeButton.addEventListener('click', () => {
            updateQuantity(quantityElement, -1);
        });

        deleteButton.addEventListener('click', () => {
            productCard.remove();
            updateTotals();
        });
    });

    function updateQuantity(quantityElement, change) {
        let quantity = parseInt(quantityElement.textContent);

        if (quantity + change >= 0) {
            quantity += change;
            quantityElement.textContent = quantity;
            updateTotals();
        }
    }

    function updateTotals() {
        let subtotal = 0;
        let total = 0;
        const frete = 5.00;

        productCards.forEach((productCard) => {
            const quantity = parseInt(productCard.querySelector('.product-quantity').textContent);
            const price = parseFloat(productCard.querySelector('.price').textContent);
            subtotal += quantity * price;
        });

        total = subtotal + frete;

        // Atualiza os elementos HTML com os novos valores
        subtotalElement.innerText = subtotal.toFixed(2);
        shippingElement.innerText = frete.toFixed(2);
        grandTotalElement.innerText = total.toFixed(2);
    }
});
