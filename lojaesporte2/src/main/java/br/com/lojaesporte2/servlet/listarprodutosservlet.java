package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.listaprodutosdao;
import br.com.lojaesporte2.model.listaprodutos;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import java.util.List;

@WebServlet("/listarprodutos")
public class listarprodutosservlet extends  HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Servlet de lisatgem foi acessada");

        String filtro = request.getParameter("search");

        listaprodutosdao dao = new listaprodutosdao();
        List<listaprodutos> produtos = dao.listarProdutos();

        if (filtro != null && !filtro.isEmpty()) {

            produtos = dao.listarProdutosFiltrados(filtro);
        } else {

            produtos = dao.listarProdutos();
        }

        request.setAttribute("produtos", produtos);
        request.getRequestDispatcher("listarproduto.jsp").forward(request, response);
    }

}
