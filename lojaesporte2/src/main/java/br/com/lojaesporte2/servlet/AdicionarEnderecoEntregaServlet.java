package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.Clientedao;
import br.com.lojaesporte2.model.enderecoentrega;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdicionarEnderecoEntregaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupere os parâmetros do formulário para criar um objeto enderecoentrega
        String cep = request.getParameter("cep");
        String logradouro = request.getParameter("logradouro");
        String numero = request.getParameter("numero");
        String complemento = request.getParameter("complemento");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");

        // Crie um objeto enderecoentrega com os dados do formulário
        enderecoentrega enderecoEntrega = new enderecoentrega();
        enderecoEntrega.setCep(cep);
        enderecoEntrega.setLogradouto(logradouro);
        enderecoEntrega.setNumero(numero);
        enderecoEntrega.setComplemento(complemento);
        enderecoEntrega.setBairro(bairro);
        enderecoEntrega.setCidade(cidade);
        enderecoEntrega.setUf(uf);

        // Obtenha o ID do cliente (você pode recuperá-lo de alguma forma, por exemplo, a partir de uma sessão)
        int clienteId = 1;  // Substitua pelo ID do cliente real

        // Chame o método na DAO para adicionar o novo endereço de entrega
        Clientedao enderecoEntregaDao = new Clientedao();
        boolean sucesso = enderecoEntregaDao.adicionarEnderecoEntrega(enderecoEntrega, clienteId);

        if (sucesso) {
            // O endereço de entrega foi adicionado com sucesso, redirecione para a página JSP
            response.sendRedirect("adicionar-endereco.jsp");
        } else {
            // Algo deu errado, redirecione para uma página de erro
            response.sendRedirect("erro.jsp");
        }
    }
}
