package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.Alteracao;
import br.com.lojaesporte2.dao.cadastradodao;
import br.com.lojaesporte2.model.usuario;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/atualizarUsuario")
public class AtualizarUsusarioservlet  extends HttpServlet{

    protected  void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{

        int usuarioId = Integer.parseInt(request.getParameter("usuarioId"));

        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String senha = request.getParameter("senha");
        String confirmarSenha = request.getParameter("senha");

        if(!senha.equals(confirmarSenha)){
            request.setAttribute("message","Senha não são iguais");
            request.getRequestDispatcher("alterarusuario.jsp").forward(request,response);
            return;
        }


        Alteracao dao = new Alteracao();
        boolean sucesso = dao.atualizarUsuario(nome, cpf, senha, usuarioId);

        if (sucesso) {
            request.getRequestDispatcher("listarusuario.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("alterarusuario.jsp").forward(request, response);
        }
    }



    }

