package com.mycompany.bryanlab;

import java.util.ArrayList;
import java.util.List;

public class Venta {
    private static int contadorId = 0;
    private int idVenta;
    private String fechaVenta;
    private String nombreCliente;
    private List<Inventario> inventarios; // Relación con Inventarios

    public Venta(String fechaVenta, String nombreCliente) {
        this.idVenta = ++contadorId; // Incrementar y asignar nuevo ID
        this.fechaVenta = fechaVenta;
        this.nombreCliente = nombreCliente;
        this.inventarios = new ArrayList<>();
    }

    // Getters y Setters
    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(String fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public List<Inventario> getInventarios() {
        return inventarios;
    }

    // Método para agregar inventario a la venta
    public void agregarInventario(Inventario inventario) {
        this.inventarios.add(inventario);
    }
}


