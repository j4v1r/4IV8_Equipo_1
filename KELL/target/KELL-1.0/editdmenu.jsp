<%-- 
    Document   : editdmenu
    Created on : 21/06/2022, 11:10:32 PM
    Author     : Rogelio Colunga R
--%>

<%@page import="Modelo.DArticulo"%>
<%@page import="Controlador.AccionesDArticulo"%>
<%@page import="Modelo.EReceta"%>
<%@page import="Controlador.AccionesEReceta"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.MArticulo"%>
<%@page import="Controlador.AccionesMArticulo"%>
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
        <title>Artículo de Menu</title>
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
        <h1>Artículo: </h1>
        <div class="icono_header">
            
        </div>
    </header>

    
    <!-- MENU LATERAL -->
    <div class="menu__side" id="menu_side">

        <div class="name__page">
            <a href="bienvenida.jsp"><img src="img/logo_kell1.jpg" class="imagen"></a>
            <h4>Kell</h4>
        </div>

        <div class="options__menu">

            <a href="ingredientes.jsp" class="">
                <div class="option">
                    <i class="fa-solid fa-carrot" title="Ingredientes"></i>
                    <h4>Ingredientes</h4>
                </div>
            </a>
            <a href="recetas.jsp">
                <div class="option">
                    <i class="fa-solid fa-book" title="Recetas"></i>
                    <h4>Recetas</h4>
                </div>
            </a>
            <a href="menu.jsp" class="selected">
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
            int id_articulo = Integer.parseInt(request.getParameter("id_articulo"));
            
            MArticulo e = AccionesMArticulo.buscarMArticuloID(id_articulo);
            
        %>
        
            <table summary="Ingredientes Agregados" class="tabla_consulta">
                <caption><h2>Elementos de <%=e.getNombre_articulo()%></h2></caption>
                <thead class="col_tabla">
                  <tr>
                    <th scope="col">Receta</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Costo</th>
                  </tr>
                </thead>
                <tbody>
                <%
                    List<DArticulo> listaDA = AccionesDArticulo.getAllDArticulo(id_articulo);
                    for(DArticulo u : listaDA){
                %>
                    <tr>
                        <td><%=u.getNombre_receta()%></td>
                        <td><%=u.getCantidad_articulo()%></td>
                        <td><%=u.getCosto_darticulo()%></td>
                        <%
                            if(rol==2){
                        %>
                        <td>
                            <a href="#modificar_ingrediente?id_ingrediente="><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a>
                            <a href="eliminarDArticulo?id_darticulo=<%=u.getId_darticulo()%>&id_articulo=<%=e.getId_articulo()%>"><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i></a>
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
            <a href="#agregar_ingrediente"><p>Nueva Receta de Menú</p></a>
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
                <form action="guardarDArticulo" method="post" class="ingredienteregistro" name="ingredienteregistro">
                    <table class="nuevoingrediente">
                        <tr class="insr">
                            <td colspan="2"><b>Nuevo Artículo de Menú</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del nuevo artículo</td>
                        </tr>
                        <tr class="espacio"></tr>
                        <td> 
                                <input type="hidden" 
                                        value="<%=e.getId_articulo()%>" name="id_articulo" >
                        </td>
                        <tr>
                            <td class="fila1">Artículo: </td>
                            <td class="fila2">
                            <select name="nuevoarticuloereceta" id="nuevoarticuloereceta">
                            <% 
                                List<EReceta> listaER = AccionesEReceta.getAllEReceta();
                                for(EReceta er : listaER){
                            %>
                            <option value="<%=er.getId_ereceta()%>"><%=er.getNombre_receta()%></option>
                            <%
                                }
                            %>
                            </select>
                            </td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cantidadarticulo" name="cantidadarticulo"></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button type="submit"><b>AGREGAR</b></button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
                            
        <%
        
            int id_dmenu = Integer.parseInt(request.getParameter("id_darticulo"));
            
            DArticulo h = AccionesDArticulo.buscarDArticuloAll(id_dmenu);
        %>

        <!-- MODAL MODIFICAR INGREDIENTE -->

        <div id="modificar_ingrediente" class="modal">
            <div class="ventana">
                <a href="dmenu.jsp?id_articulo=<%=h.getId_articulo()%>"  class="cerrar">
                    X
                </a>
                <br>
                <form action="actualizarDArticulo" method="post" class="ingredienteform">
                    <table class="nuevoingrediente">
                        
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Artículos Menú</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del artículo del menú</td>
                        </tr>
                        
                        <tr class="espacio"></tr>
                        <td class="fila2"><input type="hidden" name="id_darticulo" value="<%=h.getId_darticulo()%>"></td>
                        <td class="fila2"><input type="hidden" name="id_articulo" value="<%=h.getId_articulo()%>"></td>
                        <tr>
                            <td class="fila1">Receta: </td>
                            <td class="fila2">
                            <select name="darticuloreceta" id="nuevoarticuloereceta">
                            <option value="<%=h.getId_ereceta()%>"><%=h.getNombre_receta()%></option>
                            <% 
                                List<EReceta> listaEr = AccionesEReceta.getAllEReceta();
                                for(EReceta er : listaEr){
                            %>
                            <option value="<%=er.getId_ereceta()%>"><%=er.getNombre_receta()%></option>
                            <%
                                }
                            %>
                            </select>
                            </td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cantidadarticulo" name="cantidadarticulo" value="<%=h.getCantidad_articulo()%>"></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class=""><button onclick="location.href='dmenu.jsp?id_articulo=<%=h.getId_articulo()%>'" type="button"><b>CANCELAR</b></button></td>
                            <td class=""><button type="submit"><b>APLICAR</b></button></td>
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
    <script src="JS/validacion.js"></script>
</body>
</html>
<%
    }
%>

