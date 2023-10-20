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

        public boolean atualizarPordutoComImagem(int produtoId, String nome, int quantidade, double avaliacao, String descricao, double preco, byte[] imagemBytes){
           Connection connection= null;
            try{
                connection=DriverManager.getConnection("jdbc:h2:~/test","sa","sa");
                connection.setAutoCommit(false);

                String sqlPorduto = "UPDATE PRODUTO SET NOME = ?, AVALIACAO = ?, DESCRICAO = ?, PRECO = ?, ESTOQUE = ? WHERE ID = ?";
                PreparedStatement preparedStatementProduto= connection.prepareStatement(sqlPorduto);

                preparedStatementProduto.setString(1,nome);
                preparedStatementProduto.setDouble(2,avaliacao);
                preparedStatementProduto.setString(3,descricao);
                preparedStatementProduto.setDouble(4,preco);
                preparedStatementProduto.setInt(5,quantidade);
                preparedStatementProduto.setInt(6,produtoId);

                int linhasAfetadasPorduto=preparedStatementProduto.executeUpdate();

                String sqlImagem ="UPDATE IMAGEM SET IMAGEM = ? WHERE PRODUTO_ID = ?";
                PreparedStatement preparedStatementImagen = connection.prepareStatement(sqlImagem);

                preparedStatementImagen.setBytes(1,imagemBytes);
                preparedStatementImagen.setInt(2,produtoId);

                int linhasAfetadasImagen = preparedStatementImagen.executeUpdate();

                if(linhasAfetadasImagen>0 && linhasAfetadasPorduto>0){
                    connection.commit();
                    System.out.println("Produto e imagem atualizados com sucesso");
                    return true;
                }else {
                    connection.rollback();
                    System.out.println("Nenhum produto ou imagem atualizado");
                    return false;
                }

            }catch (SQLException e){
                if(connection!=null){
                    try{
                        connection.rollback();
                    }catch (SQLException ex){
                        System.out.println("Erro ao reverter a transação: " + ex.getMessage());
                    }
                }
                System.out.println("Erro ao atualizar produto ou imagem: " + e.getMessage());
                return false;
            } finally {
                if(connection != null){
                    try{
                        connection.close();
                    }catch (SQLException e){
                        System.out.println("Erro ao fechar a conexão: " + e.getMessage());
                    }
                }
            }
        }
    }
