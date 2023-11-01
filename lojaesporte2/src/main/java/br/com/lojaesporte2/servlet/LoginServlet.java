package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.logindao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;




@WebServlet("/create-login")
public class LoginServlet extends  HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
  request.getRequestDispatcher("index.jsp").forward(request,response);
    }
@Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    String email = request.getParameter("nome");
    String senha = request.getParameter("senha");

    String userType = null;
    boolean userLoggeIn = false;

    if (email.endsWith("@casp.com.br")) {

        if (new logindao().verifyCreddential(email, senha)) {
            userType = new logindao().getUserType(email);
        }
    } else {

        if (new logindao().verifyClienteCredntial(email, senha)) {
            userType = "cliente";
            userLoggeIn=true;
        }
    }
    if(userLoggeIn){
        request.getSession().setAttribute("userLoggedIn",true);
    }

    switch (userType) {
        case "adm":
            request.getSession().setAttribute("usergroup", userType);
            request.getRequestDispatcher("telaprincipa_adml.jsp").forward(request, response);
            break;
        case "estoque":
            request.getSession().setAttribute("usergroup", userType);
            request.getRequestDispatcher("telaprincipal_esto.jsp").forward(request, response);
            break;
        case "cliente":
            request.getSession().setAttribute("usergroup", userType);
            request.getRequestDispatcher("tela_principalcliente.jsp").forward(request, response);
            break;
        default:
            request.setAttribute("message", "Credenciais inválidas");
            request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
}




