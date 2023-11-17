package br.com.lojaesporte2.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cep")
public class CepServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cep = request.getParameter("cep");
        String url = "https://viacep.com.br/ws/" + cep + "/json/";

        // Fazer a chamada à API do ViaCEP e obter os dados

        // Configurar a resposta para o navegador
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // Enviar os dados JSON de volta ao navegador (pode precisar ajustar conforme necessário)
        response.getWriter().write("{\"logradouro\":\"Rua ABC\", \"bairro\":\"Centro\", \"cidade\":\"Cidade\", \"uf\":\"UF\"}");
    }
}

