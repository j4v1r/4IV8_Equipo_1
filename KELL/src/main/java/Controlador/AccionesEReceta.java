/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.*;
import Modelo.EReceta;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesEReceta {
    
    public static int registrarEReceta(EReceta e){
        
        int estatus=0;
                
        try{
            
            Connection con = Conexion.getConection();
        
            String q = "insert into ereceta (nombre_receta, cantidad_receta, id_unidadmedida)"
                    + "values (?, ?, ?)";


            PreparedStatement ps = con.prepareStatement(q);


            ps.setString(1, e.getNombre_receta());
            ps.setFloat(2, e.getCantidad_receta());
            ps.setInt(3, e.getId_unidadmedida());

            estatus = ps.executeUpdate();

            System.out.println("Registro Exitoso de EReceta");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar en EReceta");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
            
    }
    
    //Consulta de todas las erecetas
    public static List<EReceta> getAllEReceta(){
        //Declaración Array List
        List<EReceta> lista = new ArrayList<EReceta>();
        
        try{
            //Conexión BD
            Connection con = Conexion.getConection();
            
            //Consulta
            String q = "select * from erecetaUnidad";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //Creación obejto ereceta
                EReceta e = new EReceta();
                e.setId_ereceta(rs.getInt(1));
                e.setNombre_receta(rs.getString(2));
                e.setCantidad_receta(rs.getFloat(3));
                e.setId_unidadmedida(rs.getInt(4));
                e.setCosto_ereceta(rs.getFloat(5));
                e.setNombre_unidad(rs.getString(6));
                lista.add(e);
            }
            
            System.out.println("Se consulto ereceta");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar ereceta");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    public static int eliminarEReceta(int id_ereceta){
        //Estado de la query, se elimino la ereceta o no
        int estatus = 0;
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "delete from ereceta where id_ereceta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_ereceta);
            
            estatus = ps.executeUpdate();
            
            
            
            System.out.println("Se elimino la ereceta");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo elimnar la ereceta");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    
    //buscar empleado por id
    public static EReceta buscarERecetaID(int id_ereceta){
        //donde se crea el objeto del empleado
        EReceta e = new EReceta();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select nombre_receta, id_ereceta from ereceta where id_ereceta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_ereceta);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
         
                e.setNombre_receta(rs.getString(1));
                e.setId_ereceta(rs.getInt(2));
            }
            
            System.out.println("Se busco el id_ereceta");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al id_ereceta");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    public static EReceta buscarERecetaAll(int id_ereceta){
        //donde se crea el objeto del empleado
        EReceta e = new EReceta();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from erecetaUnidad where id_ereceta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_ereceta);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
         
                e.setId_ereceta(rs.getInt(1));
                e.setNombre_receta(rs.getString(2));
                e.setCantidad_receta(rs.getFloat(3));
                e.setId_unidadmedida(rs.getInt(4));
                e.setCosto_ereceta(rs.getFloat(5));
                e.setNombre_unidad(rs.getString(6));
            }
            
            System.out.println("Se busco el id_ereceta");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al id_ereceta");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    public static int actualizarEReceta(EReceta e){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "update ereceta set nombre_receta=?, cantidad_receta=?, id_unidadmedida=? where id_ereceta=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getNombre_receta());
            ps.setFloat(2, e.getCantidad_receta());
            ps.setInt(3, e.getId_unidadmedida());
            ps.setInt(4, e.getId_ereceta());
            
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
