package br.com.lojaesporte2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class loginusedao {

    public boolean verifyUser(String Email, String Senha ){
        String SQL = "SELECT * FROM USUARIO WHERE EMAIL=?";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test","sa","sa");
            System.out.println("Sucesso in connection");

            PreparedStatement preparedStatement= connection.prepareStatement(SQL);
            preparedStatement.setString(1,Email);


            ResultSet rs=preparedStatement.executeQuery();
            System.out.println("Sucesso in select email");


            while (rs.next()){
                String senha =rs.getString("senha");
                if(senha.equals(Senha)){
                    return true;
                }
            }
            connection.close();
            return false;

        }catch (Exception e){
            System.out.println("Fail in Connection");
            System.out.println(e.getMessage());
            return  false ;
        }
    }
}
