<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loja Alijoz - Sua Melhor Escolha</title>

    <!-- Estilos CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/oi.css">

    <!-- JavaScript -->
    <script src="<%= request.getContextPath() %>/assets/js/ola.js" defer></script>

    <!-- Ícones e Fontes -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

    <!-- Navbar -->
    <header class="navbar">
        <div class="logo">Loja Alijoz</div>
        <nav>
            <ul class="nav-links">
                <li><a href="index.jsp">Início</a></li>
                <li><a href="produtos">Produtos</a></li>
                <li><a href="carrinho">Carrinho</a></li> <!-- Corrigido para carrinho.jsp -->
                <li><a href="contato">Contato</a></li>
            </ul>
            <div class="menu-toggle" id="mobile-menu">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>
        </nav>
    </header>

    <!-- Banner com Carrossel -->
    <section class="banner">
        <div class="carousel">
            <div class="slides">
                <img src="<%= request.getContextPath() %>/assets/img/banner1.jpg" alt="Promoção Especial" class="active">
                <img src="<%= request.getContextPath() %>/assets/img/banner2.jpg" alt="Novidades da Semana">
                <img src="<%= request.getContextPath() %>/assets/img/banner3.jpg" alt="Descontos Exclusivos">
            </div>
            <button class="carousel-button prev" onclick="moveSlide(-1)">&#10094;</button>
            <button class="carousel-button next" onclick="moveSlide(1)">&#10095;</button>
        </div>
        <div class="banner-content">
            <div class="banner-text">
                <h1>Bem-vindo à Loja Alijoz</h1>
                <p>Os melhores produtos pelo melhor preço!</p>
                <a href="produtos.jsp" class="btn">Ver Produtos</a> <!-- Link para produtos.jsp -->
            </div>
        </div>
    </section>

    <!-- Produtos em Destaque -->
    <section class="destaques">
        <h2>Produtos em Destaque</h2>
        <div class="produtos-container">
            <div class="produto">
                <img src="<%= request.getContextPath() %>/assets/img/iphone.jpg" alt="iPhone 16">
                <h3>iPhone 16</h3>
                <p>R$ 7.999,00</p>
                <button class="btn" onclick="adicionarAoCarrinho('iPhone 16', 7999)">Adicionar ao Carrinho</button>
            </div>
            <div class="produto">
                <img src="<%= request.getContextPath() %>/assets/img/motorola.jpg" alt="Motorola EDGE">
                <h3>Motorola EDGE</h3>
                <p>R$ 4.899,00</p>
                <button class="btn" onclick="adicionarAoCarrinho('Motorola EDGE', 4899)">Adicionar ao Carrinho</button>
            </div>
            <div class="produto">
                <img src="<%= request.getContextPath() %>/assets/img/samsung.jpg" alt="Samsung S25 ULTRA">
                <h3>Samsung S25 ULTRA</h3>
                <p>R$ 7,499</p>
                <button class="btn" onclick="adicionarAoCarrinho('Samsung', 500)">Adicionar ao Carrinho</button>
            </div>
        </div>
    </section>

    <!-- Seção Sobre Nós -->
    <section class="sobre-nos">
        <h2>Sobre a Loja Alijoz</h2>
        <p>Somos um time de quatro empreendedores apaixonados por tecnologia e inovação: <strong>Willy, Vinicius, Rafael e Pedro Henrique</strong>.</p>
        <p>Desde o início, tivemos a visão de criar uma loja online moderna, acessível e confiável, onde a experiência do cliente fosse a prioridade.</p>
        <p>Este projeto foi desenvolvido <strong>do zero</strong>, com dedicação e compromisso. Agradecemos a todos que nos apoiam nessa jornada e esperamos proporcionar a melhor experiência de compra para você!</p>
    </section>

    <!-- Seção de Avaliações -->
    <section class="avaliacoes">
        <h2>O que nossos clientes dizem</h2>
        <div class="feedback">
            <p>"Ótimos preços e entrega super rápida! Recomendo!" - <strong>Maria S.</strong></p>
            <p>"Qualidade excelente, super confiável!" - <strong>João P.</strong></p>
        </div>
    </section>

    <!-- Rodapé -->
    <footer class="footer">
        <p>&copy; 2025 Loja Alijoz. Todos os direitos reservados.</p>
    </footer>

    <script>
        function adicionarAoCarrinho(produto, preco) {
            alert(produto + " adicionado ao carrinho por R$ " + preco);
        }

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
            let slides = document.querySelectorAll(".slides img");
            slideIndex += n;
            if (slideIndex > slides.length) { slideIndex = 1 }
            if (slideIndex < 1) { slideIndex = slides.length }
            for (let i = 0; i < slides.length; i++) {
                slides[i].classList.remove("active");
            }
            slides[slideIndex - 1].classList.add("active");
        }

        // Menu Mobile
        const mobileMenu = document.getElementById('mobile-menu');
        const navLinks = document.querySelector('.nav-links');

        mobileMenu.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
    </script>

</body>
</html>