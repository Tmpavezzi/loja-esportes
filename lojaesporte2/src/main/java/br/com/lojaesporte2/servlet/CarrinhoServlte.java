package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.PedidoDAO;
import br.com.lojaesporte2.model.Pedido;
import br.com.lojaesporte2.model.PedidoItem;
import br.com.lojaesporte2.model.produto;

import java.io.IOException;
import java.math.BigDecimal;
import static java.math.BigDecimal.ZERO;
import java.util.List;
import javax.servlet.ServletException;
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

        // Recupera as informações do carrinho da sessão
        List<produto> carrinho = (List<produto>) session.getAttribute("carrinho");

        // Calcula o total do pedido
        BigDecimal totalPedido = calcularTotalPedido(carrinho);

        // Cria um objeto Pedido
        Pedido pedido = new Pedido();
        pedido.setValorTotal(totalPedido);
        pedido.setSituacao("Em andamento");

        // Adiciona os itens ao pedido
        for (produto produto : carrinho) {
            PedidoItem item = new PedidoItem(0, 0, produto.getID(), produto.getEstoque(), produto.getPreco());
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

    private BigDecimal calcularTotalPedido(List<produto> carrinho) {
        return carrinho.stream()
                .map(produto -> BigDecimal.valueOf(produto.getPreco()).multiply(BigDecimal.valueOf(produto.getEstoque())))
                .reduce(ZERO, BigDecimal::add);
    }
}



