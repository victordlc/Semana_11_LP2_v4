<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="./styles/styles-login.css" />
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@800&display=swap" rel="stylesheet">
        <title>WatchDogs</title>
    </head>
    <body>
        <div class="container">
            <div class="login">
                <header class="header animated fadeIn">
                    <img
                    src="./imagenes/logo.png"
                    />
                </header>
        <form name="f_datos" action="valida.jsp" method="POST">
            <table border="0" align="center" cellspacing="0">
                <tbody>
                    <tr>
                        <td style="color: #ffffff !important">Usuario: </td>
                        <td><input class="input-login" type="text" name="f_usuario" value="" placeholder="Ingrese Usuario"/></td>
                    </tr>
                    <tr>
                        <td style="color: #ffffff !important">Clave: </td>
                        <td><input class="input-login" type="password" name="f_clave" value="" placeholder="Ingrese Contraseña"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2"><input class="boton-login" type="submit" value="Ingresar" name="f_ingresar" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        </div>
        </div>
    </body>
    
</html>