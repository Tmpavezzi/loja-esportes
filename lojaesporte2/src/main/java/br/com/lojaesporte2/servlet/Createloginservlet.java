package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.logindao;
import br.com.lojaesporte2.dao.loginusedao;
import br.com.lojaesporte2.model.login;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-login")
public class Createloginservlet extends  HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
  request.getRequestDispatcher("index.jsp").forward(request,response);
    }
@Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        String email =request.getParameter("nome");
        String senha = request.getParameter("senha");

      login login = new login(email,senha);

        boolean isValiadm = new logindao().verifyCreddential(email,senha);


            boolean isUser = new loginusedao().verifyUser(email,senha);

        if(isValiadm){
            request.getSession().setAttribute("loggeduser",email);
            request.getRequestDispatcher("telaprincipal.jsp").forward(request,response);
        }else if(isUser){
            request.getSession().setAttribute("loggeduser",email);
            request.getRequestDispatcher("produtos.jsp").forward(request,response);
        }else{
            request.setAttribute("message","Invalid credentials");
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }


    }
}
