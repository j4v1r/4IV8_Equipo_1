/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.AccionesMPersona;
import Controlador.AccionesUsuario;
import Modelo.MPersona;
import Modelo.MUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rogelio Colunga R
 */
public class guardarEmpleado extends HttpServlet {

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
            String nombre, appat, apmat, restaurante, correo, contrasena;
            int telefono;
            
            
            nombre = request.getParameter("nombreem");
            appat = request.getParameter("appatem");
            apmat = request.getParameter("apmatem");
            telefono = parseInt(request.getParameter("telemp"));
            restaurante = request.getParameter("restauranteem");
            correo = request.getParameter("correoem");
            contrasena = request.getParameter("contrasenaemp");
            
            
            MPersona e = new MPersona();
            
            e.setCorreo(correo);
            e.setContrasena(contrasena);
            e.setNombre_persona(nombre);
            e.setAppat(appat);
            e.setApmat(apmat);
            e.setTelefono(telefono);
            e.setNombre_restaurante(restaurante);
            
            
            int estatusp = AccionesMPersona.registrarPersonaEmpleado(e);
            
            
            if(estatusp>0){
                    response.sendRedirect("empleados.jsp");    
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
