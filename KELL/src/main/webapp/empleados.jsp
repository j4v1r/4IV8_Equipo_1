<%-- 
    Document   : empleados
    Created on : 24/05/2022, 08:32:57 PM
    Author     : Alumno
--%>

<%@page import="Modelo.MPersona"%>
<%@page import="Modelo.MPersona"%>
<%@page import="java.util.List"%>
<%@page import="Controlador.AccionesMPersona"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%String usuario, restaurante;
int rol;
HttpSession sesionuser=request.getSession();
HttpSession sesionrol=request.getSession();
HttpSession sesionrestaurante=request.getSession();
if(sesionuser.getAttribute("usuario")==null){
%>
<jsp:forward page="registro.jsp" >
    <jsp:param name="error" value="Es obligatorio autenticarse con una sesion válida" />
</jsp:forward>
<%  
    }else{
    usuario = (String)sesionuser.getAttribute("usuario");
    rol = (int)sesionrol.getAttribute("rol");
    restaurante = (String)sesionrestaurante.getAttribute("restaurante");
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
    <title>Empleados</title>
    <link rel="stylesheet" href="styleLat.css">
    <script src="https://kit.fontawesome.com/75e8eeea01.js" crossorigin="anonymous"></script>
    <link rel="icon" href="img/logo_kell1.jpg">
</head>
<body id="body">
    
    <header>
        <div class="icon__menu">
            <i class="fas fa-bars" id="btn_open"></i>
        </div>
        <h1>Empleados</h1>
        
    </header>

    

    <div class="menu__side" id="menu_side">

        <div class="name__page">
            <a href="bienvenida.jsp"><img src="img/logo_kell1.jpg" class="imagen"></a>
            <h4>Kell</h4>
        </div>

        <div class="options__menu">

            <a href="ingredientes.jsp" >
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
            <a href="cerrarSesion">
                <div class="option">
                    <i class="fa-solid fa-power-off" title="Salir"></i>
                    <h4>Salir</h4>
                </div>
            </a>

        </div>

    </div>

    <main class="main_container">
        
        <table summary="Ingredientes Agregados" class="tabla_consulta">
            <caption><h2>Empleados</h2></caption>
            <thead class="col_tabla">
              <tr>
                <th scope="col">Nombre(s)</th>
                <th scope="col">Apellido Paterno</th>
                <th scope="col">Apellido Materno</th>
                <th scope="col">Correo</th>
                <th scope="col">Telefono</th>
              </tr>
            </thead>
            <tbody>
                <%
                    String nombre_restuarante = restaurante;
                    
                    List<MPersona> listaEmpleados = AccionesMPersona.getAllEmpleados(nombre_restuarante);
                            for(MPersona e : listaEmpleados){
                %>
              <tr>
                <td><%=e.getNombre_persona()%></td>
                <td><%=e.getAppat()%></td>
                <td><%=e.getApmat()%></td>
                <td><%=e.getCorreo()%></td>
                <td>55<%=e.getTelefono()%></td>
                
                <td><a href="#modificar_empleado"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a>
                    <a href="eliminarEmpleado?correo=<%=e.getCorreo()%>"><i class="fa-solid fa-trash-can" style="font-size: 20px;"></i></a>
                </td>
              </tr>
              <%
                  }
              %>
            </tbody>
          </table>
    
    <main class="main_container">
        
        <a href="#modificar_empleado">
        
        <div class="boton_nuevo_pag">
            <a href="#agregar_empleado"><p>Agregar Empleado</p></a>
        </div>


        
        <!-- MODALS WIIIII -->


        <!-- MODAL AGREGAR INGREDIENTE -->
        <div id="agregar_empleado" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="guardarEmpleado" method="post" class="ingredienteform">
                    <table class="nuevoingrediente">
                        <tr class="insr">
                            <td colspan="2"><b>Nuevo Empleado</b></td>
                        </tr>
                        <tr class="insr">
                            <td colspan="2">Introduzca los datos del nuevo Empleado</td>
                        </tr>
                        <tr class="espacio"></tr>
                        <td><input type="hidden" value="<%=restaurante%>" name="restauranteem"></td>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="nombreem" name="nombreem"></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Apellido Paterno: </td>
                            <td class="fila2"><input type="text" id="appatem" name="appatem"></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Apellido Materno: </td>
                            <td class="fila2"><input type="text" id="apmatem" name="apmatem"></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Teléfono: </td>
                            <td class="fila2"><input type="text" id="telemp" placeholder="55" name="telemp"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Correo: </td>
                            <td class="fila2"><input type="text" id="correoem" name="correoem"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Contraseña: </td>
                            <td class="fila2"><input type="text" id="contrasenaemp" name="contrasenaemp"></td>
                        </tr>
                        
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1"><button onclick="location.href='#'" type="button"><b>CANCELAR</b></button></td>
                            <td class="fila2"><button type="submit"><b>APLICAR</b></button></td>
                        </tr>
                    </table>
                </form>
                <!-- <a href="#IrVentanaFlotante2" style='text-decoration:none;'>
                    Avanzar
                </a> -->
            </div>
        </div>

        <!-- MODAL MODIFICAR EMPLEADO -->

        <div id="modificar_empleado" class="modal">
            <div class="ventana">
                <a href="#"  class="cerrar">
                    X
                </a>
                <br>
                <form action="" method="post" class="ingredienteform">
                    <table class="nuevoingrediente">
                        <tr class="insr">
                            <td colspan="2"><b>Modificar Empleado</b></td>
                        </tr>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Nombre: </td>
                            <td class="fila2"><input type="text" id="ingredientenuevo"></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Apellido Paterno: </td>
                            <td class="fila2"><input type="text" id="appatem"></td>
                        </tr>
                        <tr class="espacio"></tr>
                        <tr>
                            <td class="fila1">Apellido Materno: </td>
                            <td class="fila2"><input type="text" id="apmatem"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Correo: </td>
                            <td class="fila2"><input type="text" id="precionuevo"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        <tr>
                            <td class="fila1">Contraseña: </td>
                            <td class="fila2"><input type="number" id="cantidadnueva"></td>
                        </tr>
                        <tr class="espacio1"></tr>
                        
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
<%
    }
%>