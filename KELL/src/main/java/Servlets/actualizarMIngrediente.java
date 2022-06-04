/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.AccionesIngrediente;
import Modelo.MIngrediente;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Float.parseFloat;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rogelio Colunga R
 */
public class actualizarMIngrediente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           int id_ingrediente, unidad_medida;
           String nombre;
           float precio_nuevo, cantidad_nueva;
           
           id_ingrediente = Integer.parseInt(request.getParameter("id_ingrediente"));
           nombre = request.getParameter("ingredientecambio");
           precio_nuevo = parseFloat(request.getParameter("precioingredientecambio"));
           cantidad_nueva = parseFloat(request.getParameter("cantidadingredientecambio"));
           unidad_medida = parseInt(request.getParameter("umingredientecambio")); 
            
            
            MIngrediente e = new MIngrediente();
            
            e.setId_ingrediente(id_ingrediente);
            e.setNombre_ingrediente(nombre);
            e.setPrecio_ingrediente(precio_nuevo);
            e.setCantidad_compra(cantidad_nueva);
            e.setId_unidadmedida(unidad_medida);

            
           int estatus = AccionesIngrediente.actualizarMIngrediente(e);
            
           if(estatus > 0){
                response.sendRedirect("ingredientes.jsp");
           }else{
                response.sendRedirect("error.jsp");
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
