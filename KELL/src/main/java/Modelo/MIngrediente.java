/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author diazt
 */
public class MIngrediente {
    
    private int id_ingrediente, id_unidadmedida;
    private float precio_ingrediente, cantidad_compra;
    private String nombre_ingrediente, nombre_unidad;
    
    
    public MIngrediente(){
    
    }
    
    

    public int getId_ingrediente() {
        return id_ingrediente;
    }

    public void setId_ingrediente(int id_ingrediente) {
        this.id_ingrediente = id_ingrediente;
    }

    public int getId_unidadmedida() {
        return id_unidadmedida;
    }

    public void setId_unidadmedida(int id_unidadmedida) {
        this.id_unidadmedida = id_unidadmedida;
    }

    public float getPrecio_ingrediente() {
        return precio_ingrediente;
    }

    public void setPrecio_ingrediente(float precio_ingrediente) {
        this.precio_ingrediente = precio_ingrediente;
    }

    public float getCantidad_compra() {
        return cantidad_compra;
    }

    public void setCantidad_compra(float cantidad_compra) {
        this.cantidad_compra = cantidad_compra;
    }

    public String getNombre_ingrediente() {
        return nombre_ingrediente;
    }

    public void setNombre_ingrediente(String nombre_ingrediente) {
        this.nombre_ingrediente = nombre_ingrediente;
    }

    public String getNombre_unidad() {
        return nombre_unidad;
    }

    public void setNombre_unidad(String nombre_unidad) {
        this.nombre_unidad = nombre_unidad;
    }
    
    
    
}
