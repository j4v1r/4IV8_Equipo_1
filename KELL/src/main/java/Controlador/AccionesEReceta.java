/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;
import java.sql.*;
import Modelo.EReceta;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rogelio Colunga R
 */
public class AccionesEReceta {
    
    public static int registrarEReceta(EReceta e){
        
        int estatus=0;
                
        try{
            
            Connection con = Conexion.getConection();
        
            String q = "insert into ereceta (nombre_receta, cantidad_receta, id_unidadmedida)"
                    + "values (?, ?, ?)";


            PreparedStatement ps = con.prepareStatement(q);


            ps.setString(1, e.getNombre_receta());
            ps.setFloat(2, e.getCantidad_receta());
            ps.setInt(3, e.getId_unidadmedida());

            estatus = ps.executeUpdate();

            System.out.println("Registro Exitoso de EReceta");
            con.close();
            
        }catch(Exception ex){
            System.out.println("Error al registrar en EReceta");
            System.out.println(ex.getMessage());
            
        
        }
        return estatus;
            
    }
    
    public static List<EReceta> getAllEReceta(){
        //Declaración Array List
        List<EReceta> lista = new ArrayList<EReceta>();
        
        try{
            //Conexión BD
            Connection con = Conexion.getConection();
            
            //Consulta
            String q = "select * from erecetaUnidad";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                //Creación obejto ereceta
                EReceta e = new EReceta();
                e.setId_ereceta(rs.getInt(1));
                e.setNombre_receta(rs.getString(2));
                e.setCantidad_receta(rs.getFloat(3));
                e.setId_unidadmedida(rs.getInt(4));
                e.setCosto_ereceta(rs.getFloat(5));
                e.setNombre_unidad(rs.getString(6));
                lista.add(e);
            }
            
            System.out.println("Se consulto ereceta");
            con.close();
            
        }catch(Exception ex){
            System.out.println("No se pudo consultar ereceta");
            System.out.println(ex.getMessage());
        }
        return lista;
    }
    
}
