<%-- 
    Document   : recetas
    Created on : 24/05/2022, 07:50:07 PM
    Author     : Alumno
--%>

<%@page import="Modelo.EReceta"%>
<%@page import="Controlador.AccionesEReceta"%>
<%@page import="Controlador.AccionesUnidadMedida"%>
<%@page import="Modelo.CUnidadMedida"%>
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
                        <a href="#modificar_receta"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a>
                        <a href="eliminarEReceta?id_ereceta=<%=e.getId_ereceta()%>""><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i></a>
                    </td>
                  </tr>
                <% 
                    }
                %>
                </tbody>
              </table>
        
        <div class="boton_nuevo_pag" id="btnreceta">
            <a href="#agregar_receta"><p>Nueva Receta</p></a>
        </div>



        <!-- MODALS WIIIII -->


        <!-- MODAL AGREGAR RECETA -->
        <div id="agregar_receta" class="modal">     
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="guardarEReceta" method="post" class="menuform">
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
                            <td class="fila2"><button type="submit"><b>AGREGAR</b></button></td>
                        </tr>
                        
                    </table>
                </form>
            </div>

        </div>

         <!-- MODAL AGREGAR INGREDIENTE -->
         <div id="aña_ing" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="ingredienteform">
                    <table class="nuevoingrediente">
                        <tr class="insr">
                            <td colspan="2"><b>Añadir Ingrediente</b></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nom_ing_newrec"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cant_ing_newrec"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="" id="unidad_ing_newrec">
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
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>APLICAR</b></button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <!-- MODAL AGREGAR SUB-RECETA -->
        <div id="aña_rec" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="ingredienteform">
                    <table class="nuevoingrediente">
                        <tr class="insr">
                            <td colspan="2"><b>Añadir Receta</b></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nom_subrec_newrec"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cant_subrec_newrec"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="" id="unidad_subrec_newrec">
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
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>APLICAR</b></button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <!-- MODAL MODIFICAR RECETA -->

        <div id="modificar_receta" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="menuform">
                    <table class="nuevomenu">
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Receta</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos de la receta</td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nom_rec_modif"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cant_rec_modif"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="" id="unidad_rec_modif">
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
                            <td class="fila1"><a href="#consul_rec"><button onclick="location.href='#'" type="button"><b>RECETAS</b></button></td>
                            <td class="fila2"><a href="#consul_ing"><button onclick="location.href='#'" type="button"><b>INGREDIENTES</b></button></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>MODIFICAR</b></button></td>
                        </tr>
                        
                    </table>
                </form>
            </div>
        </div>


        <!-- MODAL CONSULTAR RECETAS -->


        <div id="consul_rec" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="menuform">
                    <table class="nuevomenu">
                        <tr class="insr">
                            <td colspan="2"><b>Recetas</b></td>
                        </tr>
                        <tr>
                            <td class="fila2">
                                <select name="" id="">
                                    <option value="">Salsa Verde</option>
                                    <option value="">Masa de galletas</option>
                                    <option value="">Salsa Roja</option>
                                    <option value="">Jugo de Naranja</option>
                                    <option value="">Hot Cakes</option>
                                    <option value="">Chilaquiles Rojos</option>
                                </select>
                                <a href="#modificar_rec"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i>
                            </td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1"><a href="#aña_rec"><button onclick="location.href='#'" type="button"><b>AÑADIR SUB-RECETA</b></button></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <!-- <td class="fila1"><button onclick="location.href='#'" type="button"><b>AÑADIR RECETA</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>AÑADIR INGREDIENTE</b></button></td> -->
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                        </tr>
                        
                    </table>
                </form>
            </div>
        </div>

        <!-- MODAL CONSULTAR INGREDIENTE-->
        <div id="consul_ing" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="menuform">
                    <table class="nuevomenu">
                        <tr class="insr">
                            <td colspan="2"><b>Ingredientes</b></td>
                        </tr>
                        <tr>
                            <td class="fila2">
                                <select name="" id="">
                                    <option value="">Tomate Verde</option>
                                    <option value="">Zanahoria</option>
                                    <option value="">Cebolla</option>
                                    <option value="">Ajo</option>
                                    <option value="">Chile Serrano</option>
                                    <option value="">Sal</option>
                                </select>
                                <a href="#modificar_ing"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i>
                            </td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1"><a href="#aña_rec"><button onclick="location.href='#'" type="button"><b>AÑADIR SUB-RECETA</b></button></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <!-- <td class="fila1"><button onclick="location.href='#'" type="button"><b>AÑADIR RECETA</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>AÑADIR INGREDIENTE</b></button></td> -->
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                        </tr>
                        
                    </table>
                </form>
            </div>
        </div>


    
    </main>

    <script src="JS/scriptC.js"></script>
</body>
</html>
