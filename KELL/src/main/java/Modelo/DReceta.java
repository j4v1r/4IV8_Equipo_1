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
public class DReceta {
    
    private int id_dreceta, id_ingrediente,id_ereceta, id_unidadmedida;
    private float cantidad_ingrediente, costo_dreceta;
    
    public DReceta(){
        
    }

    public int getId_dreceta() {
        return id_dreceta;
    }

    public void setId_dreceta(int id_dreceta) {
        this.id_dreceta = id_dreceta;
    }

    public int getId_ingrediente() {
        return id_ingrediente;
    }

    public void setId_ingrediente(int id_ingrediente) {
        this.id_ingrediente = id_ingrediente;
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

    public float getCantidad_ingrediente() {
        return cantidad_ingrediente;
    }

    public void setCantidad_ingrediente(float cantidad_ingrediente) {
        this.cantidad_ingrediente = cantidad_ingrediente;
    }

    public float getCosto_dreceta() {
        return costo_dreceta;
    }

    public void setCosto_dreceta(float costo_dreceta) {
        this.costo_dreceta = costo_dreceta;
    }
     
}
