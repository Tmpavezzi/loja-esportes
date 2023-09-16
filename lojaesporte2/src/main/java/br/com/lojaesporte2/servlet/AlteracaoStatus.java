package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.listardao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Alteracaostatus")
public class AlteracaoStatus  extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cpf = request.getParameter("usuariocpf");
        System.out.println(cpf);
        String situacaoAtual = request.getParameter("novaSituacao");
        System.out.println("Nova Situação: " + situacaoAtual);
        listardao dao = new listardao();


        String novaSituacao;
        if ("ativo".equals(situacaoAtual)) {
            novaSituacao = "inativo";
        } else if ("inativo".equals(situacaoAtual)) {
            novaSituacao="ativo";

        }else{
            novaSituacao = situacaoAtual;
        }




            boolean sucesso = dao.atulizarstatus(cpf, novaSituacao);

            if (sucesso) {
                request.getRequestDispatcher("listarusuario.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("listarusuario.jsp").forward(request, response);
            }
        }
    }

