/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Modelo.MInventario;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesInventario {
    
    public static int registrarInventario(MInventario e){
        
        int estatus=0;
        
        try{ 
            
        Connection con = Conexion.getConection();
        
        String q = "insert into minventario (cantidad_inventario, fecha_inventario, id_ingrediente, id_unidadmedida)"
                + "values (?, ?, ?, ?)";
        
        
        PreparedStatement ps = con.prepareStatement(q);
        
        
        ps.setFloat(1, e.getCantidad_inventario());
        ps.setString(2, e.getFecha_inventario());
        ps.setInt(3, e.getId_ingrediente());
        ps.setInt(4, e.getId_unidadmedida());
        
        estatus = ps.executeUpdate();
            
        System.out.println("Registro Exitoso de Inventario");
        con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar el inventario");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
    }
    
    
    public static List<MInventario> getAllInventarios(){
        //primero declarar el arraylist
        List<MInventario> lista = new ArrayList<MInventario>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from inventarioMuestra";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                MInventario e = new MInventario();
                e.setId_unidadmedida(rs.getInt(1));
                e.setId_inventario(rs.getInt(2));
                e.setCantidad_inventario(rs.getFloat(3));
                e.setFecha_inventario(rs.getString(4));
                e.setId_ingrediente(rs.getInt(5));
                e.setNombre_unidad(rs.getString(6));
                e.setNombre_ingrediente(rs.getString(7));
                lista.add(e);
            }
            
            System.out.println("Se consulto el inventario");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar al inventario");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    //borrar empleado
    public static int eliminarInventario(int id_inventario){
        //necesito saber el estado de la querry para si
        //se ejecuto o no
        int estatus = 0;
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "delete from minventario where id_inventario=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_inventario);
            
            estatus = ps.executeUpdate();
            
            
            
            System.out.println("Se elimino el inventario");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo elimnar al inventario");
            System.out.println(ex.getMessage());
        }
        return estatus;
    }
        
        
    
    
}
