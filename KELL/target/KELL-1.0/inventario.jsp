<%-- 
    Document   : inventario
    Created on : 24/05/2022, 07:58:06 PM
    Author     : Alumno
--%>

<%@page import="Modelo.CUnidadMedida"%>
<%@page import="Modelo.CUnidadMedida"%>
<%@page import="Controlador.AccionesUnidadMedida"%>
<%@page import="Modelo.MInventario"%>
<%@page import="Controlador.AccionesInventario"%>
<%@page import="Controlador.AccionesIngrediente"%>
<%@page import="Modelo.MIngrediente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventario</title>
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
        <h1>Inventario</h1>
        <div class="icono_header">
            <i class="fa-solid fa-box-archive" title="Inventario" style="color: white;" id="icono_header"></i>
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
            <a href="recetas.jsp" class="">
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
            <a href="inventario.jsp" class="selected">
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
            <a href="index.html">
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
                <caption><h2>Inventario</h2></caption>
                <thead class="col_tabla">
                  <tr>
                    <th scope="col">Ingrediente</th>
                    <th scope="col">Cantidad</th>
                    <th scope="col">Unidad de Medida</th>
                    <th scope="col">Fecha y Hora</th>
                  </tr>
                </thead>
                <tbody>
                    <% 
                        List<MInventario> lista1 = AccionesInventario.getAllInventarios();
                        for(MInventario e : lista1){
                    %>
                  <tr>
                    <td><%=e.getNombre_ingrediente()%></td>
                    <td><%=e.getCantidad_inventario()%></td>
                    <td><%=e.getNombre_unidad()%></td>
                    <td><%=e.getFecha_inventario()%></td>
                    <td>
                        <a href="#modificar_inventario?id=<%=e.getId_inventario()%>"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a>
                        <a href="eliminarInventario?id_inventario=<%=e.getId_inventario()%>"><i class="fa-solid fa-trash-can" style="font-size: 20px;"></a></i>
                    </td>
                  </tr>
                   <% 
                        }
                    %>
                </tbody>
              </table>
        
        <div class="boton_nuevo_pag" id="btnreceta">
            <a href="#agregar_inventario"><p>Nuevo inventario</p></a>
        </div>



        <!-- MODALS WIIIII -->


        <!-- MODAL AGREGAR INVENTARIO-->
        <div id="agregar_inventario" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="guardarInventario" method="post" class="inventarioform">
                    <table class="nuevainventario">
                        
                        <tr class="insr">
                            <td colspan="2"><b>Nuevo Registro de Inventario</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del nuevo conteo</td>
                        </tr>
                        <tr class="espacio"></tr>
                        
                        <tr>
                            <td class="fila1">Ingrediente: </td>
                            <td class="fila2">
                            <select name="nuevoinventario" id="nuevoinventario">
                        <%
                            List<MIngrediente> lista2 = AccionesIngrediente.getAllIngredientes();
                            for(MIngrediente e : lista2){
                        %>
                                   
                            <option value="<%=e.getId_ingrediente()%>"><%=e.getNombre_ingrediente()%></option>
                            
                        <%
                            }
                        %>
                                
                            </select></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cantidadinventarionueva" name="cantidadinventarionueva"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="unidadmedidainventario" id="unidadmedidainventario">
                        <% 
                            List<CUnidadMedida> lista3 = AccionesUnidadMedida.getAllUnidadMedida();
                            for(CUnidadMedida e : lista3){
                        %>
                                <option value="<%=e.getId_unidadmedida()%>"><%=e.getNombre_unidad()%></option>
                        <%
                            }
                        %>

                            </select></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Fecha: </td>
                            <td class="fila2"><input type="datetime-local" id="start" name="trip-start"></td>
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

        <!-- MODAL MODIFICAR INVENTARIO -->

        <div id="modificar_inventario" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="ingredienteform">
                    <table class="nuevoingrediente">
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Inventario</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del nuevo conteo</td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="ingredientenuevo"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cantidadnueva"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="" id="">
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
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Fecha y Hora: </td>
                            <td class="fila2"><input type="datetime-local" id="precionuevo"></td>
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
</body>
</html>
