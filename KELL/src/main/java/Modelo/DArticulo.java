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
public class DArticulo {
    
    private int id_darticulo, id_ereceta, id_articulo;
    private float cantidad_articulo, costo_darticulo;
    private String nombre_receta, nombre_articulo;
    
    public DArticulo(){
        
    }
    
    public int getId_darticulo() {
        return id_darticulo;
    }

    public void setId_darticulo(int id_darticulo) {
        this.id_darticulo = id_darticulo;
    }

    public int getId_ereceta() {
        return id_ereceta;
    }

    public void setId_ereceta(int id_ereceta) {
        this.id_ereceta = id_ereceta;
    }

    public int getId_articulo() {
        return id_articulo;
    }

    public void setId_articulo(int id_articulo) {
        this.id_articulo = id_articulo;
    }

    public float getCantidad_articulo() {
        return cantidad_articulo;
    }

    public void setCantidad_articulo(float cantidad_articulo) {
        this.cantidad_articulo = cantidad_articulo;
    }

    public float getCosto_darticulo() {
        return costo_darticulo;
    }

    public void setCosto_darticulo(float costo_darticulo) {
        this.costo_darticulo = costo_darticulo;
    }

    public String getNombre_receta() {
        return nombre_receta;
    }

    public void setNombre_receta(String nombre_receta) {
        this.nombre_receta = nombre_receta;
    }

    public String getNombre_articulo() {
        return nombre_articulo;
    }

    public void setNombre_articulo(String nombre_articulo) {
        this.nombre_articulo = nombre_articulo;
    }
  
}
