package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.listardao;
import br.com.lojaesporte2.model.usuario;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import java.util.List;

@WebServlet("/listar")
public class listarservelet extends  HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Servlet de lisatgem foi acessada");

        String filtro = request.getParameter("search");

        listardao dao = new listardao();
        List<usuario> usuarios = dao.listarUsuarios();

        if (filtro != null && !filtro.isEmpty()) {

            usuarios = dao.listarUsuariosFiltrados(filtro);
        } else {

            usuarios = dao.listarUsuarios();
        }


        request.setAttribute("usuarios", usuarios);
        request.getRequestDispatcher("listarusuario.jsp").forward(request, response);
    }
}



