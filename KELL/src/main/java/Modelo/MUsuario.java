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
    
    private String correo, contrasena, nombre_persona, appat, apmat, nombre_restaurante, tipo_rol;
    private int id_persona, id_rol, telefono;
    
    public void MUsuario(){
    
    }
    
    public MUsuario verificarUsuario(String correo, String contrasena)throws ClassNotFoundException{
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
            String q = "select * from personamuestra where correo=? and contrasena=?";
            ps = con.prepareStatement(q);
            //preparo la sentencia
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            //ejecutamos la busqueda
            rs = ps.executeQuery();
            //Se busca el usuario
            while(rs.next()){
                usuario = new MUsuario();
                //cprivilegio pri = new cprivilegio();
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setId_rol(rs.getInt("id_rol"));
                usuario.setId_persona(rs.getInt("id_persona"));
                
                break;
            }
        
        }catch(SQLException e){
            System.out.println("No conecto con la tabla");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            usuario = null;
        }finally{
            try{
                //cerrar conexiones
                rs.close();
                ps.close();
                con.close();
            }catch(Exception ex){

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

    public String getNombre_persona() {
        return nombre_persona;
    }

    public void setNombre_persona(String nombre_persona) {
        this.nombre_persona = nombre_persona;
    }

    public String getAppat() {
        return appat;
    }

    public void setAppat(String appat) {
        this.appat = appat;
    }

    public String getApmat() {
        return apmat;
    }

    public void setApmat(String apmat) {
        this.apmat = apmat;
    }

    public String getNombre_restaurante() {
        return nombre_restaurante;
    }

    public void setNombre_restaurante(String nombre_restaurante) {
        this.nombre_restaurante = nombre_restaurante;
    }

    public String getTipo_rol() {
        return tipo_rol;
    }

    public void setTipo_rol(String tipo_rol) {
        this.tipo_rol = tipo_rol;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
    
     
}