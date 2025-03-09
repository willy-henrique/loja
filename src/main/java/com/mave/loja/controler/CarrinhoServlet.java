package com.mave.loja.controler;

import com.mave.loja.dao.ProdutoDAO;
import com.mave.loja.model.CarrinhoItem;
import com.mave.loja.model.Produto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/carrinho")
public class CarrinhoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CarrinhoItem> carrinho = obterCarrinho(session);

        // Calcula o valor total do carrinho
        double total = calcularTotalCarrinho(carrinho);
        request.setAttribute("totalCarrinho", total);

        request.getRequestDispatcher("/WEB-INF/views/carrinho.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CarrinhoItem> carrinho = obterCarrinho(session);

        String acao = request.getParameter("acao");
        String produtoIdParam = request.getParameter("produtoId");
        String quantidadeParam = request.getParameter("quantidade");

        if (produtoIdParam == null || produtoIdParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/carrinho");
            return;
        }

        try {
            int produtoId = Integer.parseInt(produtoIdParam);

            if ("adicionar".equals(acao)) {
                int quantidade = (quantidadeParam != null && !quantidadeParam.isEmpty()) ? Integer.parseInt(quantidadeParam) : 1;
                adicionarProduto(carrinho, produtoId, quantidade);
            } else if ("remover".equals(acao)) {
                removerProduto(carrinho, produtoId);
            } else if ("atualizar".equals(acao)) {
                int quantidade = (quantidadeParam != null && !quantidadeParam.isEmpty()) ? Integer.parseInt(quantidadeParam) : 1;
                atualizarQuantidade(carrinho, produtoId, quantidade);
            }

            session.setAttribute("carrinho", carrinho);
        } catch (NumberFormatException e) {
            System.err.println("Erro: parâmetros inválidos no carrinho - " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/carrinho");
    }

    private List<CarrinhoItem> obterCarrinho(HttpSession session) {
        List<CarrinhoItem> carrinho = (List<CarrinhoItem>) session.getAttribute("carrinho");
        if (carrinho == null) {
            carrinho = new ArrayList<>();
            session.setAttribute("carrinho", carrinho);
        }
        return carrinho;
    }

    private void adicionarProduto(List<CarrinhoItem> carrinho, int produtoId, int quantidade) {
        if (quantidade <= 0) return;

        Produto produto = ProdutoDAO.buscarPorId(produtoId);
        if (produto == null) return;

        for (CarrinhoItem item : carrinho) {
            if (item.getProduto().getId() == produtoId) {
                item.setQuantidade(item.getQuantidade() + quantidade);
                return;
            }
        }

        carrinho.add(new CarrinhoItem(produto, quantidade));
    }

    private void removerProduto(List<CarrinhoItem> carrinho, int produtoId) {
        carrinho.removeIf(item -> item.getProduto().getId() == produtoId);
    }

    private void atualizarQuantidade(List<CarrinhoItem> carrinho, int produtoId, int quantidade) {
        if (quantidade <= 0) {
            removerProduto(carrinho, produtoId);
            return;
        }

        for (CarrinhoItem item : carrinho) {
            if (item.getProduto().getId() == produtoId) {
                item.setQuantidade(quantidade);
                return;
            }
        }
    }

    private double calcularTotalCarrinho(List<CarrinhoItem> carrinho) {
        double total = 0.0;
        for (CarrinhoItem item : carrinho) {
            total += item.getProduto().getPreco() * item.getQuantidade();
        }
        return total;
    }
}