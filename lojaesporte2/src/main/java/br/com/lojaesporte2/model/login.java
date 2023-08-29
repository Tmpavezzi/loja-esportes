package br.com.lojaesporte2.model;

public class login {

    private String emial;

    private String senha ;

    public login(String emial, String senha) {
        this.emial = emial;
        this.senha = senha;
    }

    public String getEmial() {
        return emial;
    }

    public void setEmial(String emial) {
        this.emial = emial;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
