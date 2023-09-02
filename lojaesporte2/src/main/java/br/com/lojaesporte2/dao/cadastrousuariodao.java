package br.com.lojaesporte2.dao;

import br.com.lojaesporte2.model.cadastrodeusuario;

import java.sql.*;
public class cadastrousuariodao {

    public void altusers(cadastrodeusuario cadastrodeusuario){
        String sql = "UPDATE USUARIO SET NOME = ?, EMAIL = ?, SENHA = ?, GRUPO = ?, STATUS = ? WHERE id = ?";


        try {
            Connection connection= DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");
            System.out.println("Sucessso in databese connection");

            PreparedStatement preparedStatement=connection.prepareStatement(sql);

            preparedStatement.setString(1,cadastrodeusuario.getNome());
            preparedStatement.setString(2,cadastrodeusuario.getEmail());
            preparedStatement.setString(3,cadastrodeusuario.getSenha());
            preparedStatement.setString(4,cadastrodeusuario.getGrupo());
            preparedStatement.setString(5,cadastrodeusuario.getStatus());

            preparedStatement.execute();

            System.out.println("Sucesso na insert");

            connection.close();

        }catch (Exception e){
            System.out.println(e.getMessage());
        }

    }

}
