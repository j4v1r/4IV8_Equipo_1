/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Modelo.MUsuario;
import java.io.IOException;
import java.io.PrintWriter;
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            HttpSession sesionCli = request.getSession();
            
            
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
                HttpSession sesionusu = request.getSession(true);
                sesionusu.setAttribute("usuario", usuario);
                
                //otra sesion que obtendra solo el parametro
                HttpSession sesionparametro = request.getSession();
                sesionparametro.setAttribute("usuario", correo);
                
                //saber el privilegio switch
                if(usuario.getId_rol()==1){
                    response.sendRedirect("empleados.jsp");
                }else{
                    response.sendRedirect("bienvenida.html");
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

