package br.com.lojaesporte2.dao;

import br.com.lojaesporte2.model.listar;
import br.com.lojaesporte2.model.usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class listardao {

    public List<usuario> listarUsuarios() {

        String sql = "SELECT nome, cpf, email, grupo, situacao FROM USUARIO ";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Sucesso na conexão com o banco de dados");

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<usuario> usuarios = new ArrayList<>();

            while (resultSet.next()) {
                String nome = resultSet.getString("nome");
                String cpf = resultSet.getString("cpf");
                String email = resultSet.getString("email");
                String grupo = resultSet.getString("grupo");
                String situacao = resultSet.getString("situacao");

                usuario usuario = new usuario();
                usuario.setNome(nome);
                usuario.setCpf(cpf);
                usuario.setEmail(email);
                usuario.setGrupo(grupo);
                usuario.setSituacao(situacao);

                usuarios.add(usuario);
            }

            System.out.println("Sucesso na consulta");

            connection.close();

            return usuarios;

        } catch (SQLException e) {
            System.out.println("Falha na conexão com o banco de dados: " + e.getMessage());
            return Collections.emptyList();
        }
    }

    public List<usuario> listarUsuariosFiltrados(String filtro) {
        String sql = "SELECT nome, cpf, email, grupo, situacao FROM USUARIO  WHERE nome LIKE ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Sucesso na conexão com o banco de dados");

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%" + filtro + "%"); // Adicione o filtro à consulta SQL
            ResultSet resultSet = preparedStatement.executeQuery();
            List<usuario> usuarios = new ArrayList<>();

            while (resultSet.next()) {

                String nome = resultSet.getString("nome");
                String cpf = resultSet.getString("cpf");
                String email = resultSet.getString("email");
                String grupo = resultSet.getString("grupo");
                String Situacao = resultSet.getString("situacao");

                usuario usuario = new usuario();
                usuario.setNome(nome);
                usuario.setCpf(cpf);
                usuario.setEmail(email);
                usuario.setGrupo(grupo);
                usuario.setSituacao(Situacao);

                usuarios.add(usuario);


            }

            System.out.println("Sucesso na consulta");

            connection.close();

            return usuarios;
        } catch (SQLException e) {
            System.out.println("Falha na conexão com o banco de dados: " + e.getMessage());
            return Collections.emptyList();
        }
    }

}
