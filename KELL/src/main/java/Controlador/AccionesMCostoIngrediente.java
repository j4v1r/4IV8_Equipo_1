/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesMCostoIngrediente {
    
    public static int registrarGramo(MIngrediente e){
        
        int estatus=0;
        
        try{
            
        Connection con = Conexion.getConection();
        
        String q = "insert into mcostoingrediente (precio_unitario, id_unidadmedida, id_ingrediente)"
        +"values ((select precio_ingrediente from mingrediente where id_ingrediente=?)/(1000 * (select cantidad_compra from mingrediente where id_ingrediente=?)), ?, ?)";
            
            
            
        }
    return estatus;
}
