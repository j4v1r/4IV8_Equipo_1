/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Rogelio Colunga R
 */
public class MArticulo {
    
    private int id_articulo;
    private float costo_marticulo, precio_venta, ganacia_articulo;
    private String nombre_articulo;
    
    public MArticulo(){
        
    }

    public int getId_articulo() {
        return id_articulo;
    }

    public void setId_articulo(int id_articulo) {
        this.id_articulo = id_articulo;
    }

    public float getCosto_marticulo() {
        return costo_marticulo;
    }

    public void setCosto_marticulo(float costo_marticulo) {
        this.costo_marticulo = costo_marticulo;
    }

    public float getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(float precio_venta) {
        this.precio_venta = precio_venta;
    }

    public String getNombre_articulo() {
        return nombre_articulo;
    }

    public void setNombre_articulo(String nombre_articulo) {
        this.nombre_articulo = nombre_articulo;
    }

    public float getGanacia_articulo() {
        return ganacia_articulo;
    }

    public void setGanacia_articulo(float ganacia_articulo) {
        this.ganacia_articulo = ganacia_articulo;
    }
    
    
    
}
