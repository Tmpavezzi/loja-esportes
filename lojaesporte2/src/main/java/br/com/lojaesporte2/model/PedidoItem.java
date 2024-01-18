package br.com.lojaesporte2.model;
import java.math.BigDecimal;

public class PedidoItem {

    private int idPedidoItem;
    private int idPedido;
    private int idProduto;
    private int quantidade;
    private BigDecimal valorUnitario;

    public PedidoItem(int i, int i1, double preco) {
        // Construtor padrão
    }

    public PedidoItem(int idPedido, int idProduto, int quantidade, BigDecimal valorUnitario) {
        this.idPedido = idPedido;
        this.idProduto = idProduto;
        this.quantidade = quantidade;
        this.valorUnitario = valorUnitario;
    }

    public int getIdPedidoItem() {
        return idPedidoItem;
    }

    public void setIdPedidoItem(int idPedidoItem) {
        this.idPedidoItem = idPedidoItem;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public BigDecimal getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(BigDecimal valorUnitario) {
        this.valorUnitario = valorUnitario;
    }
}
