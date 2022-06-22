<%-- 
    Document   : editreceta
    Created on : 16/06/2022, 10:21:33 PM
    Author     : Rogelio Colunga R
--%>

<%@page import="Modelo.EReceta"%>
<%@page import="Controlador.AccionesEReceta"%>
<%@page import="Controlador.AccionesUnidadMedida"%>
<%@page import="Modelo.CUnidadMedida"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="Controlador.AccionesIngrediente" session="true"%>
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
    <title>Recetas</title>
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
        <h1>Recetas</h1>
        <div class="icono_header">
            <i class="fa-solid fa-book" title="Recetas" style="color: white;" id="icono_header"></i>
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
        
            <table summary="Ingredientes Agregados" class="tabla_consulta">
                <caption><h2>Recetas</h2></caption>
                <thead class="col_tabla">
                  <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Costo Aproximado</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Unidad de Medida</th>
                  </tr>
                </thead>
                <tbody>
                <% 
                    List<EReceta> listaER = AccionesEReceta.getAllEReceta();
                    for(EReceta e : listaER){
                %>
                  <tr>
                    <td><%=e.getNombre_receta()%></td>
                    <td><%=e.getCosto_ereceta()%></td>
                    <td><%=e.getCantidad_receta()%></td>
                    <td><%=e.getNombre_unidad()%></td>
                    <td>
                        <a href="dreceta.jsp?id_ereceta=<%=e.getId_ereceta()%>"><i class="fa-solid fa-blender" style="font-size: 20px; margin-right: 1rem;"></i></a>
                        <%
                            if(rol==2){
                        %>
                        <a href="#modificar_receta"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a>
                        <a href="eliminarEReceta?id_ereceta=<%=e.getId_ereceta()%>"><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i></a>
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
        <div class="boton_nuevo_pag" id="btnreceta">
            <a href="#agregar_receta"><p>Nueva Receta</p></a>
        </div>
        <%
            }else{
        %>
        <%  }   %>



        <!-- MODALS WIIIII -->


        <!-- MODAL AGREGAR RECETA -->
        <div id="agregar_receta" class="modal">     
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="guardarEReceta" method="post" class="menuform" name="registroereceta">
                    <table class="nuevomenu">
                        <tr class="insr">
                            <td colspan="2"><b>Nueva Receta</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos de la receta</td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nom_rec_new" name="nom_rec_new"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cant_rec_new" name="cant_rec_new"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2">
                            <select name="unidad_rec_new" id="unidad_rec_new">
                        <% 
                            List<CUnidadMedida> listaUM = AccionesUnidadMedida.getAllUnidadMedida();
                            for(CUnidadMedida e : listaUM){
                        %>
                            <option value="<%=e.getId_unidadmedida()%>"><%=e.getNombre_unidad()%></option>
                        <%
                            }
                        %>
                            </select>
                            </td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <!-- <td class="fila1"><button onclick="location.href='#'" type="button"><b>AÑADIR RECETA</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>AÑADIR INGREDIENTE</b></button></td> -->
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button onclick="registroreceta()" type="button"><b>AGREGAR</b></button></td>
                        </tr>
                        
                    </table>
                </form>
            </div>

        </div>

        <!-- MODAL MODIFICAR RECETA -->
        
        <%
        
            int id_ereceta = Integer.parseInt(request.getParameter("id_ereceta"));
            EReceta e = AccionesEReceta.buscarERecetaAll(id_ereceta);
        %>

        <div id="modificar_receta" class="modal">
            <div class="ventana">
                <a href="recetas.jsp"  class="cerrar">
                    X
                </a>
                <br>
                <form action="actualizarEReceta" method="post" class="menuform">
                    <table class="nuevomenu">
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Receta</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos de la receta</td>
                        </tr>
                        <tr class="espacio"></tr>
                        <td class="fila2"><input type="hidden" id="idingrediente" value="<%=e.getId_ereceta()%>" name="id_ereceta"></td>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nom_rec_modif" name="nom_rec_modif" value="<%=e.getNombre_receta()%>"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cant_rec_modif"  name="cant_rec_modif" value="<%=e.getCantidad_receta()%>"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="unidad_rec_modif" id="unidad_rec_modif">
                            <option value="<%=e.getId_unidadmedida()%>"><%=e.getNombre_unidad()%></option>
                            <% 
                            List<CUnidadMedida> lista3 = AccionesUnidadMedida.getAllUnidadMedida();
                            for(CUnidadMedida f : lista3){
                            %>
                        
                           <option value="<%=f.getId_unidadmedida()%>"><%=f.getNombre_unidad()%></option>
                           
                            <%
                                }
                            %>
                            </select></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1"><button onclick="location.href='recetas.jsp'" type="button"><b>CANCELAR</b></button></td>
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