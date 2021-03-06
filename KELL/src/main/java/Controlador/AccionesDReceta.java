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
    
    public static int eliminarDReceta(int id_dreceta){
        //Estado de la query, se elimino la dreceta o no
        int estatus = 0;
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "delete from dreceta where id_dreceta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_dreceta);
            
            estatus = ps.executeUpdate();
            
            
            
            System.out.println("Se elimino la dreceta");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo elimnar la dreceta");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static DReceta buscarDRecetaAll(int id_dreceta){
        //donde se crea el objeto del empleado
        DReceta e = new DReceta();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from muestradreceta where id_dreceta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_dreceta);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
         
                e.setId_dreceta(rs.getInt(1));
                e.setId_ingrediente(rs.getInt(2));
                e.setId_ereceta(rs.getInt(3));
                e.setId_unidadmedida(rs.getInt(4));
                e.setCantidad_ingrediente(rs.getFloat(5));
                e.setCosto_dreceta(rs.getFloat(6));
                e.setNombre_ingrediente(rs.getString(7));
                e.setNombre_unidad(rs.getString(8));
            }
            
            System.out.println("Se busco el id_dreceta");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al id_dreceta");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    public static int actualizarDReceta(DReceta e){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "update dreceta set id_ingrediente=?, id_unidadmedida=?, cantidad_dingrediente=? where id_dreceta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, e.getId_ingrediente());
            ps.setInt(2, e.getId_unidadmedida());
            ps.setFloat(3, e.getCantidad_ingrediente());
            ps.setInt(4, e.getId_dreceta());
            
            estatus = ps.executeUpdate();
            
            
            
            System.out.println("Se actualizo el ingrediente");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo actualizar el ingrediente");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
}
