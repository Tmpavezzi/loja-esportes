package br.com.lojaesporte2.dao;


import br.com.lojaesporte2.model.ImagenProduto;
import br.com.lojaesporte2.model.produto;
import br.com.lojaesporte2.model.usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.List;


public class listardao {

    public List<usuario> listarUsuarios() {

        String sql = "SELECT id,nome, cpf, email, grupo, situacao FROM USUARIO ";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("Sucesso na conexão com o banco de dados");

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            List<usuario> usuarios = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nome = resultSet.getString("nome");
                String cpf = resultSet.getString("cpf");
                String email = resultSet.getString("email");
                String grupo = resultSet.getString("grupo");
                String situacao = resultSet.getString("situacao");

                usuario usuario = new usuario();
                usuario.setId(id);
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

    public boolean atulizarstatus(String cpf,String novaSituacao){

        String SQL = "UPDATE USUARIO SET SITUACAO = ? WHERE CPF = ?";


        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test","sa","sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            System.out.println("Sucesso na conexão");

            preparedStatement.setString(1,novaSituacao);
            preparedStatement.setString(2,cpf);

            int linhasAfetadas = preparedStatement.executeUpdate();

            if (linhasAfetadas>0){
                System.out.println("usuario atualizado com sucesso");
                return  true;
            }else{
                System.out.println("Nenhum usuario atualizado");
                return false;
            }
        }catch (SQLException e){
            System.out.println("Falha na atualização" + e.getMessage());
            return false;
        }
    }

    public byte[] recuperarImagemPorId( int imagemId) {
        String sql  = "SELECT IMAGEM FROM IMAGEM WHERE IMAGEM_ID = ?";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test","sa","sa");
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            System.out.println("Sucesso na conexão");

            preparedStatement.setInt(1,imagemId);
            ResultSet resultSet= preparedStatement.executeQuery();

            if(resultSet.next()){
                return resultSet.getBytes("IMAGEM");
            }

        }catch (SQLException e){
            System.out.println("Falha na recuperação da imagem do banco de dados: " + e.getMessage());
        }
        return null;
        }


    public List<produto>listarProdutoPorNome(String nome){
        List<produto> produtos = new ArrayList<>();
        String SQL = "SELECT p.ID, p.NOME, p.AVALIACAO, p.DESCRICAO, p.PRECO, p.ESTOQUE, i.IMAGEM_ID, i.NOME_IMAGEM, i.IMAGEM, i.PRINCIPAL " +
                "FROM PRODUTO p " +
                "LEFT JOIN IMAGEM i ON p.ID = i.PRODUTO_ID " +
                "WHERE p.NOME LIKE ?";

          try{
              Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
              System.out.println("Sucesso na conexão com o banco de dados");

              PreparedStatement preparedStatement = connection.prepareStatement(SQL);
              preparedStatement.setString(1,"%" + nome +"%");
              ResultSet resultSet = preparedStatement.executeQuery();

              while (resultSet.next()){
                  int produtoId = resultSet.getInt("ID");
                  String nomeProduto = resultSet.getString("NOME");
                  double avaliacao = resultSet.getDouble("AVALIACAO");
                  String descricao = resultSet.getString("DESCRICAO");
                  double preco = resultSet.getDouble("PRECO");
                  int estoque = resultSet.getInt("ESTOQUE");


                  produto produto = new produto();
                  produto.setID(produtoId);
                  produto.setNome(nomeProduto);
                  produto.setAvaliacao(avaliacao);
                  produto.setDescricao(descricao);
                  produto.setPreco(preco);
                  produto.setEstoque(estoque);

                  produtos.add(produto);

                  byte[] imagemBytes = resultSet.getBytes("IMAGEM");
                  String imagemBases64 = Base64.getEncoder().encodeToString(imagemBytes);
                  produto.setImagemBase64(imagemBases64);
                  produtos.add(produto);
              }
              System.out.println("Sucesso na consulta");

              connection.close();
          }catch (SQLException e){
              e.printStackTrace();
          }

          return produtos;


    }
}
