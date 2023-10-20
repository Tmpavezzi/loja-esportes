package br.com.lojaesporte2.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/Logout")
public class Logoutservlet extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
  request.getSession().invalidate();
   request.setAttribute("messagen","Sucessor on logout");
  request.getRequestDispatcher("index.jsp".formatted(request,response));
}
}
