<%-- 
    Document   : dreceta
    Created on : 4/06/2022, 12:13:46 PM
    Author     : Rogelio Colunga R
--%>

<%@page import="Modelo.EReceta"%>
<%@page import="Controlador.AccionesEReceta"%>
<%@page import="Modelo.MIngrediente"%>
<%@page import="Controlador.AccionesIngrediente"%>
<%@page import="Controlador.AccionesUnidadMedida"%>
<%@page import="Modelo.CUnidadMedida"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.DReceta"%>
<%@page import="Controlador.AccionesDReceta"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%String usuario;
int rol;
HttpSession sesionuser=request.getSession();
HttpSession sesionrol=request.getSession();
if(sesionuser.getAttribute("usuario")==null){
%>
<jsp:forward page="registro.jsp" >
    <jsp:param name="error" value="Es obligatorio autenticarse con una sesion válida" />
</jsp:forward>
<%  
    }else{
    usuario = (String)sesionuser.getAttribute("usuario");
    rol = (int)sesionrol.getAttribute("rol");
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ingredientes de Receta</title>
        <link rel="stylesheet" href="styleLat.css">
        <script src="https://kit.fontawesome.com/75e8eeea01.js" crossorigin="anonymous"></script>
        <link rel="icon" href="img/logo_kell1.jpg">
    </head>
    
    <body id="body">
    

    <!-- MENU SUPERIOR -->
    <header>
        <div class="icon__menu">
            <i class="fas fa-bars" id="btn_open"></i>
        </div>
        <h1>Receta: </h1>
        <div class="icono_header">
            
        </div>
    </header>

    
    <!-- MENU LATERAL -->
    <div class="menu__side" id="menu_side">

        <div class="name__page">
            <a href="bienvenida.html"><img src="img/logo_kell1.jpg" class="imagen"></a>
            <h4>Kell</h4>
        </div>

        <div class="options__menu">

            <a href="ingredientes.jsp" class="">
                <div class="option">
                    <i class="fa-solid fa-carrot" title="Ingredientes"></i>
                    <h4>Ingredientes</h4>
                </div>
            </a>
            <a href="recetas.jsp" class="selected">
                <div class="option">
                    <i class="fa-solid fa-book" title="Recetas"></i>
                    <h4>Recetas</h4>
                </div>
            </a>
            <a href="menu.jsp">
                <div class="option">
                    <i class="fa-solid fa-bookmark" title="Menu"></i>
                    <h4>Menú</h4>
                </div>
            </a>
            <a href="inventario.jsp">
                <div class="option">
                    <i class="fa-solid fa-box-archive" title="Inventario"></i>
                    <h4>Inventario</h4>
                </div>
            </a>
            <a href="configuracion.jsp">
                <div class="option">
                    <i class="fa-solid fa-user" title="Perfil"></i>
                    <h4>Consultar Perfil</h4>
                </div>
            </a>
            <a href="cerrarSesion">
                <div class="option">
                    <i class="fa-solid fa-power-off" title="Salir"></i>
                    <h4>Salir</h4>
                </div>
            </a>

        </div>

    </div>        
    
    <!-- CONTENIDO PRINCIPAL -->
    <main class="main_container">
        <%
            //id
            int id_ereceta = Integer.parseInt(request.getParameter("id_ereceta"));
            
            EReceta e = AccionesEReceta.buscarERecetaID(id_ereceta);
            
        %>
        
            <table summary="Ingredientes Agregados" class="tabla_consulta">
                
    
                <caption><h2>Ingredientes de <%=e.getNombre_receta()%></h2></caption>
                
                <thead class="col_tabla">
                  <tr>
                    <th scope="col">Ingrediente</th>
                    <th scope="col">Unidad de Medida</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Costo</th>
                  </tr>
                </thead>
               
                <tbody>
                <%
                    List<DReceta> listaDR1 = AccionesDReceta.getAllDReceta(id_ereceta);
                            for(DReceta u : listaDR1){
                %>
                  <tr>
                    <td><%=u.getNombre_ingrediente()%></td>
                    <td><%=u.getNombre_unidad()%></td>
                    <td><%=u.getCantidad_ingrediente()%></td>
                    <td><%=u.getCosto_dreceta()%></td>
                    <%
                        if(rol==2){
                    %>
                    <td>
                        <a href="#modificar_ingrediente?id_ingrediente="><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a>
                        <a href="eliminarDReceta?id_dreceta=<%=u.getId_dreceta()%>?id_ereceta=<%=e.getId_ereceta()%>"><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i></a>
                    </td>
                    <%
                        }else{
                    %>
                    <%  }   %>
                  </tr>
                <%    
                    }
                %>
                </tbody>
              </table>
        
        <%
            if(rol==2){
        %>
        <div class="boton_nuevo_pag">
            <a href="#agregar_ingrediente"><p>Nuevo Ingrediente de Receta</p></a>
        </div>
        <%
            }else{
        %>
        <%  }   %>

        <!-- MODALS WIIIII -->


        <!-- MODAL AGREGAR INGREDIENTE -->
        
        <div id="agregar_ingrediente" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="guardarDReceta" method="post" class="ingredienteregistro" name="ingredienteregistro">

                    <table class="nuevoingrediente">
                        <tr class="insr">
                            <td colspan="2"><b>Nuevo Ingrediente de Receta</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del nuevo ingrediente</td>
                        </tr>
                        <tr class="espacio"></tr>
                            <td> 
                                <input type="hidden" 
                                        value="<%=e.getId_ereceta()%>" name="id_ereceta" >
                            </td>
                        <tr>
                            <td class="fila1">Ingrediente: </td>
                            <td class="fila2">
                            <select name="ingrediente_dreceta" id="ingrediente_dreceta">
                        <%
                            List<MIngrediente> lista2 = AccionesIngrediente.getAllIngredientes();
                            for(MIngrediente mi : lista2){
                        %>
                                   
                            <option value="<%=mi.getId_ingrediente()%>"><%=mi.getNombre_ingrediente()%></option>
                            
                        <%
                            }
                        %>
                            </select>
                            </td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="um_dreceta" id="um_dreceta">
                        <% 
                            List<CUnidadMedida> listaUM = AccionesUnidadMedida.getAllUnidadMedida();
                            for(CUnidadMedida um : listaUM){
                        %>
                           <option value="<%=um.getId_unidadmedida()%>"><%=um.getNombre_unidad()%></option>
                        <%
                            }
                        %>
                        </select></td> 
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cantidadnueva_dreceta" name="cantidadnueva_dreceta"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button type="submit"><b>AGREGAR</b></button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <!-- MODAL MODIFICAR INGREDIENTE -->

        <div id="modificar_ingrediente" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="ingredienteform">
                    <table class="nuevoingrediente">
                        
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Ingrediente</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del nuevo ingrediente</td>
                        </tr>
                        
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Id: </td>
                            <td class="fila2"><input type="text" id="idingrediente" value=""></td>
                        </tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="ingredientenuevo" value=""></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Precio: </td>
                            <td class="fila2"><input type="text" id="precionuevo"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cantidadnueva"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="" id="" >
                                <option value="">Litro (l)</option>
                                <option value="">Mililitro (ml)</option>
                                <option value="">Kilogramo (kg)</option>
                                <option value="">Gramo (gr)</option>
                                <option value="">Libra (lb)</option>
                                <option value="">Onza (oz)</option>
                                <option value="">Porción (pr)</option>
                                <option value="">Pieza (pz)</option>

                            </select></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class=""><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class=""><button onclick="location.href='#'" type="button"><b>APLICAR</b></button></td>
                        </tr>

                    </table>
                </form>
                <!-- <a href="#IrVentanaFlotante2" style='text-decoration:none;'>
                    Avanzar
                </a> -->
            </div>
        </div>
    
    </main>

    <script src="JS/scriptC.js"></script>
    <!--<script src="JS/validacion.js"></script>-->
</body>
</html>
<%
    }
%>
