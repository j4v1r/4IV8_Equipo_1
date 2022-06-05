/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
 * @author diazt
 */
public class guardarIngrediente extends HttpServlet {

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
            float precio_nuevo, cantidad_nueva;
            int unidad_medida;
            
            nombre = request.getParameter("ingredientenuevo");
            precio_nuevo = parseFloat(request.getParameter("precionuevo"));
            cantidad_nueva = parseFloat(request.getParameter("cantidadnueva"));
            unidad_medida = parseInt(request.getParameter("unidadmedidaingrediente")); 
            
            
            MIngrediente e = new MIngrediente();
            
            e.setNombre_ingrediente(nombre);
            e.setPrecio_ingrediente(precio_nuevo);
            e.setCantidad_compra(cantidad_nueva);
            e.setId_unidadmedida(unidad_medida);
            
            //ejecuto la querry
            
            int estatus = AccionesIngrediente.registrarIngrediente(e);
            
            if(estatus > 0){
                response.sendRedirect("ingredientes.jsp#agregar_ingredient");
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

