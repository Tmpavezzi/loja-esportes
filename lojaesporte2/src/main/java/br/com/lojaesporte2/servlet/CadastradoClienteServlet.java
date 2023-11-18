package br.com.lojaesporte2.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import br.com.lojaesporte2.dao.Clientedao;
import br.com.lojaesporte2.model.cliente;
import br.com.lojaesporte2.model.enderecofaturamento;
import br.com.lojaesporte2.model.enderecoentrega;

@WebServlet("/cadatradocliente")
public class CadastradoClienteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        cliente cliente = new cliente();
        cliente.setNome_completo(request.getParameter("nome"));
        cliente.setCpf(request.getParameter("cpf"));
        cliente.setNascimento(request.getParameter("dataNascimento"));
        cliente.setGenero(request.getParameter("genero"));
        cliente.setEmail(request.getParameter("email"));
        cliente.setSenha(request.getParameter("senha"));

        enderecofaturamento enderecoFaturamento = new enderecofaturamento();
        enderecoFaturamento.setCep(request.getParameter("enderecoFaturamento[0].cep"));
        enderecoFaturamento.setLogradouto(request.getParameter("enderecoFaturamento[0].logradouro"));
        enderecoFaturamento.setNumero(request.getParameter("enderecoFaturamento[0].numero"));
        enderecoFaturamento.setComplemento(request.getParameter("enderecoFaturamento[0].complemento"));
        enderecoFaturamento.setBairro(request.getParameter("enderecoFaturamento[0].bairro"));
        enderecoFaturamento.setCidade(request.getParameter("enderecoFaturamento[0].localidade"));
        enderecoFaturamento.setUf(request.getParameter("enderecoFaturamento[0].uf"));

        enderecoentrega enderecoEntrega = new enderecoentrega();
        enderecoEntrega.setCep(request.getParameter("enderecoEntrega[1].cep"));
        enderecoEntrega.setLogradouto(request.getParameter("enderecoEntrega[1].logradouro"));
        enderecoEntrega.setNumero(request.getParameter("enderecoEntrega[1].numero"));
        enderecoEntrega.setComplemento(request.getParameter("enderecoEntrega[1].complemento"));
        enderecoEntrega.setBairro(request.getParameter("enderecoEntrega[1].bairro"));
        enderecoEntrega.setCidade(request.getParameter("enderecoEntrega[1].localidade"));
        enderecoEntrega.setUf(request.getParameter("enderecoEntrega[1].uf"));

        // Chame o método do DAO para cadastrar o cliente
        Clientedao clienteDAO = new Clientedao();
        boolean cadastrado = clienteDAO.cadastrarCliente(cliente, enderecoFaturamento, List.of(enderecoEntrega));
        if (cadastrado) {
            // Redirecione para uma página de sucesso
            response.sendRedirect("telaprincipal_usuario.jsp");
        } else {
            // Redirecione para uma página de erro
            response.sendRedirect("cadastro-erro.jsp");
        }

    }
}
