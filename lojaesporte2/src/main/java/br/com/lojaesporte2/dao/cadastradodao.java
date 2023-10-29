package br.com.lojaesporte2.dao;
import br.com.lojaesporte2.model.produto;
import br.com.lojaesporte2.model.usuario;


import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;
import java.util.List;

public class cadastradodao {

    public void cerateusuario(usuario usuario) {
        String SQL = "INSERT INTO USUARIO (NOME,CPF,EMAIL,SENHA,GRUPO,SITUACAO) VALUES (?,?,?,?,?,?)";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Sucessso in databese connection");

            String senhaCriptografada = criptografarSenha(usuario.getSenha());

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, usuario.getNome());
            preparedStatement.setString(2, usuario.getCpf());
            preparedStatement.setString(3, usuario.getEmail());
            preparedStatement.setString(4, senhaCriptografada);
            preparedStatement.setString(5, usuario.getGrupo());
            preparedStatement.setString(6, usuario.getSituacao());

            preparedStatement.execute();

            System.out.println("Sucesso na insert");

            connection.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    private String criptografarSenha(String Senha) {
        String salt = BCrypt.gensalt();
        String senhaCriptografada = BCrypt.hashpw(Senha, salt);
        return senhaCriptografada;
    }

    public boolean verificacpf(String cpf) {
        String SQL = "SELECT COUNT(*) FROM USUARIO WHERE CPF = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, cpf);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public int CadastadorProduto(produto produto) {

        String sql = "INSERT INTO PRODUTO  (nome, avaliacao, descricao, preco, estoque,status) VALUES (?, ?, ?, ?, ?,?)";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Sucesso na conexão com o banco de dados");

            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, produto.getNome());
            preparedStatement.setDouble(2, produto.getAvaliacao());
            preparedStatement.setString(3, produto.getDescricao());
            preparedStatement.setDouble(4, produto.getPreco());
            preparedStatement.setInt(5, produto.getEstoque());
            preparedStatement.setString(6,produto.getStatus());

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Falha ao inserir o produto, nenhuma linha afetada.");
            }

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int produtoID = generatedKeys.getInt(1);
                    produto.setID(produtoID);// Defina o ID gerado no objeto produto
                    System.out.println(produtoID);
                    return produtoID;

                    // Agora, você tem o ID do produto inserido, mas as imagens ainda não foram inseridas aqui.
                    // Você pode inserir imagens em um momento posterior, se desejar.
                } else {
                    throw new SQLException("Falha ao obter o ID do produto, nenhuma chave gerada.");
                }
            }

        } catch (SQLException e) {
            System.out.println("Erro durante a inserção do produto: " + e.getMessage());
        }
        return -1;

        //CREATE TABLE PRODUTO (
        //    ID INT AUTO_INCREMENT PRIMARY KEY,
        //    NOME VARCHAR(255),
        //    AVALIACAO DECIMAL(5, 2),
        //    DESCRICAO TEXT,
        //    PRECO DECIMAL(10, 2),

        //    ESTOQUE INT,

        //    ESTOQUE INT

        //    STATUS VARCHAR(10)
        //);
    }

    public void inserirImagemNoBancoDeDados(int produtoID, String nomeImagem, byte[] imagemBytes, boolean imagemPrincipal) {
        String sql = "INSERT INTO  IMAGEM (PRODUTO_ID, NOME_IMAGEM, IMAGEM, PRINCIPAL) VALUES (?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, produtoID);
            preparedStatement.setString(2, nomeImagem);
            preparedStatement.setBytes(3, imagemBytes);
            preparedStatement.setBoolean(4, imagemPrincipal);

            preparedStatement.executeUpdate();

            System.out.println("Imagem inserida com sucesso no banco de dados.");

        } catch (SQLException e) {
            System.out.println("Erro ao inserir imagem no banco de dados: " + e.getMessage());
        }

    }

    //CREATE TABLE IMAGEM (
    //    IMAGEM_ID INT AUTO_INCREMENT PRIMARY KEY,
    //    PRODUTO_ID INT,
    //    NOME_IMAGEM VARCHAR(255),
    //    IMAGEM BLOB,
    //    PRINCIPAL BOOLEAN,
    //    FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTO (ID)
    //);
}
