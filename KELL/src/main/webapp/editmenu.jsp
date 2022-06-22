<%-- 
    Document   : editmenu
    Created on : 21/06/2022, 09:45:48 PM
    Author     : Rogelio Colunga R
--%>

<%@page import="Controlador.AccionesMArticulo"%>
<%@page import="Modelo.MArticulo"%>
<%@page import="java.util.List"%>
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
    <title>Menu</title>
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
        <h1>Menu</h1>
        <div class="icono_header">
            <i class="fa-solid fa-bookmark" title="Menu" style="color: white;" id="icono_header"></i>
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
            <a href="recetas.jsp" class="">
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
            <a href="inventario.jsp" class="">
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
        <caption><h2>Menú</h2></caption>
            <table summary="Ingredientes Agregados" class="tabla_consulta">
                <caption><h2><Menu></Menu></h2></caption>
                <thead class="col_tabla">
                  <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Precio de venta</th>
                    <th scope="col">Costo Aproximado de Receta</th>
                    <th scope="col">Ganancia Aproximada</th>
                  </tr>
                </thead>
                <tbody>
                <% 
                    List<MArticulo> listaMA = AccionesMArticulo.getAllMArticulo();
                    for(MArticulo e : listaMA){
                %>
                  <tr>
                    <td><%=e.getNombre_articulo()%></td>
                    <td><%=e.getPrecio_venta()%></td>
                    <td><%=e.getCosto_marticulo()%></td>
                    <td><%=e.getGanacia_articulo()%></td>
                    <td>
                        <a href="dmenu.jsp?id_articulo=<%=e.getId_articulo()%>"><i class="fa-solid fa-blender" style="font-size: 20px; margin-right: 1rem;"></i></a>
                        <%
                            if(rol==2){
                        %>
                        <a href="editmenu.jsp?id_articulo=<%=e.getId_articulo()%>#modificar_menu"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a>
                        <a href="eliminarMArticulo?id_articulo=<%=e.getId_articulo()%>"><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i></a>
                        <%
                            }else{
                        %>
                        <%  }   %>
                    </td>
                  </tr>
                <% 
                    }
                %>
                </tbody>
              </table>
                
                
        <%
            if(rol==2){
        %>
        <div class="boton_nuevo_pag1">
            <a href="#agregar_menu"><p>Nuevo Artículo de Menú</p></a>
        </div>
        <%
            }else{
        %>
        <%  }   %>


        <!-- MODALS WIIIII -->


        <!-- MODAL AGREGAR MENU-->
        <div id="agregar_menu" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="guardarMArticulo" method="post" class="menuform" name="registromenu">
                    <table class="nuevomenu">
                        <tr class="insr">
                            <td colspan="2"><b>Nuevo Artículo</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del nuevo artículo</td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nom_menu_new" name="nom_menu_new"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Precio de venta: </td>
                            <td class="fila2"><input type="number" id="precio_menu_new" name="precio_menu_new"></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <!-- <td class="fila1"><button onclick="location.href='#'" type="button"><b>AÑADIR RECETA</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>AÑADIR INGREDIENTE</b></button></td> -->
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button type="submit"><b>AGREGAR</b></button></td>
                        </tr>
                        
                    </table>
                </form>
            </div>
        </div>
        
        <%
            
            int id_articulo = Integer.parseInt(request.getParameter("id_articulo"));
            
            MArticulo e = AccionesMArticulo.buscarMArticuloAll(id_articulo);
        
        %>
        

        <!-- MODAL MODIFICAR MENU -->

        <div id="modificar_menu" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="actualizarMArticulo" method="post" class="menuform">
                    <table class="nuevomenu">
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Artículo</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del artículo</td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nom_menu_modif" name="nom_menu_modif" value="<%=e.getNombre_articulo()%>"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Precio de venta: </td>
                            <td class="fila2"><input type="number" id="precio_menu_modif" name="precio_menu_modif" value="<%=e.getPrecio_venta()%>"></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <td><input type="hidden" name="id_articulo" value="<%=e.getId_articulo()%>"></td>
                        <tr>
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button type="submit"><b>MODIFICAR</b></button></td>
                        </tr>
                        
                    </table>
                </form>
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


