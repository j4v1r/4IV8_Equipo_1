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
    
    
}
