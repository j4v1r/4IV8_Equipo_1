/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.AccionesDReceta;
import Modelo.DReceta;
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
public class actualizarDReceta extends HttpServlet {

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
           int id_dreceta, unidad_medida, ingrediente, id_ereceta;
           float  cantidad_nueva;
           
           id_dreceta = Integer.parseInt(request.getParameter("id_dreceta"));
           ingrediente = Integer.parseInt(request.getParameter("ingrediente_dreceta"));
           cantidad_nueva = parseFloat(request.getParameter("cantidadnueva"));
           unidad_medida = parseInt(request.getParameter("unidad_rec_modif")); 
           id_ereceta = Integer.parseInt(request.getParameter("id_ereceta"));
            
            
            DReceta e = new DReceta();
            
            e.setId_dreceta(id_dreceta);
            e.setId_ingrediente(ingrediente);
            e.setCantidad_ingrediente(cantidad_nueva);
            e.setId_unidadmedida(unidad_medida);
            
            int estatus = AccionesDReceta.actualizarDReceta(e);
            
            
           if(estatus > 0){
                response.sendRedirect("dreceta.jsp?id_ereceta="+id_ereceta);
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