package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.listardao;
import br.com.lojaesporte2.model.ImagenProduto;
import br.com.lojaesporte2.model.produto;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet("/maisprodutosusers")
public class maisprodutosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomeProduto = request.getParameter("nomeProduto");
        String idProdutoParam = request.getParameter("idProduto");

        listardao dao = new listardao();

        if (nomeProduto != null) {
            List<produto> produtos = dao.listarProdutoPorNome(nomeProduto);
                List<produto> produtosComImagens = adicionarImagensAosProdutos(produtos, dao);
            request.setAttribute("produtos", produtosComImagens);
            request.getRequestDispatcher("maisprodutos_usuarios.jsp").forward(request, response);
        } else if (idProdutoParam != null) {
            int produtoId = Integer.parseInt(idProdutoParam);
            produto produto = dao.recuperarProdutoPorId(produtoId);

            if (produto != null) {
                produto = adicionarImagensAoProduto(produto, dao);
                request.setAttribute("produto", produto);
                request.setAttribute("nomeProduto", produto.getNome());
                request.setAttribute("avaliacao", produto.getAvaliacao());
                request.setAttribute("preco", produto.getPreco());
                request.setAttribute("descricao", produto.getDescricao());
                request.setAttribute("produtoId", produtoId);
                request.getRequestDispatcher("descricaoproduto_usuario.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("produto_nao_encontrado.jsp").forward(request, response);
            }
        }
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
                    byte[] imagemBytes = dao.recuperarImagemPorId(imagem.getImagenId());
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
