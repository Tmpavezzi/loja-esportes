package br.com.lojaesporte2.model;

import java.util.ArrayList;
import java.util.List;

public class ImagenProduto {

   private int imagenId;
   private String nomeImagens;
   private byte[]imagen;

    private List<ImagenProduto> imagens = new ArrayList<>();


    private boolean principal;

    public ImagenProduto() {
    }

    public List<ImagenProduto> getImagens() {
        return imagens;
    }

    public void setImagens(List<ImagenProduto> imagens) {
        this.imagens = imagens;
    }

    public int getImagenId() {
        return imagenId;
    }

    public void setImagenId(int imagenId) {
        this.imagenId = imagenId;
    }

    public String getNomeImagens() {
        return nomeImagens;
    }

    public void setNomeImagens(String nomeImagens) {
        this.nomeImagens = nomeImagens;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public boolean isPrincipal() {
        return principal;
    }

    public void setPrincipal(boolean principal) {
        this.principal = principal;
    }
}