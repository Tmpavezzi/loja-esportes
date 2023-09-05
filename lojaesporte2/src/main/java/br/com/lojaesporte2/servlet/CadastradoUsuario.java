package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.cadastradodao;
import br.com.lojaesporte2.model.usuario;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/cadatrado-usuario")
public class CadastradoUsuario extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{

         String nome = request.getParameter("nome");
         String cpf = request.getParameter("CPF");
         String email = request.getParameter("email");
         String senha = request.getParameter("senha");
         String confirmasenha= request.getParameter("confirmasenha");
         String grupo = request.getParameter("role");
         String situacao = request.getParameter("status");




         if(!senha.equals(confirmasenha)){
             request.setAttribute("message","Senha não são iguais");
             request.getRequestDispatcher("cadastrodeusuario.jsp");
             return;
         }
         usuario usuario = new usuario();
         usuario.setNome(nome);
         usuario.setCpf(cpf);
         usuario.setEmail(email);
         usuario.setSenha(senha);
         usuario.setGrupo(grupo);
         usuario.setSituacao(situacao);

         cadastradodao dao = new cadastradodao();

         if(dao.verificacpf(cpf)){
             request.setAttribute("message","CPF ja existente");
             request.getRequestDispatcher("cadastrodeusuario.jsp");
         }
         dao.cerateusuario(usuario);




    }
}
