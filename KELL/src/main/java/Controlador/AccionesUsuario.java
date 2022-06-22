/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Modelo.MUsuario;


/**
 *
 * @author Alumno
 */
public class AccionesUsuario {
    
    public static int registrarUsuarioEmpleado(MUsuario u){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into musuario(correo, contrasena, id_persona, id_rol)"
                + "values (?,?,last_insert_id(),2)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        ps.setString(1, u.getCorreo());
        ps.setString(2, u.getContrasena());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Empleados en MUsuario");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar Empleado en MUsuario");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    public static int actualizarUsuario(MUsuario e){
        
        //Estado de la query, se actualizo el ingrediente o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "update mpersona set nombre_persona=?, appat=?, apmat=?, telefono=? where correo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, e.getNombre_persona());
            ps.setString(2, e.getAppat());
            ps.setString(3, e.getApmat());
            ps.setInt(4, e.getTelefono());
            ps.setString(5, e.getCorreo());
            
            estatus = ps.executeUpdate();
            
            System.out.println("Se actualizo el ingrediente");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo actualizar el ingrediente");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
    
    public static MUsuario buscarEmpleadoID(String correo){
        //donde se crea el objeto del empleado
        MUsuario e = new MUsuario();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from personamuestra where correo=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, correo);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                e.setCorreo(rs.getString(1));
                e.setNombre_persona(rs.getString(2));
                e.setAppat(rs.getString(3));
                e.setApmat(rs.getString(4));
                e.setTelefono(rs.getInt(5));
                e.setNombre_restaurante(rs.getString(6));
                e.setContrasena(rs.getString(7));
                e.setId_rol(rs.getInt(8));
                e.setTipo_rol(rs.getString(9));
                
            }
            
            System.out.println("Se busco el usuario");
            con.close();
            
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar al usuario");
            System.out.println(ex.getMessage());
        }
        return e;
    }
}
