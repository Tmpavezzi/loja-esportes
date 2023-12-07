package br.com.lojaesporte2.dao;



import br.com.lojaesporte2.model.Pedido;
import br.com.lojaesporte2.model.PedidoItem;

import java.sql.*;

public class PedidoDAO {

    public void cadastrarPedido(Pedido pedido) {
        try (Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa")) {
            connection.setAutoCommit(false);

            inserirPedido(connection, pedido);

            for (PedidoItem item : pedido.getPedidoItems()) {
                inserirPedidoItem(connection, pedido.getIdPedido(), item);
                atualizarEstoqueProduto(connection, item.getIdProduto(), item.getQuantidade());
            }

            connection.commit();
        } catch (SQLException e) {
            System.out.println(e.getMessage());;
        }
    }

    private void inserirPedido(Connection connection, Pedido pedido) throws SQLException {
        String query = "INSERT INTO Pedido (nome_cliente, valor_total, frete, situacao, cep, forma_pagamento) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, pedido.getNomeCliente());
            preparedStatement.setBigDecimal(2, pedido.getValorTotal());
            preparedStatement.setBigDecimal(3, pedido.getFrete());
            preparedStatement.setString(4, pedido.getSituacao());
            preparedStatement.setString(5, pedido.getCep());
            preparedStatement.setString(6, pedido.getFormaPagamento());

            preparedStatement.executeUpdate();

            int idPedido;
            try (var generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    idPedido = generatedKeys.getInt(1);
                    pedido.setIdPedido(idPedido); // Atualiza o ID do pedido no objeto
                } else {
                    throw new SQLException("Falha ao obter o ID do pedido.");
                }
            }
        }
    }

    private void inserirPedidoItem(Connection connection, int idPedido, PedidoItem item) throws SQLException {
        String query = "INSERT INTO Pedido_Item (id_pedido, id_produto, quantidade, valor_unitario) " +
                "VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, idPedido);
            preparedStatement.setInt(2, item.getIdProduto());
            preparedStatement.setInt(3, item.getQuantidade());
            preparedStatement.setBigDecimal(4, item.getValorUnitario());

            preparedStatement.executeUpdate();
        }
    }

    private void atualizarEstoqueProduto(Connection connection, int idProduto, int quantidade) throws SQLException {
        String query = "UPDATE Produto SET estoque = estoque - ? WHERE id_produto = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, quantidade);
            preparedStatement.setInt(2, idProduto);

            preparedStatement.executeUpdate();
        }
    }


}

//    CREATE TABLE Pedido (
//        id_pedido INT PRIMARY KEY AUTO_INCREMENT,
//        nome_cliente VARCHAR(100),
//    valor_total DECIMAL(10, 2),
//    frete DECIMAL(10, 2),
//    situacao VARCHAR(20),
//    cep VARCHAR(10),
//    forma_pagamento VARCHAR(50)
//);

//    CREATE TABLE Pedido_Item (
//        id_pedido_item INT PRIMARY KEY AUTO_INCREMENT,
//        id_pedido INT,
//        id_produto INT,
//        quantidade INT,
//        valor_unitario DECIMAL(10, 2),
//    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
//        FOREIGN KEY (id_produto) REFERENCES Produto(ID)
//        );

