/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Modelo.MUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alumno
 */
public class sesionUsuario extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String correo, contrasena;
            
            correo = request.getParameter("inusername");
            contrasena = request.getParameter("inpassword");
            
            MUsuario usuario = new MUsuario();
            
            //verificar al usuario
            usuario = usuario.verificarUsuario(correo, contrasena);
            
            //hay que crear la sesion
            
            if(usuario != null){
                //si existe en la BD
                //se crea la sesion de la bd
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", usuario);
                
                //otra sesion que obtendra solo el parametro
                HttpSession sesionUser = request.getSession();
                sesionUser.setAttribute("usuario", correo);
                
                HttpSession sesionRol = request.getSession();
                sesionRol.setAttribute("rol", usuario.getId_rol());
                
                HttpSession sesionNombre = request.getSession();
                sesionNombre.setAttribute("nombre", usuario.getNombre_persona());
                
                HttpSession sesionRestaurante = request.getSession();
                sesionRestaurante.setAttribute("restaurante", usuario.getNombre_restaurante());
                
                //saber el privilegio switch
                if(usuario.getId_rol()==1){
                    response.sendRedirect("bienvenida.jsp");
                }else{
                    response.sendRedirect("bienvenida.jsp");
                }   
                
            
            }else{
                response.sendRedirect("registro.jsp");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(sesionUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(sesionUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
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

