        const productCards = document.querySelectorAll('.product-card');

        productCards.forEach((productCard) => {
            const addButton = productCard.querySelector('.add');
            const removeButton = productCard.querySelector('.remove');
            const deleteButton = productCard.querySelector('.delete');
            const quantityElement = productCard.querySelector('.product-quantity');

            let quantity = parseInt(quantityElement.textContent);

            addButton.addEventListener('click', () => {
                quantity++;
                quantityElement.textContent = quantity;
                updateTotalPrice();
            });

            removeButton.addEventListener('click', () => {
                if (quantity > 0) {
                    quantity--;
                    quantityElement.textContent = quantity;
                    updateTotalPrice();
                }
            });

            deleteButton.addEventListener('click', () => {
                productCard.remove();
                updateTotalPrice();
            });
        });

function updateTotalPrice() {
            const productPrices = document.querySelectorAll('.product-price');
            const productQuantities = document.querySelectorAll('.product-quantity');
            let totalPrice = 0;

            for (let i = 0; i < productPrices.length; i++) {
                const price = parseFloat(productPrices[i].textContent.replace('R$', '').trim());
                const quantity = parseInt(productQuantities[i].textContent);
                totalPrice += price * quantity;
            }

            // Atualize o elemento que mostra o preço total
            const totalPriceElement = document.getElementById('total-price');
            totalPriceElement.textContent = `Total: R$ ${totalPrice.toFixed(2)}`;
        }

        // Chame a função para calcular o preço total inicial
        updateTotalPrice();
