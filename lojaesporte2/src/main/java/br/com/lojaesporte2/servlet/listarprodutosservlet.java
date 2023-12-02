package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.listardao;
import br.com.lojaesporte2.model.ImagenProduto;
import br.com.lojaesporte2.model.produto;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet("/listarprodutos")
public class listarprodutosservlet extends  HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomeProduto = request.getParameter("nomeProduto");

        listardao dao = new listardao();
        List<produto> produtos = dao.listarProdutoPorNome(nomeProduto);

        request.setAttribute("produtos", produtos);

        request.getRequestDispatcher("listarproduto.jsp").forward(request, response);
    }
}
