    package br.com.lojaesporte2.dao;

    import org.mindrot.jbcrypt.BCrypt;

    import java.sql.Connection;
    import java.sql.DriverManager;
    import java.sql.PreparedStatement;
    import java.sql.SQLException;



    public class Alteracao {

        public boolean atualizarUsuario(String nome, String cpf, String senha,int usuarioId) {

            String senhaCriptografa = criptografarSenha(senha);

            String SQL = "UPDATE USUARIO SET NOME = ?, SENHA = ?,CPF=? WHERE ID = ?";

            try {
                Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
                PreparedStatement preparedStatement = connection.prepareStatement(SQL);

                preparedStatement.setString(1, nome);
                preparedStatement.setString(2, senhaCriptografa);
                preparedStatement.setString(3, cpf);
                preparedStatement.setInt(4,usuarioId);

                int linhasAfetadas = preparedStatement.executeUpdate();

                if (linhasAfetadas > 0) {
                    System.out.println("Usuário atualizado com sucesso");
                    return true;
                } else {
                    System.out.println("Nenhum usuário atualizado");
                    return false;
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                return false;
            }
        }

        private String criptografarSenha(String senha){
            String salt  = BCrypt.gensalt();
            return BCrypt.hashpw(senha ,salt);
        }
    }
