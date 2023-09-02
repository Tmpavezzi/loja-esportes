package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.logindao;
import br.com.lojaesporte2.model.login;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.mindrot.jbcrypt.BCrypt.gensalt;


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




        boolean isAuthennticard = new logindao().verifyCreddential(email,senha);

        if(isAuthennticard){
            String userType = new logindao().getUserType(email);


            if(userType!=null&&(userType.equals("administrador")||userType.equals("estoque"))){
                    request.getSession().setAttribute("usergroup",userType);
                request.getRequestDispatcher("telaprincipal.jsp").forward(request, response);
            }else{
                request.setAttribute("message", "Acesso restrito aos usuários do backoffice.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("message", "Credenciais inválidas");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }







    }
}
