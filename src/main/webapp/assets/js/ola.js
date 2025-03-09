document.addEventListener("DOMContentLoaded", function () {
    const buttons = document.querySelectorAll(".produto .btn");

    buttons.forEach(button => {
        button.addEventListener("click", function () {
            alert("Produto adicionado ao carrinho!");
        });
    });
});
