package br.com.lojaesporte2.servlet;


import br.com.lojaesporte2.dao.listardao;
import br.com.lojaesporte2.model.ImagenProduto;
import br.com.lojaesporte2.model.produto;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;


@WebServlet("/imagem")
public class ImagenPordutoservlet   extends  HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int produtoId = Integer.parseInt(request.getParameter("id"));

        listardao dao = new listardao();
        produto produto = dao.recuperarProdutoPorId(produtoId);


        if (produto != null) {

            request.setAttribute("produto", produto);
            request.setAttribute("nomeProduto", produto.getNome());
            request.setAttribute("avaliacao", produto.getAvaliacao());
            request.setAttribute("preco", produto.getPreco());
            request.setAttribute("descricao", produto.getDescricao());


            request.getRequestDispatcher("descricaoproduto_usuario.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("descricaoproduto_usuario.jsp").forward(request, response);
        }
    }
}
