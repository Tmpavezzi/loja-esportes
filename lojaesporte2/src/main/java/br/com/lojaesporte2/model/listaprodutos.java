package br.com.lojaesporte2.model;

public class listaprodutos {

    private String id;
    private String desc;
    private String quantidade;
    private double valor;
    private boolean ativo;

    private String statusformatado;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(String quantidade) {
        this.quantidade = quantidade;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }

    public String getStatusformatado() {
        return statusformatado;
    }

    public void setStatusformatado(String statusformatado) {
        this.statusformatado = statusformatado;
    }

}