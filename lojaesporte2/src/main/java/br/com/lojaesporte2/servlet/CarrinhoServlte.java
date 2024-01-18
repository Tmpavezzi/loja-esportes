package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.PedidoDAO;
import br.com.lojaesporte2.model.Pedido;
import br.com.lojaesporte2.model.PedidoItem;
import br.com.lojaesporte2.model.produto;

import java.io.IOException;
import java.math.BigDecimal;
import static java.math.BigDecimal.ZERO;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/FinalizarCompraServlet")
public class CarrinhoServlte extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Verifica se o usuário está logado
        if (session.getAttribute("userLoggedIn") == null) {
            // Cliente não está logado, redirecionar para a página de login
            response.sendRedirect("index.jsp");
            return;
        }
        List<produto> carrinho = (List<produto>) session.getAttribute("carrinho");

        if (carrinho == null || carrinho.isEmpty()) {
            // Carrinho vazio, redirecionar para alguma página apropriada
            response.sendRedirect("carrinho_vazio.jsp");
            return;
        }


        double totalPedido = Double.parseDouble(request.getParameter("totalPedido"));

        int index = 0;
        while (true) {
            String produtoNome = request.getParameter("produtoNome" + index);
            if (produtoNome == null) {
                break;
            }

            double produtoPreco = Double.parseDouble(request.getParameter("produtoPreco" + index));
            int produtoQuantidade = Integer.parseInt(request.getParameter("produtoQuantidade" + index));

            produto produto = new produto();  // Certifique-se de que Produto é a sua classe de modelo
            produto.setNome(produtoNome);
            produto.setPreco(produtoPreco);
            produto.setEstoque(produtoQuantidade);

            carrinho.add(produto);

            index++;
        }

        // Armazena a lista carrinho na sessão
        session.setAttribute("carrinho", carrinho);
        System.out.println(carrinho);

        // Restante do seu código...

        // Insere o pedido no banco de dados
        Pedido pedido = new Pedido();
        pedido.setValorTotal(new BigDecimal(totalPedido));
        pedido.setSituacao("Em andamento");

        for (produto produto : carrinho) {
            PedidoItem item = new PedidoItem(produto.getID(), produto.getEstoque(), produto.getPreco());
            pedido.adicionarItem(item);
        }

        // Insere o pedido no banco de dados
        PedidoDAO pedidoDAO = new PedidoDAO();
        pedidoDAO.cadastrarPedido(pedido);

        // Limpa o carrinho após finalizar a compra
        session.removeAttribute("carrinho");

        // Redireciona para a página de pedidos ou outra página desejada
        response.sendRedirect("finalizarcompra.jsp");
    }

    private BigDecimal calcularTotalPedido(HttpServletRequest request) {
        // Aqui você pode adaptar a lógica para calcular o total do pedido a partir dos parâmetros da requisição
        // Neste exemplo, estou apenas recuperando um parâmetro chamado "totalPedido" da requisição
        String totalPedidoStr = request.getParameter("totalPedido");

        // Converte a string para BigDecimal (ou outro tipo necessário)
        BigDecimal totalPedido = new BigDecimal(totalPedidoStr);

        return totalPedido;
    }
}

