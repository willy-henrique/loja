package com.mave.loja.model;

public class CarrinhoItem {
    private Produto produto;
    private int quantidade;

    public CarrinhoItem(Produto produto, int quantidade) {
        this.produto = produto;
        setQuantidade(quantidade); // Usa o setter para validar
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        if (quantidade < 1) {
            throw new IllegalArgumentException("A quantidade deve ser pelo menos 1.");
        }
        this.quantidade = quantidade;
    }

    public double getTotal() {
        return produto.getPreco() * quantidade;
    }
}
