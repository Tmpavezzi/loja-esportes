package br.com.lojaesporte2.model;

import java.util.List;

public class produto {

    private int ID;
    private String nome;
    private double avaliacao;
    private String descricao;
    private double preco;
    private int estoque;

    private String  status;
    private List<ImagenProduto> imagens;
    private String imagemPrincipal;

    private String imagemBase64;

    public produto() {
    }

    public produto(int ID, String nome, double preco, String imagemBase64) {
        this.ID = ID;
        this.nome = nome;
        this.preco = preco;
        this.imagemBase64 = imagemBase64;
    }

    public String getImagemBase64() {
        return imagemBase64;
    }

    public void setImagemBase64(String imagemBase64) {
        this.imagemBase64 = imagemBase64;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getAvaliacao() {
        return avaliacao;
    }

    public void setAvaliacao(double avaliacao) {
        this.avaliacao = avaliacao;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getEstoque() {
        return estoque;
    }

    public void setEstoque(int estoque) {
        this.estoque = estoque;
    }

    public List<ImagenProduto> getImagens() {
        return imagens;
    }

    public void setImagens(List<ImagenProduto> imagens) {
        this.imagens = imagens;
    }

    public String getImagemPrincipal() {
        return imagemPrincipal;
    }

    public void setImagemPrincipal(String imagemPrincipal) {
        this.imagemPrincipal = imagemPrincipal;
    }


    @Override
    public String toString() {
        return "produto{" +
                "ID=" + ID +
                ", nome='" + nome + '\'' +
                ", avaliacao=" + avaliacao +
                ", descricao='" + descricao + '\'' +
                ", preco=" + preco +
                ", estoque=" + estoque +
                ", status='" + status + '\'' +
                ", imagens=" + imagens +
                ", imagemPrincipal='" + imagemPrincipal + '\'' +
                ", imagemBase64='" + imagemBase64 + '\'' +
                '}';
    }
}