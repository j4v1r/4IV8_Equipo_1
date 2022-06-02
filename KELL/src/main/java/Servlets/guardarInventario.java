/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.AccionesIngrediente;
import Controlador.AccionesInventario;
import Modelo.MIngrediente;
import Modelo.MInventario;
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
public class guardarInventario extends HttpServlet {

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
            float cantidad_inventario;
            String fecha;
            int unidad_medida, ingrediente;    
            
            ingrediente = parseInt(request.getParameter("nuevoinventario"));
            cantidad_inventario = parseFloat(request.getParameter("cantidadinventarionueva"));
            unidad_medida = parseInt(request.getParameter("unidadmedidainventario"));
            fecha = request.getParameter("trip-start"); 
            
            
            MInventario e = new MInventario();
            
            e.setId_ingrediente(ingrediente);
            e.setCantidad_inventario(cantidad_inventario);
            e.setId_unidadmedida(unidad_medida);
            e.setFecha_inventario(fecha);
            
            //ejecuto la querry
            
            int estatus = AccionesInventario.registrarInventario(e);
            
            if(estatus > 0){
                response.sendRedirect("inventario.jsp");
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
