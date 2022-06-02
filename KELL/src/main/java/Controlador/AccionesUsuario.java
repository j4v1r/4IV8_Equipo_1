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
    
    public MUsuario verificarUsuario(String correo, String contrasena){
        //objeto de la persona
        MUsuario usuario = null;
        //objeto de conexion
        Connection con = null;
        //Preparacion de la sentencia
        PreparedStatement ps = null;
        //Consultas
        ResultSet rs = null;
        
        try{
            //establecemos la conexion
            con = Conexion.getConection();
            String q = "select * from musuario "
                    + "inner join crol "
                    + "on (musuario.id_rol = crol.id_rol) "
                    + "where correo=? and contrasena=?";
            //preparo la sentencia
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            //ejecutamos la busqueda
            rs = ps.executeQuery();
            //buscamos al usuario
            while(rs.next()){
                usuario = new MUsuario();
                //cprivilegio pri = new cprivilegio();
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setId_rol(rs.getInt("id_rol"));
                usuario.setId_persona(rs.getInt("id_persona"));
                //pri.setPrivilegio_tipo(rs.getString("privilegio_tipo"));
                
                break;
            }
        
        }catch(SQLException sq){
            System.out.println("Error al verificar el usuario");
            System.out.println(sq.getMessage());
        
        }finally{
            try{
                //cerrar conexiones
                rs.close();
                ps.close();
                con.close();
            }catch(Exception ex){
            System.out.println("No se encontro la clase ");
            System.out.println(ex.getMessage());
        }
        }
        return usuario;
   }
}
