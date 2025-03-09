<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Erro</title>
</head>
<body>
    <h2>Erro ao processar a requisição</h2>
    <p style="color: red;"><%= request.getAttribute("erro") %></p>
    <a href="produtos">Voltar</a>
</body>
</html>
