<%-- 
    Document   : registro
    Created on : 24/05/2022, 08:15:18 PM
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
    <script src="https://kit.fontawesome.com/75e8eeea01.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="stylereg.css">
    <script src="/JS/scriptSup.js"></script>
    <link rel="icon" href="img/logo_kell1.jpg">
    <title>Registro</title>
</head>
<body>

    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="btn_1">
            <i class="fas fa-bars"></i>
        </label>
        <a href="#" class="e_logo">
            <img src="img/logo_kell1.png" alt="" class="logo">
        </a>
        <ul>
            <li><a href="index.html">INICIO</a></li>
            <li><a href="registro.jsp" class="inicial">REGISTRO</a></li>
            <li><a href="insesion.jsp">INICIAR SESION</a></li>
        </ul>
    </nav>
    
    <main>
        <div class="container">
            <div class="caja_regsesion">
            <form method="post" name="registro_usuario" id="registro_usuario" action="guardarUsuario">
                    <h3>REGISTRO</h3>
                <p id="nombre">Nombre:</p>
                <input type="text" id="regnombre" name="regnombre" >
                <p id="appat">Apellido Paterno:</p>
                <input type="text" id="regappat" name="regappat" >
                <p id="apmat">Apellido Materno:</p>
                <input type="text" id="regapmat" name="regapmat">
                <p id="correo">E-mail:</p>
                <input type="text" id="regcorreo" name="regcorreo" >

                <div class="col2_form">
                    <p id="empresa">Restaurante:</p>
                    <input type="text" id="regempresa" name="regempresa">
                   
                    <p id="tel">Teléfono:</p>
                    <input type="tel" id="regtel" name="regtel">
                </div>
                    
                <div class="col3_form">
                    <h4>Contraseña</h4>
                    <p id="contra">Ingresa:</p>
                    <input type="password" id="regcontra" name="regcontra">
                    <p id="vercontra">Verifica:</p>
                    <input type="password" id="regvercontra" >

                    <div class="btn_regsesion">
                        <a href="insesion.jsp"><input id="registrar" type="submit" value="Registrarse"></a>
                    </div>
                </div>

                

                    
                
                </form>
                <!-- <div class="btn_insesion">
                    <a href="bienvenida.html" type="submit"><p>INGRESAR</p></a>
                </div> -->
            </div>
        </div>
        <div class="img_in">
            <img src="img/regsesion.jpg" alt="">
        </div>
    </main>

    <footer class="abajo">
        <div>

        </div>
    </footer>
<script src="JS/registro.js"></script>
</body>
</html>
