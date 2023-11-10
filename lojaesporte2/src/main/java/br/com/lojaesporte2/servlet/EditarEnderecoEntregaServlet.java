package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.Clientedao;
import br.com.lojaesporte2.model.enderecoentrega;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;

@WebServlet("/editar-endereco-entrega")
public class EditarEnderecoEntregaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object clienteIdObj = request.getSession().getAttribute("clientId");
        int clientId = clienteIdObj != null ? (int) clienteIdObj : 0;

        if (clientId > 0) {
            Clientedao clientedao = new Clientedao();
            enderecoentrega endereco = clientedao.obteEnderecoEntregaPorClienteId(clientId);
            request.setAttribute("endereco", endereco);

            request.getRequestDispatcher("editar-endereco.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");

        // Valide e processe os dados conforme necessário
        // ...

        // Após validar os dados, atualize o objeto enderecoentrega
        enderecoentrega endereco = new enderecoentrega();
        endereco.setCep(cep);
        endereco.setLogradouto(logradouro);
        endereco.setNumero(numero);
        endereco.setComplemento(complemento);
        endereco.setBairro(bairro);
        endereco.setCidade(cidade);
        endereco.setUf(uf);

        // Obtenha o ID do cliente da sessão
        Object clienteIdObj = request.getSession().getAttribute("clientId");
        int clientId = clienteIdObj != null ? (int) clienteIdObj : 0;

        if (clientId > 0) {
            // Chame o método para atualizar o endereço de entrega do cliente no banco de dados
            Clientedao clientedao = new Clientedao();
            clientedao.atualizarEnderecoEntrega(endereco, clientId);

            // Redirecione para a página de confirmação ou outra ação apropriada
            response.sendRedirect("confirmacao-endereco.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}
