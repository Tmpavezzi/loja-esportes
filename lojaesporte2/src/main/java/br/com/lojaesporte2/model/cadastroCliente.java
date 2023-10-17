package br.com.lojaesporte2.model;

import java.util.List;

public class cadastroCliente {
    private int id;
    private String nome;
    private String cpf;
    private String dataNascimento;
    private String genero;
    private String email;
    private String cep;
    private String enderecoFaturamento;
    private List<String> enderecosEntrega;
    private String senha;

    public cadastroCliente(){
    }
    public cadastroCliente(int id, String nome, String cpf, String dataNascimento, String genero, String email,
                           String cep, String enderecoFaturamento, List<String> enderecosEntrega, String senha) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.dataNascimento = dataNascimento;
        this.genero = genero;
        this.email = email;
        this.cep = cep;
        this.enderecoFaturamento = enderecoFaturamento;
        this.enderecosEntrega = enderecosEntrega;
        this.senha = senha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getEnderecoFaturamento() {
        return enderecoFaturamento;
    }

    public void setEnderecoFaturamento(String enderecoFaturamento) {
        this.enderecoFaturamento = enderecoFaturamento;
    }

    public List<String> getEnderecosEntrega() {
        return enderecosEntrega;
    }

    public void setEnderecosEntrega(List<String> enderecosEntrega) {
        this.enderecosEntrega = enderecosEntrega;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
