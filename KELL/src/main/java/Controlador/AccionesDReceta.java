/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.DReceta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesDReceta {
    
    public static int registrarDReceta(DReceta e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into dreceta (id_ingrediente, id_ereceta, id_unidadmedida, cantidad_dingrediente)"
                + "values (?,?,?,?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        ps.setInt(1, e.getId_ingrediente());
        ps.setInt(2, e.getId_ereceta());
        ps.setInt(3, e.getId_unidadmedida());
        ps.setFloat(4, e.getCantidad_ingrediente());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso en dreceta");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar en dreceta");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    
    public static List<DReceta> getAllDReceta(int id_ereceta){
        //Declaración ArrayList
        List<DReceta> lista = new ArrayList<DReceta>();
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "select * from muestradreceta where id_ereceta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_ereceta);
            
            ResultSet rs = ps.executeQuery();
            
            //Recorre el arrego de la tabla MIngrediente
            while(rs.next()){
                //Se crea objeto del ingrediente
                DReceta u = new DReceta();
                u.setId_dreceta(rs.getInt(1));
                u.setId_ingrediente(rs.getInt(2));
                u.setId_ereceta(rs.getInt(3));
                u.setId_unidadmedida(rs.getInt(4));
                u.setCantidad_ingrediente(rs.getFloat(5));
                u.setCosto_dreceta(rs.getFloat(6));
                u.setNombre_ingrediente(rs.getString(7));
                u.setNombre_unidad(rs.getString(8));
                lista.add(u);
            }
            
            System.out.println("Se consulto la dreceta");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar la dreceta");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    
}
