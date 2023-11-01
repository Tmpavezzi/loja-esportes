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
import br.com.lojaesporte2.model.cliente;
import br.com.lojaesporte2.model.enderecofaturamento;
import br.com.lojaesporte2.model.enderecoentrega;
import org.apache.taglibs.standard.tag.common.core.UrlSupport;


@WebServlet("/cadatradocliente")
public class CadastradoClineteServlte  extends HttpServlet{

    protected  void     doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{

        String  Validaçãoemail = request.getParameter("email");

        Clientedao dao = new Clientedao();

        if(dao.verificaEmail(Validaçãoemail)){
            request.setAttribute("erro","O email ja esta casdatrado");
            request.getRequestDispatcher("tela_de_login.jsp").forward(request,response);
        }


        String email = request.getParameter("email");
        String cpf = request.getParameter("cpf");
        String nomeCompleto = request.getParameter("nome");
        String dataNascimento = request.getParameter("dataNascimento");
        String genero = request.getParameter("genero");
        String senha = request.getParameter("senha");


        String[] faturamentoArray = request.getParameterValues("enderecoFaturamento");



        enderecofaturamento faturamento = new enderecofaturamento(
                faturamentoArray[0],
                faturamentoArray[1],
                faturamentoArray[2],
                faturamentoArray[3],
                faturamentoArray[4],
                faturamentoArray[5],
                faturamentoArray[6]
        );

        List<enderecoentrega> enderecoEntregas = new ArrayList<>();
        int i = 0;

        while (request.getParameter("enderecoEntrega[" + i + "].cep") != null) {
            String cep = request.getParameter("enderecoEntrega[" + i + "].cep");


            if (validarCEP(cep)) {
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
                // Trate o CEP inválido, você pode redirecionar de volta ao formulário ou exibir uma mensagem de erro
                request.setAttribute("erro", "CEP inválido: " + cep);
                request.getRequestDispatcher("tela_de_cadastro.jsp").forward(request, response);
                return; // Saia do método se o CEP for inválido
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
    private boolean validarCEP(String cep){
        try{
            URL url = new URL("https://viacep.com.br/ws/" + cep + "/json/" );
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            int responseCode = conn.getResponseCode();

            if(responseCode ==200){
                return true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
