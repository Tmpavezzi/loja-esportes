package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.listardao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/alteraStatusPorduto")

public class AlteraStatusProduto  extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{


        int produtoId = Integer.parseInt(request.getParameter("id"));
        String novoStatus = request.getParameter("novaStatus");

        String novaSituacao;
        if ("ativo".equals(novoStatus)) {
            novaSituacao = "inativo";
        } else if ("inativo".equals(novoStatus)) {
            novaSituacao="ativo";

        }else{
            novaSituacao = novoStatus;
        }


        listardao dao = new listardao();
        boolean sucesso = dao.atualizarStatusPorduto(produtoId,novaSituacao);

        if(sucesso){
            response.sendRedirect("listarproduto.jsp");
        }else{
            response.sendRedirect("listarproduto.jsp");
        }
    }
}
