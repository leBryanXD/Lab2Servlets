package com.mycompany.bryanlab;
public class Inventario {
    private static int contadorId = 0;
    private int idInventario;
    private String fechaInventario;
    private String productoNombre;
    private int idVenta;

    public Inventario( String fechaInventario, String productoNombre, int idVenta) {
        this.idInventario = contadorId++;
        this.fechaInventario = fechaInventario;
        this.productoNombre = productoNombre;
        this.idVenta = idVenta;
    }

    // Getters y Setters
    public int getIdInventario() {
        return idInventario;
    }

    public void setIdInventario(int idInventario) {
        this.idInventario = idInventario;
    }

    public String getFechaInventario() {
        return fechaInventario;
    }

    public void setFechaInventario(String fechaInventario) {
        this.fechaInventario = fechaInventario;
    }

    public String getProductoNombre() {
        return productoNombre;
    }

    public void setProductoNombre(String productoNombre) {
        this.productoNombre = productoNombre;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }
}

