/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.AccionesMArticulo;
import Modelo.MArticulo;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Float.parseFloat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rogelio Colunga R
 */
public class guardarMArticulo extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String nombre_art;
            float precio_venta_art;
            
            nombre_art = request.getParameter("nom_menu_new");
            precio_venta_art = parseFloat(request.getParameter("precio_rec_new"));
            
            MArticulo e = new MArticulo ();
            
            e.setNombre_articulo(nombre_art);
            e.setPrecio_venta(precio_venta_art);
            
            //ejecuto la querry
            
            int estatus = AccionesMArticulo.registrarMArticulo(e);
            
            if(estatus > 0){
                response.sendRedirect("menu.jsp");
            }else{
                response.sendRedirect("error.jsp");
            }
            
            
        }
    }
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