/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.AccionesEReceta;
import Modelo.EReceta;
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
public class guardarEReceta extends HttpServlet {

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
            String nombre;
            float cantidad_nueva_ereceta;
            int unidad_medida_ereceta;
            
            nombre = request.getParameter("nom_rec_new");
            cantidad_nueva_ereceta = parseFloat(request.getParameter("cant_rec_new"));
            unidad_medida_ereceta = parseInt(request.getParameter("unidad_rec_new")); 
            
            
            EReceta e = new EReceta();
            
            e.setNombre_receta(nombre);
            e.setCantidad_receta(cantidad_nueva_ereceta);
            e.setId_unidadmedida(unidad_medida_ereceta);
            
            //ejecuto la querry
            
            int estatus = AccionesEReceta.registrarEReceta(e);
            
            if(estatus > 0){
                response.sendRedirect("recetas.jsp");
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
