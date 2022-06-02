/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Alumno
 */
public class MUsuario {
    
    private String correo, contrasena;
    private int id_persona, id_rol;
    
    public void MUsuario(){
    
    }
    
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
            System.out.println("No se encontro la clase MUsuario");
            System.out.println(ex.getMessage());
        }
        }
        return usuario;
   }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }
    
     
}