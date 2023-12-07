package br.com.lojaesporte2.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/LimparCarrinho")
public class LimparCarrinhoServlet  extends HttpServlet{
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Limpa o carrinho na sessão
        request.getSession().removeAttribute("carrinho");

        // Redireciona de volta para a página do carrinho
        response.sendRedirect("carrinho.jsp");
    }
}
