/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.DArticulo;
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
public class AccionesDArticulo {
    
    
    public static int registrarDArticulo(DArticulo e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into darticulo (id_articulo, id_ereceta, cantidad_articulo)"
                + "values (?,?,?);";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        ps.setInt(1, e.getId_articulo());
        ps.setInt(2, e.getId_ereceta());
        ps.setFloat(3, e.getCantidad_articulo());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso en dmenu");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar en dmenu");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    public static List<DArticulo> getAllDArticulo(int id_articulo){
        //Declaración ArrayList
        List<DArticulo> lista = new ArrayList<DArticulo>();
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "select * from darticulomuestra where id_articulo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_articulo);
            
            ResultSet rs = ps.executeQuery();
            
            //Recorre el arrego de la tabla MIngrediente
            while(rs.next()){
                //Se crea objeto del ingrediente
                DArticulo u = new DArticulo();
                u.setId_darticulo(rs.getInt(1));
                u.setId_ereceta(rs.getInt(2));
                u.setId_articulo(rs.getInt(3));
                u.setCantidad_articulo(rs.getFloat(4));
                u.setCosto_darticulo(rs.getFloat(5));
                u.setNombre_articulo(rs.getString(6));
                u.setNombre_receta(rs.getString(7));
                lista.add(u);
            }
            
            System.out.println("Se consulto el dmenu");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar la dmenu");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    public static int eliminarDArticulo(int id_darticulo){
        //Estado de la query, se elimino el darticulo o no
        int estatus = 0;
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "delete from darticulo where id_darticulo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_darticulo);
            
            estatus = ps.executeUpdate();
            
            
            
            System.out.println("Se elimino la darticulo");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo elimnar la darticulo");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static DArticulo buscarDArticuloAll(int id_darticulo){
        //donde se crea el objeto del empleado
        DArticulo e = new DArticulo();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from darticulomuestra where id_darticulo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_darticulo);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
         
                e.setId_darticulo(rs.getInt(1));
                e.setId_ereceta(rs.getInt(2));
                e.setId_articulo(rs.getInt(3));
                e.setCantidad_articulo(rs.getFloat(4));
                e.setCosto_darticulo(rs.getFloat(5));
                e.setNombre_articulo(rs.getString(6));
                e.setNombre_receta(rs.getString(7));
            }
            
            System.out.println("Se busco el id_dreceta");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al id_dreceta");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    public static int actualizarDArticulo(DArticulo e){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "update darticulo set id_ereceta=?, cantidad_articulo=? where id_darticulo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, e.getId_ereceta());
            ps.setFloat(2, e.getCantidad_articulo());
            ps.setInt(3, e.getId_darticulo());
            
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
