<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="./styles/styles-menu.css" />
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@800&display=swap" rel="stylesheet">
        <title>Buzón</title>
    </head>
    <body>
        <div class="container">
            <div class="menu">
        <header class="header animated fadeIn">
            <img src="./imagenes/logo.png"/>
        </header>
        <form class="formulario" name="f_salir" action="login.jsp">
        <table class="menu" border="0" align="center" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="2">Que desea revisar papi Levano 7w7?</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1.-</td>
                    <td><a href="datospersona.jsp">Personas</a></td>
                </tr>
                <tr>
                    <td>2.-</td>
                    <td><a href="datosarea.jsp">Area</a></td>
                </tr>
                <tr>
                    <td>3.-</td>
                    <td><a href="datosrol.jsp">Rol</a></td>
                </tr>
                <tr>
                    <td>4.-</td>
                    <td><a href="datossugerencia.jsp">Sugerencia</a></td>
                </tr>
                <tr align="center">
                        <td colspan="2"><input class="boton-login" type="submit" value="Salir" name="f_salir" /></td>
                </tr>
            </tbody>
        </table>
        </form>
            </div>
        </div>
    </body>
</html>