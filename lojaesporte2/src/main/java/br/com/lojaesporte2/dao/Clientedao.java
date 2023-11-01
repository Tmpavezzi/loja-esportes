package br.com.lojaesporte2.dao;

import br.com.lojaesporte2.model.cliente;
import br.com.lojaesporte2.model.enderecoentrega;
import br.com.lojaesporte2.model.enderecofaturamento;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;
import java.util.List;

public class Clientedao {

    public boolean cadastrarCliente(cliente cliente, enderecofaturamento faturamento, List<enderecoentrega> enderecoentregas){
        String sql = "INSERT INTO Cliente (email, cpf, nome_completo, data_nascimento, genero, senha) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            preparedStatement.setString(1, cliente.getEmail());
            preparedStatement.setString(2, cliente.getCpf());
            preparedStatement.setString(3, cliente.getNome_completo());
            preparedStatement.setString(4, cliente.getNascimento());
            preparedStatement.setString(5, cliente.getGenero());

            String senhaCriptografada = criptografarSenha(cliente.getSenha());
            preparedStatement.setString(6, senhaCriptografada);

            int affectedRows = preparedStatement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Falha ao inserir o cliente, nenhuma linha afetada.");
            }

            int clienteID;
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    clienteID = generatedKeys.getInt(1);
                    cliente.setId(clienteID); // Defina o ID gerado no objeto cliente
                } else {
                    connection.rollback();
                    return false;
                }
            }


            // Agora que você tem o ID do cliente, pode inserir os endereços de faturamento e entrega.
            if (!inserirEnderecoFaturamento(connection, clienteID, faturamento) || !inserirEnderecosEntrega(connection, clienteID, enderecoentregas)) {
                connection.rollback();
                System.out.println("erro" + clienteID);
                return false;
            }

            connection.commit();
            return true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    private boolean inserirEnderecoFaturamento(Connection connection, int clienteID, enderecofaturamento faturamento) {
        String sql = "INSERT INTO ENDERECOFATURAMENTO (cliente_id, cep, logradouro, numero, complemento, bairro, cidade, uf) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement preparedStatementFaturamento = connection.prepareStatement(sql);

            preparedStatementFaturamento.setInt(1, clienteID);
            preparedStatementFaturamento.setString(2, faturamento.getCep());
            preparedStatementFaturamento.setString(3, faturamento.getLogradouto());
            preparedStatementFaturamento.setString(4,faturamento.getNumero());
            preparedStatementFaturamento.setString(5, faturamento.getComplemento());
            preparedStatementFaturamento.setString(6, faturamento.getBairro());
            preparedStatementFaturamento.setString(7, faturamento.getCidade());
            preparedStatementFaturamento.setString(8, faturamento.getUf());

            int affectedRows = preparedStatementFaturamento.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    private boolean inserirEnderecosEntrega(Connection connection, int clienteID, List<enderecoentrega> enderecoentregas) {
        String sql = "INSERT INTO ENDERECOENTREGA  (cliente_id, cep, logradouro, numero, complemento, bairro, cidade, uf) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement preparedStatementEntregas = connection.prepareStatement(sql);

            boolean allInserted = true;

            for (enderecoentrega enderecoentrega : enderecoentregas) {
                preparedStatementEntregas.setInt(1, clienteID);
                preparedStatementEntregas.setString(2, enderecoentrega.getCep());
                preparedStatementEntregas.setString(3, enderecoentrega.getLogradouto());
                preparedStatementEntregas.setString(4,enderecoentrega.getNumero());
                preparedStatementEntregas.setString(5, enderecoentrega.getComplemento());
                preparedStatementEntregas.setString(6, enderecoentrega.getBairro());
                preparedStatementEntregas.setString(7, enderecoentrega.getCidade());
                preparedStatementEntregas.setString(8, enderecoentrega.getUf());

                int affectedRows = preparedStatementEntregas.executeUpdate();
                if (affectedRows <= 0) {
                    allInserted = false;
                }
            }

            return allInserted;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }


    public  boolean  verificaEmail(String email){

        String sql = "SELECT email FROM Cliente WHERE email = ?";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test","sa","sa");
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,email);

            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();

        }catch (SQLException e ){
            System.out.println(e.getMessage());
            return false;
        }

    }

    private String criptografarSenha(String senha){
        String salt = BCrypt.gensalt();
        String senhaCriptografa = BCrypt.hashpw(senha,salt);
        return senhaCriptografa;
    }



//    CREATE TABLE Cliente (
//            id INT AUTO_INCREMENT PRIMARY KEY,
//            email VARCHAR(255) UNIQUE NOT NULL,
//    cpf VARCHAR(14) UNIQUE NOT NULL,
//    nome_completo VARCHAR(255) NOT NULL,
//    data_nascimento DATE NOT NULL,
//    genero CHAR(8),
//    senha VARCHAR(255) NOT NULL
//);


//    CREATE TABLE EnderecoFaturamento (
//            id INT AUTO_INCREMENT PRIMARY KEY,
//            cliente_id INT NOT NULL,
//            cep VARCHAR(8) NOT NULL,
//    logradouro VARCHAR(255) NOT NULL,
//    numero VARCHAR(10) NOT NULL,
//    complemento VARCHAR(255),
//    bairro VARCHAR(255) NOT NULL,
//    cidade VARCHAR(255) NOT NULL,
//    uf CHAR(2) NOT NULL,
//    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
//            );


//    CREATE TABLE EnderecoEntrega (
//            id INT AUTO_INCREMENT PRIMARY KEY,
//            cliente_id INT NOT NULL,
//            cep VARCHAR(8) NOT NULL,
//    logradouro VARCHAR(255) NOT NULL,
//    numero VARCHAR(10) NOT NULL,
//    complemento VARCHAR(255),
//    bairro VARCHAR(255) NOT NULL,
//    cidade VARCHAR(255) NOT NULL,
//    uf CHAR(2) NOT NULL,
//    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
//            );



}
