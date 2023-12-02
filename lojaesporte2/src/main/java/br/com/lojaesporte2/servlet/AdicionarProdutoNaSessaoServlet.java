package br.com.lojaesporte2.servlet;



import br.com.lojaesporte2.model.produto;
import com.google.gson.Gson;
import com.google.gson.JsonParseException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/AdicionarProdutoNaSessaoServlet")
public class AdicionarProdutoNaSessaoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            // Recupera a sessão
            HttpSession session = request.getSession(true);

            // Recupera a lista de produtos da sessão (se existir)
            List<produto> produtosNaSessao = (List<produto>) session.getAttribute("produtosNaSessao");

            // Se a lista não existir, cria uma nova
            if (produtosNaSessao == null) {
                produtosNaSessao = new ArrayList<>();
            }

            // Recupera os dados do produto enviado no corpo da solicitação
            Gson gson = new Gson();
            produto produto = gson.fromJson(request.getReader(), produto.class);

            // Adiciona o produto à lista
            produtosNaSessao.add(produto);

            // Atualiza a lista na sessão
            session.setAttribute("produtosNaSessao", produtosNaSessao);

            // Responde ao cliente com uma mensagem JSON de sucesso
            response.setContentType("application/json");
            try (PrintWriter out = response.getWriter()) {
                out.print("{\"message\": \"Produto adicionado à sessão com sucesso!\"}");
            }
        } catch (Exception e) {
            // Loga a exceção para análise posterior
            e.printStackTrace();

            // Define o status da resposta como Erro Interno do Servidor (500)
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

            // Responde ao cliente com uma mensagem JSON de erro
            response.setContentType("application/json");
            try (PrintWriter out = response.getWriter()) {
                out.print("{\"error\": \"Erro interno do servidor\"}");
            }
        }
    }
}