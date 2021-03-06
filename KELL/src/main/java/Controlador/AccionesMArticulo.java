/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.MArticulo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesMArticulo {
    
    public static int registrarMArticulo(MArticulo e){
        
        int estatus=0;
                
        try{
            
            Connection con = Conexion.getConection();
        
            String q = "insert into marticulo (nombre_articulo, precio_venta)"
                    + " values (?,?)";


            PreparedStatement ps = con.prepareStatement(q);


            ps.setString(1, e.getNombre_articulo());
            ps.setFloat(2, e.getPrecio_venta());

            estatus = ps.executeUpdate();

            System.out.println("Registro Exitoso en MArticulo");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar en MArticulo");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
            
    }
    
    //Consulta de todos los marticulos
    public static List<MArticulo> getAllMArticulo(){
        //Declaración Array List
        List<MArticulo> lista = new ArrayList<MArticulo>();
        
        try{
            //Conexión BD
            Connection con = Conexion.getConection();
            
            //Consulta
            String q = "select * from marticulo";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //Creación obejto marticulo
                MArticulo e = new MArticulo();
                e.setId_articulo(rs.getInt(1));
                e.setNombre_articulo(rs.getString(2));
                e.setCosto_marticulo(rs.getFloat(3));
                e.setPrecio_venta(rs.getFloat(4));
                e.setGanacia_articulo(rs.getFloat(5));
                lista.add(e);
            }
            
            System.out.println("Se consulto marticulo");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar marticulo");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    public static int eliminarMArticulo(int id_articulo){
        //Estado de la query, se elimino el marticulo o no
        int estatus = 0;
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "delete from marticulo where id_articulo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_articulo);
            
            estatus = ps.executeUpdate();
            
            
            System.out.println("Se elimino el marticulo");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo elimnar el marticulo");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    //Buscar el nombre e id del marticulo
    public static MArticulo buscarMArticuloID(int id_articulo){
        //Creación empleado de MArticulo
        MArticulo e = new MArticulo();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select nombre_articulo, id_articulo from marticulo where id_articulo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_articulo);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
         
                e.setNombre_articulo(rs.getString(1));
                e.setId_articulo(rs.getInt(2));
            }
            
            System.out.println("Se busco el id_martiuclo");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al id_marticulo");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    
    public static MArticulo buscarMArticuloAll(int id_articulo){
        //donde se crea el objeto del empleado
        MArticulo e = new MArticulo();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from marticulo where id_articulo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_articulo);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
         
                e.setId_articulo(rs.getInt(1));
                e.setNombre_articulo(rs.getString(2));
                e.setCosto_marticulo(rs.getFloat(3));
                e.setPrecio_venta(rs.getFloat(4));
                e.setGanacia_articulo(rs.getFloat(5));
            }
            
            System.out.println("Se busco el articulo");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar el articulo");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    public static int actualizarMArticulo(MArticulo e){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "update marticulo set nombre_articulo=?, precio_venta=? where id_articulo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getNombre_articulo());
            ps.setFloat(2, e.getPrecio_venta());
            ps.setInt(3, e.getId_articulo());
            
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
