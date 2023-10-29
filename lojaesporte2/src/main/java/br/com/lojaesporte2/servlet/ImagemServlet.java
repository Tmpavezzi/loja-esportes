    package br.com.lojaesporte2.servlet;

    import br.com.lojaesporte2.dao.ImagemDAO;
    import br.com.lojaesporte2.model.Imagem;

    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import java.io.IOException;
    import java.sql.Connection;
    import java.sql.SQLException;
    import java.util.Base64;
    import java.util.List;

    @WebServlet("/imagem-servlet")
    public class ImagemServlet extends HttpServlet {
        private Connection connection;

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            int produtoId = Integer.parseInt(request.getParameter("produtoId"));


            ImagemDAO imagemDAO = new ImagemDAO(connection);

            try {
                List<Imagem> imagens = imagemDAO.listarImagensPorProduto(produtoId);

                if (!imagens.isEmpty()) {
                    // Supondo que você deseja a primeira imagem da lista
                    Imagem imagem = imagens.get(0);
                    byte[] imagemBytes = imagem.getImagem();

                    // Converta os bytes da imagem em uma URL com o prefixo 'data:image/jpeg;base64,'
                    String imagemURL = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imagemBytes);

                    response.getWriter().write(imagemURL);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
    }

