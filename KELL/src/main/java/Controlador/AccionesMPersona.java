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
            
            String q = "select * from personamuestra where id_rol=2";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            //Recorre el arrego de la tabla MIngrediente
            while(rs.next()){
                //Se crea objeto del ingrediente
                MPersona e = new MPersona();
                
                e.setCorreo(rs.getString(1));
                e.setNombre_persona(rs.getString(2));
                e.setAppat(rs.getString(3));
                e.setApmat(rs.getString(4));
                e.setTelefono(rs.getInt(5));
                e.setNombre_restaurante(rs.getString(6));
                e.setContrasena(rs.getString(7));
                e.setId_rol(rs.getInt(8));
                e.setTipo_rol(rs.getString(9));
                
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
                + "(correo, nombre_persona, appat, apmat, telefono, nombre_restaurante, contrasena, id_rol)"
                + "values (?,?,?,?,?,?,?,2)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        ps.setString(1, e.getCorreo());
        ps.setString(2, e.getNombre_persona());
        ps.setString(3, e.getAppat());
        ps.setString(4, e.getApmat());
        ps.setInt(5, e.getTelefono());
        ps.setString(6, e.getNombre_restaurante());
        ps.setString(7, e.getContrasena());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Empleados en MPersona");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar Empleado en MPersona");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    //Eliminar Empleado
    public static int eliminarEmpleado(String correo){
        
        //Estado de la query, se elimino el empleado no
        int estatus = 0;
        
        try{
            //Conexión
            Connection con = Conexion.getConection();
            
            String q = "delete from mpersona where correo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, correo);
            
            estatus = ps.executeUpdate();
            
            
            
            System.out.println("Se elimino la persona");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo elimnar la persona");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
}
