        document.addEventListener("DOMContentLoaded", function () {
            const userIcon = document.getElementById("user-icon");
            const dropdownOptions = document.querySelector(".dropdown-options");

            userIcon.addEventListener("click", function () {
                if (dropdownOptions.style.display === "block") {
                    dropdownOptions.style.display = "none";
                } else {
                    dropdownOptions.style.display = "block";
                }
            });
        });
        document.addEventListener("DOMContentLoaded", function () {
            const editDataLink = document.getElementById("edit-data-link");
            const editDataOptions = document.getElementById("edit-data-options");

            editDataLink.addEventListener("click", function (e) {
                e.preventDefault(); // Impede que o link seja seguido

                if (editDataOptions.style.display === "block") {
                    editDataOptions.style.display = "none";
                } else {
                    editDataOptions.style.display = "block";
                }
            });
        });