<%-- 
    Document   : configuracion
    Created on : 24/05/2022, 08:00:16 PM
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
    <title>Configuración</title>
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
        <h1>Configuración del Perfil</h1>
        
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
            <a href="recetas.jsp">
                <div class="option">
                    <i class="fa-solid fa-book" title="Recetas"></i>
                    <h4>Recetas</h4>
                </div>
            </a>
            <a href="menu.jsp">
                <div class="option">
                    <i class="fa-solid fa-bookmark" title="Menu"></i>
                    <h4>Menu</h4>
                </div>
            </a>
            <a href="inventario.jsp">
                <div class="option">
                    <i class="fa-solid fa-box-archive" title="Inventario"></i>
                    <h4>Inventario</h4>
                </div>
            </a>
            <a href="configuracion.jsp" class="selected">
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
            <caption><h2>Configuración del Perfil</h2></caption>
            <thead class="col_tabla">
              <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido Paterno</th>
                <th scope="col">Apellido Materno</th>
                <th scope="col">Correo electrónico</th>
                <th scope="col">Nombre de la empresa</nav></th>
                <th scope="col">País</th>
                <th scope="col">Teléfono</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Pedro</td>
                <td>Ordoñez</td>
                <td>Matías</td>
                <td>ompe@gmail.com</td>
                <td>IKEA</td>
                <td>México</td>
                <td>551091506</td>
                <td><a href="#modificar_adminis"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i></td>
              </tr>
            </tbody>
          </table>
    
    <div class="boton_nuevo_pag" id="btnreceta">
        <a href="empleados.jsp"><p>Administrar Empleado</p></a>
    </div>

    <!-- MODALS WIIIII -->

    <!-- MODAL MODIFICAR ADMINISTRADOR -->

    <div id="modificar_adminis" class="modal">
        <div class="ventana">
            <a href="#"  class="cerrar">
                X
            </a>
            <br>
            <form action="" method="post" class="ingredienteform">
                <table class="nuevoingrediente">
                    <tr class="insr">
                        <td colspan="2"><b>Modificar Administador</b></td>
                    </tr>
                    <tr class="insr">
                        <td colspan="2">Introduzca los datos del administrador</td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="fila1">Nombre: </td>
                        <td class="fila2"><input type="text" id="adminino"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td class="fila1">Apellido Paterno: </td>
                        <td class="fila2"><input type="text" id="adminiappat"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td class="fila1">Apellido Materno: </td>
                        <td class="fila2"><input type="text" id="adminiapmat"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td class="fila1">Correo electrónico: </td>
                        <td class="fila2"><input type="text" id="adminico"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td class="fila1">Nombre de la empresa: </td>
                        <td class="fila2"><input type="text" id="adminiem"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td class="fila1">País: </td>
                        <td class="fila2"><select name="" id="">
                            <option value="">México</option>
                            <option value="">EUA</option>
                            <option value="">China</option>
                            <option value="">Canadá</option>
                            <option value="">India</option>
                            <option value="">Argentina</option>
                            <option value="">España</option>
                            <option value="">Inglaterra</option>

                        </select></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td class="fila1">Teléfono: </td>
                        <td class="fila2"><input type="number" id="adminite"></td>
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
