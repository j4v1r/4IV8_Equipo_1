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
public class EReceta {
    
    private int id_ereceta, id_unidadmedida;
    private String nombre_receta, nombre_unidad;
    private float cantidad_receta, costo_ereceta;
    
    public EReceta(){
        
    }
    
    

    public int getId_ereceta() {
        return id_ereceta;
    }

    public void setId_ereceta(int id_ereceta) {
        this.id_ereceta = id_ereceta;
    }

    public int getId_unidadmedida() {
        return id_unidadmedida;
    }

    public void setId_unidadmedida(int id_unidadmedida) {
        this.id_unidadmedida = id_unidadmedida;
    }

    public String getNombre_receta() {
        return nombre_receta;
    }

    public void setNombre_receta(String nombre_receta) {
        this.nombre_receta = nombre_receta;
    }

    public float getCantidad_receta() {
        return cantidad_receta;
    }

    public void setCantidad_receta(float cantidad_receta) {
        this.cantidad_receta = cantidad_receta;
    }

    public float getCosto_ereceta() {
        return costo_ereceta;
    }

    public void setCosto_ereceta(float costo_ereceta) {
        this.costo_ereceta = costo_ereceta;
    }

    public String getNombre_unidad() {
        return nombre_unidad;
    }

    public void setNombre_unidad(String nombre_unidad) {
        this.nombre_unidad = nombre_unidad;
    }
    
    
    
}
