<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contato - Loja Alijoz</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/oi.css">
</head>
<body>
    <header class="navbar">
        <div class="logo">Loja Alijoz</div>
        <nav>
            <ul class="nav-links">
                <li><a href="index.jsp">Início</a></li>
                <li><a href="produtos">Produtos</a></li>
                <li><a href="carrinho">Carrinho</a></li>
                <li><a href="contato">Contato</a></li>
            </ul>
        </nav>
    </header>

    <section class="contato">
        <h1>Entre em Contato</h1>
        <form action="#" method="post">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="mensagem">Mensagem:</label>
            <textarea id="mensagem" name="mensagem" required></textarea>
            <button type="submit">Enviar</button>
        </form>
    </section>

    <footer class="footer">
        <p>&copy; 2025 Loja Alijoz. Todos os direitos reservados.</p>
    </footer>
</body>
</html>