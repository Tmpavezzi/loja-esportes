package br.com.lojaesporte2.dao;

import br.com.lojaesporte2.model.Imagem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImagemDAO {
    private Connection connection; // Estabeleça a conexão com o banco de dados.

    public ImagemDAO(Connection connection) {
        this.connection = connection;
    }

    public void inserirImagem(Imagem imagem) throws SQLException {
        String sql = "INSERT INTO IMAGEM (PRODUTO_ID, NOME_IMAGEM, IMAGEM, PRINCIPAL) VALUES (?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, imagem.getProdutoId());
            statement.setString(2, imagem.getNomeImagem());
            statement.setBytes(3, imagem.getImagem());
            statement.setBoolean(4, imagem.isPrincipal());

            statement.executeUpdate();
        }
    }

    public List<Imagem> listarImagensPorProduto(int produtoId) throws SQLException {
        List<Imagem> imagens = new ArrayList<>();
        String sql = "SELECT NOME_IMAGEM, IMAGEM FROM IMAGEM WHERE PRODUTO_ID = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, produtoId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Imagem imagem = new Imagem();
                    imagem.setNomeImagem(resultSet.getString("NOME_IMAGEM"));
                    imagem.setImagem(resultSet.getBytes("IMAGEM"));
                    imagens.add(imagem);
                }
            }
        }

        return imagens;
    }
}

