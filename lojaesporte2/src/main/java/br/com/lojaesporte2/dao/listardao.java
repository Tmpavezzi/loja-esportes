package br.com.lojaesporte2.dao;

import br.com.lojaesporte2.model.listar;

import java.sql.*;
public class listardao {

    public void listarusuarios(listar listar){
        String sql = "SELECT ID, NOME, CPF, EMAIL, GRUPO, SITUACAO FROM USUARIO  ";


        try {
            Connection connection= DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");
            System.out.println("Sucessso in databese connection");

            PreparedStatement preparedStatement=connection.prepareStatement(sql);

            preparedStatement.setString(1,listar.getId());
            preparedStatement.setString(2,listar.getNome());
            preparedStatement.setString(3,listar.getCpf());
            preparedStatement.setString(4,listar.getEmail());
            preparedStatement.setString(5,listar.getGrupo());
            preparedStatement.setString(5,listar.getStatus());

            preparedStatement.execute();

            System.out.println("Sucesso na consulta");

            connection.close();

        }catch (Exception e){
            System.out.println(e.getMessage());
        }

    }

}
