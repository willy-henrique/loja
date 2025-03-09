<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrinho - Loja Alijoz</title>
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

    <section class="carrinho">
        <h1>Seu Carrinho</h1>
        <c:if test="${empty carrinho}">
            <p>Seu carrinho está vazio.</p>
        </c:if>
        <c:if test="${not empty carrinho}">
            <table>
                <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Quantidade</th>
                        <th>Preço Unitário</th>
                        <th>Subtotal</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${carrinho}">
                        <tr>
                            <td>${item.produto.nome}</td>
                            <td>
                                <form action="carrinho" method="post" style="display:inline;">
                                    <input type="hidden" name="acao" value="atualizar">
                                    <input type="hidden" name="produtoId" value="${item.produto.id}">
                                    <input type="number" name="quantidade" value="${item.quantidade}" min="1">
                                    <button type="submit">Atualizar</button>
                                </form>
                            </td>
                            <td>R$ ${item.produto.preco}</td>
                            <td>R$ ${item.produto.preco * item.quantidade}</td>
                            <td>
                                <form action="carrinho" method="post" style="display:inline;">
                                    <input type="hidden" name="acao" value="remover">
                                    <input type="hidden" name="produtoId" value="${item.produto.id}">
                                    <button type="submit">Remover</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p><strong>Total do Carrinho: R$ ${totalCarrinho}</strong></p>
        </c:if>
    </section>

    <footer class="footer">
        <p>&copy; 2025 Loja Alijoz. Todos os direitos reservados.</p>
    </footer>
</body>
</html>