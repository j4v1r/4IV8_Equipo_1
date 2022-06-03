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
public class MCostoIngrediente {
    
    private int id_costoingrediente, id_unidadmedidad, id_ingrediente;
    private float precio_unitario;
    
    public MCostoIngrediente(){
        
    }

    public int getId_costoingrediente() {
        return id_costoingrediente;
    }

    public void setId_costoingrediente(int id_costoingrediente) {
        this.id_costoingrediente = id_costoingrediente;
    }

    public int getId_unidadmedidad() {
        return id_unidadmedidad;
    }

    public void setId_unidadmedidad(int id_unidadmedidad) {
        this.id_unidadmedidad = id_unidadmedidad;
    }

    public int getId_ingrediente() {
        return id_ingrediente;
    }

    public void setId_ingrediente(int id_ingrediente) {
        this.id_ingrediente = id_ingrediente;
    }

    public float getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(float precio_unitario) {
        this.precio_unitario = precio_unitario;
    }
    
    
            
    
}
