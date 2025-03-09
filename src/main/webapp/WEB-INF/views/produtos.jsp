<%@ page import="com.mave.loja.model.Produto" %>
<%@ page import="java.util.List" %>
<%
    List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
%>

<h2>Lista de Produtos</h2>

<table border="1">
    <tr><th>Nome</th><th>Descrição</th><th>Preço</th><th>Quantidade</th></tr>
    <% for (Produto p : produtos) { %>
        <tr>
            <td><%= p.getNome() %></td>
            <td><%= p.getDescricao() %></td>
            <td>R$ <%= String.format("%.2f", p.getPreco()) %></td>
            <td><%= p.getQuantidade() %></td>
        </tr>
    <% } %>
</table>

<h2>Cadastrar Produto</h2>
<form action="produtos" method="post">
    Nome: <input type="text" name="nome" required><br>
    Descrição: <input type="text" name="descricao" required><br>
    Preço: <input type="text" name="preco" required><br>
    Quantidade: <input type="number" name="quantidade" required><br>
    <input type="submit" value="Cadastrar">
</form>

<% if (request.getAttribute("erro") != null) { %>
    <p style="color: red;"><%= request.getAttribute("erro") %></p>
<% } %>
