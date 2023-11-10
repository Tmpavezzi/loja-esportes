package br.com.lojaesporte2.servlet;

import br.com.lojaesporte2.dao.cadastradodao;
import br.com.lojaesporte2.model.ImagenProduto;
import br.com.lojaesporte2.model.produto;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

//Cadastroprodservlet
@WebServlet("/cadastradoPorduto")
@MultipartConfig(fileSizeThreshold = 124 * 124 * 2, // 2MB
        maxFileSize = 124 * 124 * 10,      // 10MB
        maxRequestSize = 124 * 124 * 50)   // 50MB
public class Cadastroprodservlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String nome = request.getParameter("nome");
        double avaliacao = Double.parseDouble(request.getParameter("avaliacao"));
        String descricao = request.getParameter("descricao");
        double preco = Double.parseDouble(request.getParameter("preco"));
        int estoque = Integer.parseInt(request.getParameter("estoque"));
        String status = request.getParameter("status");



        produto produto = new produto();
        produto.setNome(nome);
        produto.setAvaliacao(avaliacao);
        produto.setDescricao(descricao);
        produto.setPreco(preco);
        produto.setEstoque(estoque);
        produto.setStatus(status);

        // Capturar a imagem principal selecionada pelo usuário
        String imagemPrincipal = request.getParameter("defaultImage");

        cadastradodao dao = new cadastradodao();
        int produtoID = dao.CadastadorProduto(produto);


        // Processar as imagens enviadas pelo usuário
        List<ImagenProduto> imagens = new ArrayList<>();
        for (Part part : request.getParts()) {
            if (part.getName().equals("imagens")) {
                // Gerar um nome único para a imagem
                String nomeImagem = gerarNomeUnico() + ".jpg";

                // Lê os bytes da imagem do objeto Part
                byte[] imagemBytes = new byte[(int) part.getSize()];
                part.getInputStream().read(imagemBytes);

                ImagenProduto imagenProduto = new ImagenProduto();
                imagenProduto.setNomeImagens(nomeImagem);
                imagenProduto.setImagen(imagemBytes);

                imagens.add(imagenProduto);

                // Adicionar o nome da imagem à lista
                dao.inserirImagemNoBancoDeDados(produtoID, nomeImagem, imagemBytes, nomeImagem.equals(imagemPrincipal));


            }
        }

        // Associe a lista de imagens ao produto
        produto.setImagens(imagens);

        // Conecte-se ao DAO e chame o método de cadastro de produtos

        // Redirecione para uma página de sucesso ou outra página desejada
        response.sendRedirect("cadastrodeproduto.jsp");
    }

    // Função para gerar um nome único para a imagem (por exemplo, usando UUID)
    private String gerarNomeUnico() {
        return UUID.randomUUID().toString();
    }


}
