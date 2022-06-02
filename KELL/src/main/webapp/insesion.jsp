<%-- 
    Document   : insesion
    Created on : 24/05/2022, 08:08:24 PM
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
    <link rel="stylesheet" href="stylein.css">
    <script src="/JS/scriptSup.js"></script>
    <link rel="icon" href="img/logo_kell1.jpg">
    <title>Inicio de Sesion</title>
</head>
<body>

    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="btn_1">
            <i class="fas fa-bars"></i>
        </label>
        <a href="#" class="e_logo">
            <img src="../Maquetacion_1/img/logo_kell1.png" alt="" class="logo">
        </a>
        <ul>
            <li><a href="index.html">INICIO</a></li>
            <li><a href="registro.jsp">REGISTRO</a></li>
            <li><a href="insesion.jsp" class="inicial">INICIAR SESION</a></li>
        </ul>
    </nav>
    
    <main>
        <div class="container">
            <div class="caja_insesion">
                <form method="post" action="sesionUsuario">
                    <h3>WELCOME</h3>
                <p id="username">Username</p>
                <input type="text" id="inusername" name="inusername">
                <p id="password">Password</p>
                <input type="password" id="inpassword" name="inpassword">
                <div class="btn_insesion">
                    <button type="submit"><p>INGRESAR</p></button>

                </div>
                </form>
            </div>
        </div>
        <div class="img_in">
            <img src="img/insesion.png" alt="">
        </div>
    </main>

    

    <footer class="abajo">
        <div>

        </div>
    </footer>

</body>
</html>
