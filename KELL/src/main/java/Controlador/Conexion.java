/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.*;

/**
 *
 * @author Equipo 1
 */
public class Conexion {
    public static Connection getConection(){
        String url, username, password;
        
        url = "jdbc:mysql://localhost/kell";
        username = "Alejandro";
                //"root";
        password =//"n0m3l0"; 
                "gl0rfInd3#";
                //"Cami3105+";
        
        Connection con = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Se conecto con la BD");
        }catch(Exception e){
            System.out.println("No se conecto con la bd");
            System.out.println(e.getMessage());
        
        }
        return con;
    }
}
