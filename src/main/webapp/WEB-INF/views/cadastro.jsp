<form action="produtos" method="post">
    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" required><br>

    <label for="descricao">Descrição:</label>
    <input type="text" id="descricao" name="descricao" required><br>

    <label for="preco">Preço:</label>
    <input type="number" id="preco" name="preco" step="0.01" min="0" required><br>

    <label for="quantidade">Quantidade:</label>
    <input type="number" id="quantidade" name="quantidade" min="0" required><br>

    <input type="submit" value="Cadastrar">
</form>
