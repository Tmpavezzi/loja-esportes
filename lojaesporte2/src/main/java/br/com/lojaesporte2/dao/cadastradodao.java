package br.com.lojaesporte2.dao;


import br.com.lojaesporte2.model.usuario;


import org.mindrot.jbcrypt.BCrypt;
import java.sql.*;

public class cadastradodao {

   public void cerateusuario(usuario usuario){
    String SQL="INSERT INTO USUARIO (NOME,CPF,EMAIL,SENHA,GRUPO,SITUACAO) VALUES (?,?,?,?,?,?)";


    try {
        Connection connection= DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");
        System.out.println("Sucessso in databese connection");

        String senhaCriptografada = criptografarSenha(usuario.getSenha());

        PreparedStatement preparedStatement=connection.prepareStatement(SQL);

        preparedStatement.setString(1,usuario.getNome());
        preparedStatement.setString(2,usuario.getCpf());
        preparedStatement.setString(3,usuario.getEmail());
        preparedStatement.setString(4,senhaCriptografada);
        preparedStatement.setString(5,usuario.getGrupo());
        preparedStatement.setString(6,usuario.getSituacao());

        preparedStatement.execute();

        System.out.println("Sucesso na insert");

        connection.close();

    }catch (Exception e){
        System.out.println(e.getMessage());
    }

   }

   private String criptografarSenha (String Senha){
       String  salt =BCrypt.gensalt();
       String senhaCriptografada = BCrypt.hashpw(Senha,salt);
       return senhaCriptografada;
   }


   public boolean verificacpf(String cpf){
       String SQL = "SELECT COUNT(*) FROM USUARIO WHERE CPF = ?";

       try{
           Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");
           PreparedStatement preparedStatement= connection.prepareStatement(SQL);
           preparedStatement.setString(1,cpf);

           ResultSet resultSet = preparedStatement.executeQuery();

           if(resultSet.next()){
               int count= resultSet.getInt(1);
               return count>0;
           }
       }catch (SQLException e){
           e.printStackTrace();
       }
       return false;
   }
}
