/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.MPersona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesMPersona {
    
    public static List<MPersona> getAllEmpleados(){
        //Declaración ArrayList
        List<MPersona> lista = new ArrayList<MPersona>();
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "select * from empleadosmuestra";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            //Recorre el arrego de la tabla MIngrediente
            while(rs.next()){
                //Se crea objeto del ingrediente
                MPersona e = new MPersona();
                e.setId_persona(rs.getInt(1));
                e.setNombre_persona(rs.getString(2));
                e.setAppat(rs.getString(3));
                e.setApmat(rs.getString(4));
                e.setTelefono(rs.getInt(5));
                e.setNombre_restaurante(rs.getString(6));
                e.setCorreo(rs.getString(7));
                e.setContrasena(rs.getString(8));
                e.setId_rol(rs.getInt(9));
                e.setTipo_rol(rs.getString(10));
                
                lista.add(e);
            }
            
            System.out.println("Se consultaron los empleados");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar los empleados");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    public static int registrarPersonaEmpleado(MPersona e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into mpersona"
                + "(nombre_persona, appat, apmat, telefono, nombre_restaurante)"
                + "values (?,?,?,?,?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        ps.setString(1, e.getNombre_persona());
        ps.setString(2, e.getAppat());
        ps.setString(3, e.getApmat());
        ps.setInt(4, e.getTelefono());
        ps.setString(5, e.getNombre_restaurante());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Empleados en MPersona");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar Empleado en MPersona");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    public static MPersona buscarRestaurante(){
        //donde se crea el objeto del empleado
        MPersona e = new MPersona();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select nombre_restaurante from mpersona";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
         
                e.setNombre_restaurante(rs.getString(1));
            }
            
            System.out.println("Se busco el id_ereceta");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al id_ereceta");
            System.out.println(ex.getMessage());
        }
        return e;
    }
    
}
