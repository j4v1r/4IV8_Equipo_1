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
public class MInventario {
    
    private int id_inventario, id_ingrediente, id_unidadmedida;
    private float cantidad_inventario;
    private String fecha_inventario, nombre_unidad, nombre_ingrediente;
    
    public MInventario(){
        
    }
    
    public int getId_inventario() {
        return id_inventario;
    }

    public void setId_inventario(int id_inventario) {
        this.id_inventario = id_inventario;
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

    public float getCantidad_inventario() {
        return cantidad_inventario;
    }

    public void setCantidad_inventario(float cantidad_inventario) {
        this.cantidad_inventario = cantidad_inventario;
    }

    public String getFecha_inventario() {
        return fecha_inventario;
    }

    public void setFecha_inventario(String fecha_inventario) {
        this.fecha_inventario = fecha_inventario;
    }

    public String getNombre_unidad() {
        return nombre_unidad;
    }

    public void setNombre_unidad(String nombre_unidad) {
        this.nombre_unidad = nombre_unidad;
    }

    public String getNombre_ingrediente() {
        return nombre_ingrediente;
    }

    public void setNombre_ingrediente(String nombre_ingrediente) {
        this.nombre_ingrediente = nombre_ingrediente;
    }
    
    
    
    
    
}
