package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.listardao;
import br.com.lojaesporte2.model.ImagenProduto;
import br.com.lojaesporte2.model.produto;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdicionarAoCarrinho")
public class AdicionarAoCarrinhoservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtém os parâmetros do produto a ser adicionado ao carrinho
        int idProdutoParam = Integer.parseInt(request.getParameter("produtoId"));
        String nomeProduto = request.getParameter("produtoNome");
        double preco = Double.parseDouble(request.getParameter("produtoPreco"));
        String produtoImagem = request.getParameter("produtoImagem");

        // Crie um objeto Produto (você deve ter uma classe Produto)
        // e configure os detalhes do produto com base nos parâmetros obtidos

        // Obtém ou cria o ArrayList para armazenar os itens do carrinho
        ArrayList<produto> carrinho = (ArrayList<produto>) request.getSession().getAttribute("carrinho");
        if (carrinho == null) {
            carrinho = new ArrayList<>();
            request.getSession().setAttribute("carrinho", carrinho);
        }

        // Adiciona o produto ao carrinho
        produto novoProduto = new produto(idProdutoParam, nomeProduto, preco, produtoImagem);
        carrinho.add(novoProduto);

        // Redireciona para a página do carrinho
        response.sendRedirect("carrinho.jsp");
    }

    private List<produto> adicionarImagensAosProdutos(List<produto> produtos, listardao dao) {
        List<produto> produtosComImagens = new ArrayList<>();
        for (produto produto : produtos) {
            produtosComImagens.add(adicionarImagensAoProduto(produto, dao));
        }
        return produtosComImagens;
    }

    private produto adicionarImagensAoProduto(produto produto, listardao dao) {
        List<ImagenProduto> imagens = produto.getImagens();
        if (imagens != null) {
            for (ImagenProduto imagem : imagens) {
                int imagemId = imagem.getImagenId();
                if (imagemId > 0) {
                    byte[] imagemBytes = dao.recuperarImagemPorProdutoId(imagem.getImagenId());
                    if (imagemBytes != null) {
                        String imagemBase64 = Base64.getEncoder().encodeToString(imagemBytes);
                        produto.setImagemBase64(imagemBase64);
                    }
                }
            }
        }
        return produto;
    }


}
