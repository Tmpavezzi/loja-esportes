package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.Clientedao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CarregarLogradouroServlet")
public class CarregarLogradouroServlet  extends HttpServlet{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupere a sessão
        HttpSession session = request.getSession();

        // Verifique se o cliente está logado
        if (session.getAttribute("userLoggedIn") != null) {
            // Recupere o e-mail do cliente da requisição
            String email = request.getParameter("email");

            Clientedao dao = new Clientedao();

            // Chame o método na DAO para recuperar a lista de logradouros por e-mail
            List<String> logradouros = dao.obterLogradourosEnderecoEntregaPorEmail(email);

            request.setAttribute("logradouros", logradouros);


            // Adicione esta linha para verificar o conteúdo da lista
            System.out.println("Logradouros: " + logradouros);

            // Encaminhe para a página JSP
            request.getRequestDispatcher("finalizarcompra.jsp").forward(request, response);

        } else {
            // Se o cliente não estiver logado, você pode redirecioná-lo para fazer login
            response.sendRedirect("login.jsp");
        }
    }
}
