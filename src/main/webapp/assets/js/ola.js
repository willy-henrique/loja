document.addEventListener("DOMContentLoaded", function () {
    // Efeito de fade-in ao carregar a página
    document.body.classList.add("fade-in");

    // Captura os botões de adicionar ao carrinho
    const buttons = document.querySelectorAll(".produto .btn");

    buttons.forEach(button => {
        button.addEventListener("click", function () {
            const produto = this.parentElement.querySelector("h3").innerText;
            adicionarAoCarrinho(produto);
        });
    });

    // Menu hambúrguer
    const menuToggle = document.querySelector(".menu-toggle");
    const navLinks = document.querySelector(".nav-links");

    menuToggle.addEventListener("click", function () {
        navLinks.classList.toggle("active");
    });

    // Fechar o menu ao clicar fora
    document.addEventListener("click", function (event) {
        if (!navLinks.contains(event.target) && !menuToggle.contains(event.target)) {
            navLinks.classList.remove("active");
        }
    });

    // Carrossel
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let slides = document.querySelectorAll(".slides img");
        for (let i = 0; i < slides.length; i++) {
            slides[i].classList.remove("active");
        }
        slideIndex++;
        if (slideIndex > slides.length) { slideIndex = 1 }
        slides[slideIndex - 1].classList.add("active");
        setTimeout(showSlides, 5000); // Muda a imagem a cada 5 segundos
    }

    function moveSlide(n) {
        slideIndex += n;
        showSlides();
    }
});

// Função para exibir notificação ao adicionar produto
function adicionarAoCarrinho(produto) {
    let cart = document.createElement("div");
    cart.className = "cart-notification";
    cart.innerHTML = `<p>${produto} adicionado ao carrinho!</p>`;
    document.body.appendChild(cart);

    setTimeout(() => {
        cart.style.opacity = "0";
        setTimeout(() => cart.remove(), 500);
    }, 2000);
}

// Estilos para notificação do carrinho
const style = document.createElement("style");
style.innerHTML = `
    .fade-in {
        opacity: 0;
        animation: fade 1s forwards;
    }
    @keyframes fade {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    .cart-notification {
        position: fixed;
        top: 20px;
        right: 20px;
        background: #2ecc71;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        transition: opacity 0.5s;
    }
`;
document.head.appendChild(style);