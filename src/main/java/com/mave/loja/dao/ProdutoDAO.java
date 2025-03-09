package dao;

import model.CarrinhoItem;
import model.Produto;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProdutoDAO {

    // Lista de produtos simulando um banco de dados
    private static final List<Produto> produtos = Collections.synchronizedList(new ArrayList<>());

    static {
        produtos.add(new Produto(1, "Produto 1", 10.0));
        produtos.add(new Produto(2, "Produto 2", 20.0));
        produtos.add(new Produto(3, "Produto 3", 30.0));
    }

    public static Produto buscarPorId(int id) {
        synchronized (produtos) {
            return produtos.stream()
                    .filter(produto -> produto.getId() == id)
                    .findFirst()
                    .orElse(null);
        }
    }

    public static List<Produto> listarProdutos() {
        synchronized (produtos) {
            return new ArrayList<>(produtos); // Retorna uma cópia para evitar modificações diretas
        }
    }

    public static void adicionarProduto(Produto produto) {
        synchronized (produtos) {
            produtos.add(produto);
        }
    }

    public static boolean removerProduto(List<CarrinhoItem> carrinho, int id) {
        synchronized (produtos) {
            return produtos.removeIf(produto -> produto.getId() == id);
        }
    }

    public static boolean atualizarProduto(Produto produtoAtualizado) {
        synchronized (produtos) {
            for (int i = 0; i < produtos.size(); i++) {
                if (produtos.get(i).getId() == produtoAtualizado.getId()) {
                    produtos.set(i, produtoAtualizado);
                    return true;
                }
            }
        }
        return false;
    }
}
