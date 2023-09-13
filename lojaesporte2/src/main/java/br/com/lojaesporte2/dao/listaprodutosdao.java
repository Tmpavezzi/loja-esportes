package br.com.lojaesporte2.dao;

import br.com.lojaesporte2.model.listaprodutos;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class listaprodutosdao {

    //CREATE TABLE produtos (
    //    idprod INT AUTO_INCREMENT PRIMARY KEY,
    //    descprod VARCHAR(100),
    //    quantprod VARCHAR(100),
    //    val DECIMAL(5,2),
    //    status BOOLEAN DEFAULT TRUE
    //);

    //INSERT INTO produtos (descprod, quantprod, val, status)
    //VALUES ('Wheyprotein - Growth', '30', '139.99', TRUE);

    public List<listaprodutos> listarProdutos() {

        String sql = "SELECT idprod, descprod, quantprod, val, status FROM PRODUTOS  ";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Sucesso na conexão com o banco de dados");

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<listaprodutos> produtos = new ArrayList<>();

            while (resultSet.next()) {
                String id = resultSet.getString("idprod");
                String desc = resultSet.getString("descprod");
                String quantidade = resultSet.getString("quantprod");
                Double valor = resultSet.getDouble("val");
                Boolean ativo = resultSet.getBoolean("status");

                listaprodutos listaprodutos = new listaprodutos();
                listaprodutos.setId(id);
                listaprodutos.setDesc(desc);
                listaprodutos.setQuantidade(quantidade);
                listaprodutos.setValor(valor);
                listaprodutos.setAtivo(ativo);
                listaprodutos.setStatusformatado(ativo ? "Ativo" : "Inativo");

                produtos.add(listaprodutos);
            }

            System.out.println("Sucesso na consulta");

            connection.close();

            return produtos;

        } catch (SQLException e) {
            System.out.println("Falha na conexão com o banco de dados: " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public List<listaprodutos> listarProdutosFiltrados(String filtro) {
        String sql = "SELECT idprod, descprod, quantprod, val, status FROM PRODUTOS  WHERE descprod LIKE ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Sucesso na conexão com o banco de dados");

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + filtro + "%"); // Adicione o filtro à consulta SQL
            ResultSet resultSet = preparedStatement.executeQuery();
            List<listaprodutos> produtos = new ArrayList<>();

            while (resultSet.next()) {

                String id = resultSet.getString("idprod");
                String desc = resultSet.getString("descprod");
                String quantidade = resultSet.getString("quantprod");
                Double valor = resultSet.getDouble("val");
                Boolean ativo = resultSet.getBoolean("status");

                listaprodutos listaprodutos = new listaprodutos();
                listaprodutos.setId(id);
                listaprodutos.setDesc(desc);
                listaprodutos.setQuantidade(quantidade);
                listaprodutos.setValor(valor);
                listaprodutos.setAtivo(ativo);
                listaprodutos.setStatusformatado(ativo ? "Ativo" : "Inativo");

                produtos.add(listaprodutos);

            }

            System.out.println("Sucesso na consulta");

            connection.close();

            return produtos;
        } catch (SQLException e) {
            System.out.println("Falha na conexão com o banco de dados: " + e.getMessage());
            return Collections.emptyList();
        }
    }

}
