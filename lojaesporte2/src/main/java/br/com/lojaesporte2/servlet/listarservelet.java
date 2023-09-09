package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.listardao;
import br.com.lojaesporte2.model.listar;
import br.com.lojaesporte2.model.usuario;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listar")
public class listarservelet extends  HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            listardao listardao = new listardao();

            // Crie um objeto listar e configure-o com os valores desejados
            listar listar = new listar();
            listar.setId("1"); // Por exemplo, configure o ID
            listar.setNome("Nome do Usuário"); // Configure outros campos, se necessário

            List<usuario> usuarios = listardao.listarusuarios(listar);

            // Coloque a lista de usuários como um atributo na solicitação
            request.setAttribute("usuarios", usuarios);

            // Encaminhe a solicitação para uma página JSP que irá exibir os usuários
            request.getRequestDispatcher("listarUsuarios.jsp").forward(request, response);
        } catch (Exception e) {
            // Trate erros adequadamente, talvez redirecionando para uma página de erro
            e.printStackTrace();
            response.sendRedirect("paginaDeErro.jsp");
        }
    }

}
