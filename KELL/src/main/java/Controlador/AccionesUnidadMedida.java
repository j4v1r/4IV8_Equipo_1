/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CUnidadMedida;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class AccionesUnidadMedida {
    
    //consultar todos los empleados
    public static List<CUnidadMedida> getAllUnidadMedida(){
        //primero declarar el arraylist
        List<CUnidadMedida> lista = new ArrayList<CUnidadMedida>();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select id_unidadmedida, nombre_unidad from cunidadmedida;";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //donde se crea el objeto del empleado
                CUnidadMedida e = new CUnidadMedida();
                e.setId_unidadmedida(rs.getInt(1));
                e.setNombre_unidad(rs.getString(2));
                lista.add(e);
            }
            
            System.out.println("Se consulto la unidad de medida");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar la unidad de medida");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
    //buscar empleado por id
    public static CUnidadMedida buscarUnidadMedidaID(int id_unidadmedida){
        //donde se crea el objeto del empleado
        CUnidadMedida e = new CUnidadMedida();
        
        try{
            //establecer es la conexion
            Connection con = Conexion.getConection();
            
            String q = "select * from cunidadmedida where id=?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id_unidadmedida);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                e.setId_unidadmedida(rs.getInt(1));
                e.setNombre_unidad(rs.getString(2));
                
            }
            
            System.out.println("Se busco la unidad de medida");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo buscar la unidad de medida");
            System.out.println(ex.getMessage());
        }
        return e;
    }
        
       
}
