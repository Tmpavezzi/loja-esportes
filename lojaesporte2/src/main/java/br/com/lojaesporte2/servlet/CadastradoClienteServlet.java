package br.com.lojaesporte2.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import br.com.lojaesporte2.dao.Clientedao;
import br.com.lojaesporte2.model.ViaCEPResposponse;
import br.com.lojaesporte2.model.cliente;
import br.com.lojaesporte2.model.enderecofaturamento;
import br.com.lojaesporte2.model.enderecoentrega;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/cadatradocliente")
public class CadastradoClienteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String validacaoEmail = request.getParameter("email");

        Clientedao dao = new Clientedao();

        if (dao.verificaEmail(validacaoEmail)) {
            request.setAttribute("erro", "O email já está cadastrado");
            request.getRequestDispatcher("tela_de_login.jsp").forward(request, response);
        }

        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String nomeCompleto = request.getParameter("nome");
        String dataNascimento = request.getParameter("dataNascimento");
        String genero = request.getParameter("genero");
        String senha = request.getParameter("senha");


        enderecofaturamento faturamento = new enderecofaturamento(
                request.getParameter("enderecoFaturamento.cep"),
                request.getParameter("enderecoFaturamento.logradouro"),
                request.getParameter("enderecoFaturamento.numero"),
                request.getParameter("enderecoFaturamento.complemento"),
                request.getParameter("enderecoFaturamento.bairro"),
                request.getParameter("enderecoFaturamento.cidade"),
                request.getParameter("enderecoFaturamento.uf")
        );

        List<enderecoentrega> enderecoEntregas = new ArrayList<>();
        int i = 0;

        while (request.getParameter("enderecoEntrega[" + i + "].cep") != null) {
            String cep = request.getParameter("enderecoEntrega[" + i + "].cep");

            if (validarCEP(cep,request)) {
                enderecoentrega entrega = new enderecoentrega();
                entrega.setCep(cep);
                entrega.setLogradouto(request.getParameter("enderecoEntrega[" + i + "].logradouto"));
                entrega.setNumero(request.getParameter("enderecoEntrega[" + i + "].numero"));
                entrega.setComplemento(request.getParameter("enderecoEntrega[" + i + "].complemento"));
                entrega.setBairro(request.getParameter("enderecoEntrega[" + i + "].bairro"));
                entrega.setCidade(request.getParameter("enderecoEntrega[" + i + "].cidade"));
                entrega.setUf(request.getParameter("enderecoEntrega[" + i + "].uf"));
                enderecoEntregas.add(entrega);
            } else {
                request.setAttribute("erro", "CEP inválido: " + cep);
                request.getRequestDispatcher("tela_de_cadastro.jsp").forward(request, response);
                return;
            }
            i++;
        }

        cliente cliente = new cliente();
        cliente.setEmail(email);
        cliente.setCpf(cpf);
        cliente.setNome_completo(nomeCompleto);
        cliente.setNascimento(dataNascimento);
        cliente.setGenero(genero);
        cliente.setSenha(senha);

        Clientedao clienteDao = new Clientedao();
        boolean sucesso = clienteDao.cadastrarCliente(cliente, faturamento, enderecoEntregas);

        if (sucesso) {
            response.sendRedirect("tela_de_login.jsp");
        } else {
            request.setAttribute("erro", "Ocorreu um erro no cadastro.");
            request.getRequestDispatcher("tela_de_login.jsp").forward(request, response);
        }
    }

    private boolean validarCEP(String cep, HttpServletRequest request) {
        try {
            URL url = new URL("https://viacep.com.br/ws/" + cep + "/json/");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            int responseCode = conn.getResponseCode();

            if (responseCode == 200) {

                ObjectMapper objectMapper = new ObjectMapper();
                ViaCEPResposponse viaCEPResponse = objectMapper.readValue(conn.getInputStream(), ViaCEPResposponse.class);

                request.setAttribute("logradouro", viaCEPResponse.getLogradouro());
                request.setAttribute("complemento", viaCEPResponse.getComplemento());
                request.setAttribute("bairro", viaCEPResponse.getBairro());
                request.setAttribute("cidade", viaCEPResponse.getLocalidade());
                request.setAttribute("uf", viaCEPResponse.getUf());

                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
