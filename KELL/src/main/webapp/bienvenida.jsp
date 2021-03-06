<%-- 
    Document   : bienvenida
    Created on : 7/06/2022, 12:58:25 AM
    Author     : Rogelio Colunga R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%String usuario, nombre;
int rol;
HttpSession sesionuser=request.getSession();
HttpSession sesionrol=request.getSession();
HttpSession sesionnombre=request.getSession();
if(sesionuser.getAttribute("usuario")==null){
%>
<jsp:forward page="registro.jsp" >
    <jsp:param name="error" value="Es obligatorio autenticarse con una sesion válida" />
</jsp:forward>
<%  
    }else{
    usuario = (String)sesionuser.getAttribute("usuario");
    rol = (int)sesionrol.getAttribute("rol");
    nombre = (String)sesionnombre.getAttribute("nombre");
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
    <title>Bienvenida</title>
    <link rel="stylesheet" href="styleLat.css">
    <script src="https://kit.fontawesome.com/75e8eeea01.js" crossorigin="anonymous"></script>
    <link rel="icon" href="img/logo_kell1.jpg">
</head>
<body id="body">
    
    <header>
        <div class="icon__menu">
            <i class="fas fa-bars" id="btn_open"></i>
        </div>
        <h1></h1>
        <div class="icono_header">
        </div>
    </header>

    <div class="menu__side" id="menu_side">

        <div class="name__page">
            <a href="bienvenida.html" class="selected"><img src="img/logo_kell1.jpg" class="imagen"></a>
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
            <a href="configuracion.jsp">
                <div class="option">
                    <i class="fa-solid fa-user" title="Perfil"></i>
                    <h4>Perfil</h4>
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

    <main class="main_container">
        <div class="container_texto">
            <div class="text">
                <p>¡Bienvenido/a 
                <%
                    if(rol==2){ 
                %>
                chef,
                <%
                    }else{
                %>
                administrador,
                <%  }   %>
                <%=nombre%>!<br><br>Kell es un software de asistente virtual el cual esta enfocado para la gestión de
                inventarios de productos en restautantes de comida corrida, esto para mejorar y/u optimizar el costeo de alimentos,
                también se busca el mejor manejo de inventario de insumos y a su vez la gestión de productos los cuales se presentan en el menú.
                </p>
            </div>
        </div>
    </main>

    <script src="JS/scriptC.js"></script>
</body>
</html>
<%
    }
%>

