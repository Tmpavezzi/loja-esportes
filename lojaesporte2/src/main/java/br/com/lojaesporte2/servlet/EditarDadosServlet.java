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
        Object clienteIdObj = request.getSession().getAttribute("clientId");
        int clientId = clienteIdObj != null ? (int) clienteIdObj : 0;

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
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String dataNascimento = request.getParameter("dataNascimento");

        // Valide e processe os dados conforme necessário
        // ...

        // Após validar os dados, atualize o objeto cliente
        cliente cliente = new cliente();
        cliente.setNome_completo(nome);
        cliente.setCpf(cpf);
        cliente.setNascimento(dataNascimento);  // Defina a data de nascimento como uma String

        // Chame o método para atualizar o cliente no banco de dados
        Clientedao clientedao = new Clientedao();
        clientedao.atualizarCliente(cliente);

        // Redirecione para a página de confirmação ou outra ação apropriada
        response.sendRedirect("confirmacao.jsp");
    }
}
