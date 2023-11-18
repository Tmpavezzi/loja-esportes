package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.Clientedao;
import br.com.lojaesporte2.model.cliente;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;


@WebServlet("/editar-dados")
public class EditarDadosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int clientId = obterClienteIdDaSessao(request);

        if (clientId > 0) {
            Clientedao clientedao = new Clientedao();
            cliente cliente = clientedao.obterClientePorId(clientId);
            request.setAttribute("cliente", cliente);

            request.getRequestDispatcher("editar-dados.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int clientId = obterClienteIdDaSessao(request);

        if (clientId > 0) {
            String nome = request.getParameter("nome");
            String dataNascimento = request.getParameter("dataNascimento");
            String genero = request.getParameter("genero");

            // Valide e processe os dados conforme necessário
            // ...

            cliente cliente = new cliente();
            cliente.setId(clientId);
            cliente.setNome_completo(nome);
            cliente.setNascimento(dataNascimento);
            cliente.setGenero(genero);

            Clientedao clientedao = new Clientedao();
            clientedao.atualizarCliente(cliente);

            response.sendRedirect("tela_principalcliente.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private int obterClienteIdDaSessao(HttpServletRequest request) {
        Object clienteIdObj = request.getSession().getAttribute("clientId");
        return clienteIdObj != null ? (int) clienteIdObj : 0;
    }
}
