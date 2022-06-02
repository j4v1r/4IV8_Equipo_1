<%-- 
    Document   : menu
    Created on : 24/05/2022, 07:55:22 PM
    Author     : Alumno
--%>

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
                  <tr>
                    <td>Tomate</td>
                    <td>$15.50</td>
                    <td>$51</td>
                    <td>$20</td>
                    <td><a href="#modificar_menu"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i></td>
                  </tr>
                </tbody>
              </table>
        
        <div class="boton_nuevo_pag1">
            <a href="#agregar_menu"><p>Nuevo artículo de menú</p></a>
        </div>



        <!-- MODALS WIIIII -->


        <!-- MODAL AGREGAR MENU-->
        <div id="agregar_menu" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="menuform">
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
                            <td class="fila2"><input type="text" id="nom_menu_new"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Precio de venta: </td>
                            <td class="fila2"><input type="number" id="precio_rec_new"></td>
                        </tr><tr class="espacio"></tr>
                        <tr>
                            <td class="fila1"><a href="#aña_rec"><button onclick="location.href='#'" type="button"><b>AÑADIR RECETA</b></button></td>
                            <td class="fila2"><a href="#aña_ing"><button onclick="location.href='#'" type="button"><b>AÑADIR INGREDIENTE</b></button></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <!-- <td class="fila1"><button onclick="location.href='#'" type="button"><b>AÑADIR RECETA</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>AÑADIR INGREDIENTE</b></button></td> -->
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>AGREGAR</b></button></td>
                        </tr>
                        
                    </table>
                </form>
            </div>
        </div>


        <!-- MODAL CONSULTAR RECETA-->
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
                                <a href="#modificar_ing"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem; " ></i></a><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i>
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
                            <td class="fila2"><input type="text" id="nom_ing_newmenu"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cant_ing_newmenu"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="" id="unidad_ing_newmenu">
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
                            <td class="fila2"><input type="text" id="nom_rec_newmenu"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cant_rec_newmenu"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="" id="unidad_rec_newmenu">
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

        <!-- MODAL MODIFICAR SUB-RECETA -->
        <div id="modificar_receta" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="recetaform">
                    <table class="modificarreceta">
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Receta</b></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nom_rec_modifmenu"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Cantidad: </td>
                            <td class="fila2"><input type="number" id="cant_rec_modifmenu"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Unidad de Medida: </td>
                            <td class="fila2"><select name="" id="unidad_rec_modifmenu">
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

        <!-- MODAL MODIFICAR Ingrediente -->
        <div id="modificar_ing" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="recetaform">
                    <table class="modificarreceta">
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Ingrediente</b></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nom_rec_modifmenu"></td>
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
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>APLICAR</b></button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <!-- MODAL MODIFICAR MENU -->

        <div id="modificar_menu" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="menuform">
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
                            <td class="fila2"><input type="text" id="nom_menu_modif"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Precio de venta: </td>
                            <td class="fila2"><input type="number" id="nom_menu_modif"></td>
                        </tr><tr class="espacio"></tr>
                        <tr>
                            <td class="fila1"><a href="#consul_rec"><button onclick="location.href='#'" type="button"><b>RECETAS</b></button></td>
                            <td class="fila2"><a href="#consul_ing"><button onclick="location.href='#'" type="button"><b>INGREDIENTES</b></button></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <!-- <td class="fila1"><button onclick="location.href='#'" type="button"><b>AÑADIR RECETA</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>AÑADIR INGREDIENTE</b></button></td> -->
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button onclick="location.href='#'" type="button"><b>MODIFICAR</b></button></td>
                        </tr>
                        
                    </table>
                </form>
            </div>
        </div>
    
    </main>

    <script src="JS/scriptC.js"></script>
</body>
</html>
