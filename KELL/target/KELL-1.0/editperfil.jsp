<%-- 
    Document   : editperfil
    Created on : 21/06/2022, 11:57:26 PM
    Author     : Rogelio Colunga R
--%>

<%@page import="Modelo.MUsuario"%>
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

     <!-- CONTENIDO PRINCIPAL -->
     <main class="main_container">
          <%
            //id
            String correo = usuario;
            
            MUsuario e = MUsuario.buscarUsuarioID(correo);
            
        %>
        
        <table summary="Ingredientes Agregados" class="tabla_consulta">
            <caption><h2>Configuración del Perfil</h2></caption>
            <thead class="col_tabla">
              <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido Paterno</th>
                <th scope="col">Apellido Materno</th>
                <th scope="col">Email</th>
                <th scope="col">Restaurante</th>
                <th scope="col">Teléfono</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><%=e.getNombre_persona()%></td>
                <td><%=e.getAppat()%></td>
                <td><%=e.getApmat()%></td>
                <td><%=e.getCorreo()%></td>
                <td><%=e.getNombre_restaurante()%></td>
                <td><%=e.getTelefono()%></td>
                <td>
                    <a href="#modificar_adminis"><i class="fa-solid fa-pen-to-square" style="font-size: 20px; margin-right: 1rem;" ></i></a>
                </td>
              </tr>
            </tbody>
          </table>
         
         
    <%
        if(rol==1){
    %>
    <div class="boton_nuevo_pag" id="btnreceta">
        <a href="empleados.jsp"><p>Administrar Empleado</p></a>
    </div>
    <%
        }else{
    %>
    <%  }   %>

    <!-- MODALS WIIIII -->

    <!-- MODAL MODIFICAR ADMINISTRADOR -->

    <div id="modificar_adminis" class="modal">
        <div class="ventana">
            <a href="configuracion.jsp"  class="cerrar">
                X
            </a>
            <br>
            <form action="actualizarMUsuario" method="post" class="ingredienteform">
                <table class="nuevoingrediente">
                    <tr class="insr">
                        <td colspan="2"><b>Editar Perfil</b></td>
                    </tr>
                    <tr class="insr">
                        <td colspan="2">Introduzca los datos a cambiar del perfil</td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class="fila1">Nombre: </td>
                        <td class="fila2"><input type="text" id="adminino" value="<%=e.getNombre_persona()%>" name="nome"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td class="fila1">Apellido Paterno: </td>
                        <td class="fila2"><input type="text" id="adminiappat" value="<%=e.getAppat()%>" name="appate"></td>
                    </tr>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td class="fila1">Apellido Materno: </td>
                        <td class="fila2"><input type="text" id="adminiapmat" value="<%=e.getApmat()%>" name="apmate"></td>
                    </tr>
                    <td class="fila2"><input type="hidden" id="adminico" value="<%=e.getCorreo()%>" name="correoe"></td>
                    <tr class="espacio1"></tr>
                    <tr>
                        <td class="fila1">Teléfono: </td>
                        <td class="fila2"><input type="text" id="adminite" value="<%=e.getTelefono()%>" name="tele"></td>
                    </tr>
                    <tr class="espacio"></tr>
                    <tr>
                        <td class=""><button onclick="location.href='configuracion.jsp'" type="button"><b>CANCELAR</b></button></td>
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
</body>
</html>
<%
    }
%>
