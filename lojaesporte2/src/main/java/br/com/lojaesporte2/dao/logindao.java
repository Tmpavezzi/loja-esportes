package br.com.lojaesporte2.dao;

import org.mindrot.jbcrypt.BCrypt;

import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import br.com.lojaesporte2.model.login;

public class logindao {



    public boolean verifyCreddential(String Email, String Senha ){
        String SQL = "SELECT * FROM USUARIO  WHERE EMAIL=?";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test","sa","sa");
            System.out.println("Sucesso in connection");


            PreparedStatement preparedStatement= connection.prepareStatement(SQL);

            preparedStatement.setString(1,Email);
            System.out.println("email usando"+ Email);




            ResultSet rs=preparedStatement.executeQuery();
            System.out.println("Sucesso in select email");


            while (rs.next()){
                String senhaHash =rs.getString("senha");
                if(senhaHash !=null&&senhaHash.startsWith("$2a$")){
                    if(BCrypt.checkpw(Senha,senhaHash)){
                        return true;
                    }

                }else {
                    String novoHashedSenha = BCrypt.hashpw(Senha, BCrypt.gensalt());

                    String updateSQL = "UPDATE USUARIO SET SENHA = ? WHERE EMAIL = ?";
                    PreparedStatement updateStatement = connection.prepareStatement(updateSQL);
                    updateStatement.setString(1, novoHashedSenha);
                    updateStatement.setString(2, Email);
                    updateStatement.executeUpdate();
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

    public String getUserType(String Email){
        String SQL = "SELECT GRUPO FROM USUARIO WHERE EMAIL=?";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1,Email);

            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                String userType=rs.getString("GRUPO");
                connection.close();
                return userType;
            }else {
                connection.close();
                return null;
            }
        }catch (Exception e){
            System.out.println("Fail in Connection");
            System.out.println(e.getMessage());
            return null;
        }
    }
}
