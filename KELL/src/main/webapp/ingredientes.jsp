<%-- 
    Document   : ingredientes
    Created on : 24/05/2022, 07:21:55 PM
    Author     : Alumno
--%>

<%@page import="Controlador.AccionesUnidadMedida"%>
<%@page import="Modelo.CUnidadMedida"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.MIngrediente"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="Controlador.AccionesIngrediente" session="true"%>
<%
String usuario = "";
//Obtiene la sesión del usuario
HttpSession sesionuser = request.getSession();
//Verifica la sesión
if(sesionuser.getAttribute("usuario") == null){
%>

<jsp:forward page="registro.jsp" >
    <jsp:param name="error" value="Es obligatorio autenticarse con una sesion válida" />
</jsp:forward>
<%  
    }else{
        usuario = (String)sesionuser.getAttribute("usuario");
    }
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
        <title>Ingredientes</title>
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
        <h1>Ingredientes</h1>
        <div class="icono_header">
            <i class="fa-solid fa-carrot" title="Ingredientes" style="color:white" id="icono_header"></i>
        </div>
    </header>

    
    <!-- MENU LATERAL -->
    <div class="menu__side" id="menu_side">

        <div class="name__page">
            <a href="bienvenida.html"><img src="img/logo_kell1.jpg" class="imagen"></a>
            <h4>Kell</h4>
        </div>

        <div class="options__menu">

            <a href="ingredientes.jsp" class="selected">
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
                <caption><h2>Ingredientes</h2></caption>
                <thead class="col_tabla">
                  <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Precio</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Unidad de Medida</th>
                  </tr>
                </thead>
                <tbody>
                    <%
                        List<MIngrediente> lista = AccionesIngrediente.getAllIngredientes();
                        for(MIngrediente e : lista){
                            %>
                  <tr>
                    <td><%=e.getNombre_ingrediente()%></td>
                    <td><%=e.getPrecio_ingrediente()%></td>
                    <td><%=e.getCantidad_compra()%></td>
                    <td><%=e.getNombre_unidad()%></td>
                    <td>
                    <a href="ingredientes.jsp?id_ingrediente=<%=e.getId_ingrediente()%>#modificar_ingrediente"<i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a>
                    <a href="eliminarIngrediente?id_ingrediente=<%=e.getId_ingrediente()%>""><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i></a>
                    </td>
                  </tr>
                    <%
                        
                        }
                    %>
                </tbody>
              </table>
        
        <div class="boton_nuevo_pag">
            <a href="#agregar_ingrediente"><p>Nuevo Ingrediente</p></a>
        </div>


        <!-- MODALS WIIIII -->


        <!-- MODAL AGREGAR INGREDIENTE -->
        <div id="agregar_ingrediente" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="guardarIngrediente" method="post" class="ingredienteregistro" name="ingredienteregistro">
                    <table class="nuevoingrediente">
                        <tr class="insr">
                            <td colspan="2"><b>Nuevo Ingrediente</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del nuevo ingrediente</td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="ingredientenuevo" name="ingredientenuevo"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Precio: </td>
                            <td class="fila2"><input type="text" id="precionuevo" name="precionuevo"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cantidadnueva" name="cantidadnueva"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="unidadmedidaingrediente" id="unidadmedidaingrediente">
                        <% 
                            List<CUnidadMedida> lista2 = AccionesUnidadMedida.getAllUnidadMedida();
                            for(CUnidadMedida e : lista2){
                        %>
                        
                           <option value="<%=e.getId_unidadmedida()%>"><%=e.getNombre_unidad()%></option>
                           
                        <%
                            }
                        %>
                            </select></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button onclick="registroingrediente()" type="button"><b>AGREGAR</b></button></td>
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
                <form action="actualizarMIngrediente" method="post" class="ingredienteform" name="actualizaringrediente">
                    <table class="nuevoingrediente">
                        
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Ingrediente</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del nuevo ingrediente</td>
                        </tr>
                        
                        <tr class="espacio"></tr>
                        <%
                        //id
                        int id_ingrediente = Integer.parseInt(request.getParameter("id_ingrediente"));
                        //empleado
                        MIngrediente e = AccionesIngrediente.buscarIngredienteID(id_ingrediente);
                        %>
                        <input id="id_ingrediente" name="id_ingrediente" type="hidden"
                                                     value="<%=e.getId_ingrediente()%>">
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="ingredientecambio" name="ingredientecambio" value="<%=e.getNombre_ingrediente()%>"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Precio: </td>
                            <td class="fila2"><input type="text" id="precioingredientecambio" name="precioingredientecambio" value="<%=e.getPrecio_ingrediente()%>"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cantidadingredientecambio" name="cantidadingredientecambio" value="<%=e.getCantidad_compra()%>"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="umingredientecambio" id="umingredientecambio" >
                            <option value="<%=e.getId_unidadmedida()%>"><%=e.getNombre_unidad()%></option>
                        <% 
                            List<CUnidadMedida> lista3 = AccionesUnidadMedida.getAllUnidadMedida();
                            for(CUnidadMedida um2 : lista3){
                        %>
                        
                           <option value="<%=um2.getId_unidadmedida()%>"><%=um2.getNombre_unidad()%></option>
                           
                        <%
                            }
                        %>
                            </select></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class=""><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
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
