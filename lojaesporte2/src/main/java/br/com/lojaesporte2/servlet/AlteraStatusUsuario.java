package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.Alteracao;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/atualizarProduto")
@MultipartConfig
public class AlteraStatusUsuario extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
            String idProduto = request.getParameter("id");

            if (idProduto == null || idProduto.isEmpty()) {
                response.sendRedirect("produto_nao_encontrado.jsp");
                return;
            }

            int produtoId = Integer.parseInt(idProduto);
            String nome = request.getParameter("nome");
            int quantidade = Integer.parseInt(request.getParameter("Quantidade"));
            double avaliacao = Double.parseDouble(request.getParameter("AvaliacaoProduto"));
            String descricao = request.getParameter("DescricaoProduto");
            double preco = Double.parseDouble(request.getParameter("preco"));



            Part imagemPart = request.getPart("ImagemProduto");
            byte[] imagemBytes = getBytesFromPart(imagemPart);

            Alteracao dao = new Alteracao();
            boolean sucesso = dao.atualizarPordutoComImagem(produtoId, nome, quantidade, avaliacao, descricao, preco, imagemBytes);

            if (sucesso) {
                response.sendRedirect("listarproduto.jsp");
            } else {
                response.sendRedirect("alterarproduto.jsp");
            }
    }
    private byte[] getBytesFromPart(Part part) throws IOException {
        InputStream input = part.getInputStream();
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int length;

        while ((length = input.read(buffer)) != -1) {
            output.write(buffer, 0, length);
        }

        return output.toByteArray();
    }
}
