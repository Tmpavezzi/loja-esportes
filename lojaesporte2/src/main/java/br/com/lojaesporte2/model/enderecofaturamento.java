package br.com.lojaesporte2.model;

public class enderecofaturamento {

    private String idcliente;
    private String cep;
    private String logradouto;
    private String  numero;
    private String complemento;
    private String bairro;
    private String cidade;
    private String uf ;

    public enderecofaturamento(String cep, String logradouto, String numero, String complemento, String bairro, String cidade, String uf) {
        this.cep = cep;
        this.logradouto = logradouto;
        this.numero = numero;
        this.complemento = complemento;
        this.bairro = bairro;
        this.cidade = cidade;
        this.uf = uf;
    }

    public String getIdcliente() {
        return idcliente;
    }

    public void setIdcliente(String idcliente) {
        this.idcliente = idcliente;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getLogradouto() {
        return logradouto;
    }

    public void setLogradouto(String logradouto) {
        this.logradouto = logradouto;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }
}
