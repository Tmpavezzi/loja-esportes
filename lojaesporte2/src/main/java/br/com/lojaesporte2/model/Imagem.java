package br.com.lojaesporte2.model;

public class Imagem {
    private int imagemId;
    private int produtoId;
    private String nomeImagem;
    private byte[] imagem;
    private boolean principal;



    public int getImagemId() {
        return imagemId;
    }

    public void setImagemId(int imagemId) {
        this.imagemId = imagemId;
    }

    public int getProdutoId() {
        return produtoId;
    }

    public void setProdutoId(int produtoId) {
        this.produtoId = produtoId;
    }

    public String getNomeImagem() {
        return nomeImagem;
    }

    public void setNomeImagem(String nomeImagem) {
        this.nomeImagem = nomeImagem;
    }

    public byte[] getImagem() {
        return imagem;
    }

    public void setImagem(byte[] imagem) {
        this.imagem = imagem;
    }

    public boolean isPrincipal() {
        return principal;
    }

    public void setPrincipal(boolean principal) {
        this.principal = principal;
    }
}
