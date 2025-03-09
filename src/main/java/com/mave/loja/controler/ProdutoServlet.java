package com.mave.loja.controller;

import com.mave.loja.model.Produto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/produtos")
public class ProdutoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final List<Produto> produtos = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("produtos", produtos);
        request.getRequestDispatcher("/WEB-INF/views/produtos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Pegando os valores do formulário
            String nome = request.getParameter("nome");
            String descricao = request.getParameter("descricao");
            String precoStr = request.getParameter("preco");
            String quantidadeStr = request.getParameter("quantidade");

            // Validações
            if (nome == null || nome.trim().isEmpty() ||
                    descricao == null || descricao.trim().isEmpty() ||
                    precoStr == null || precoStr.trim().isEmpty() ||
                    quantidadeStr == null || quantidadeStr.trim().isEmpty()) {
                throw new IllegalArgumentException("Todos os campos são obrigatórios.");
            }

            double preco = Double.parseDouble(precoStr);
            int quantidade = Integer.parseInt(quantidadeStr);

            if (preco < 0 || quantidade < 0) {
                throw new IllegalArgumentException("Preço e quantidade devem ser valores positivos.");
            }

            // Criando e adicionando o produto
            Produto produto = new Produto(produtos.size() + 1, nome, descricao, preco, quantidade);
            produtos.add(produto);

            // Redirecionamento para evitar reenvio do formulário
            response.sendRedirect(request.getContextPath() + "/produtos");
        } catch (NumberFormatException e) {
            request.setAttribute("erro", "Preço e quantidade devem ser números válidos.");
            request.getRequestDispatcher("/WEB-INF/views/erro.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("erro", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/erro.jsp").forward(request, response);
        }
    }
}
