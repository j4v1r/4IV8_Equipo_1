/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Modelo.MIngrediente;

/**
 *
 * @author Equipo 1
 */
public class AccionesIngrediente {
    
    
   //Registro Ingrediente
    
    public static int registrarIngrediente(MIngrediente e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into mingrediente (nombre_ingrediente, precio_ingrediente, cantidad_compra, id_unidadmedida)"
                + "values (?, ?, ?, ?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        
        ps.setString(1, e.getNombre_ingrediente());
        ps.setFloat(2, e.getPrecio_ingrediente());
        ps.setFloat(3, e.getCantidad_compra());
        ps.setInt(4, e.getId_unidadmedida());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar el ingrediente");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    
    //Consulta de todos los ingredientes
    public static List<MIngrediente> getAllIngredientes(){
        //Declaración ArrayList
        List<MIngrediente> lista = new ArrayList<MIngrediente>();
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "select * from ingredienteMuestra";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            //Recorre el arrego de la tabla MIngrediente
            while(rs.next()){
                //Se crea objeto del ingrediente
                MIngrediente e = new MIngrediente();
                e.setId_ingrediente(rs.getInt(1));
                e.setNombre_ingrediente(rs.getString(2));
                e.setPrecio_ingrediente(rs.getFloat(3));
                e.setCantidad_compra(rs.getFloat(4));
                e.setId_unidadmedida(rs.getInt(5));
                e.setNombre_unidad(rs.getString(6));
                lista.add(e);
            }
            
            System.out.println("Se consulto el ingrediente");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    //buscar empleado por id
    public static MIngrediente buscarIngredienteID(int id_ingrediente){
        //donde se crea el objeto del empleado
        MIngrediente e = new MIngrediente();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from ingredienteMuestra where id_ingrediente=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_ingrediente);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                e.setId_ingrediente(rs.getInt(1));
                e.setNombre_ingrediente(rs.getString(2));
                e.setPrecio_ingrediente(rs.getFloat(3));
                e.setCantidad_compra(rs.getFloat(4));
                e.setId_unidadmedida(rs.getInt(5));
                e.setNombre_unidad(rs.getString(6));
                
            }
            
            System.out.println("Se busco el ingrediente");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
    //borrar empleado
    public static int eliminarIngrediente(int id_ingrediente){
        
        //Estado de la query, se elimino el ingrediente o no
        int estatus = 0;
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "delete from mingrediente where id_ingrediente=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_ingrediente);
            
            estatus = ps.executeUpdate();
            
            
            
            System.out.println("Se elimino el ingrediente");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo elimnar al ingrediente");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
        
       
}
    

