<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="./styles/styles-tablas.css" />
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@800&display=swap" rel="stylesheet">
        <title>Datos Estudiante</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idpersona;
            String s_nombres;
            String s_apellidos;
            String s_dni;
            String s_estado;  
        %>
    </head>
    <body>
        <div class="container">
            <div class="tabla">
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idpersona = request.getParameter("f_idpersona");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "    select nombres, apellidos, dni, estado  "
                                + " from persona "
                                + " where"
                                + " idpersona = " + s_idpersona + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        
        <form class="forma" name="EditarPersonaForm" action="datospersona.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Editar Persona</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td >Nombres: </td>
                        <td><input type="text" name="f_nombres" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Apellidos: </td>
                        <td><input type="text" name="f_apellidos" value="<% out.print(rs.getString(2)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>DNI: </td>
                        <td><input type="text" name="f_dni" value="<% out.print(rs.getString(3)); %>" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(4)); %>" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idpersona" value="<% out.print(s_idpersona); %>" />
                        </td>
                    </tr>
                </tbody>
            </table>
                        <input class="boton-login" type="submit" value="Editar" name="f_editar" />
        </form>
        <%
                }
            }else{
        %>
        <form class="forma" name="AgregarPersonaForm" action="datospersona.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Persona</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombres" value="" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Apellido: </td>
                        <td><input type="text" name="f_apellidos" value="" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>DNI: </td>
                        <td><input type="text" name="f_dni" value="" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                </tbody>
            </table>
            <input class="boton-login" type="submit" value="Agregar" name="f_agregar" />
        </form>
        <%
        }
        %>
        
        <table class="centro" border="1" cellspacing="0" cellpadding="" align = "center">
            <thead>
                <tr>
                    <th colspan="8">Datos Persona</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Estado</th>
                    <th colspan="2">Acciones</th>
                    
                </tr>
            </thead>

        <%
            
                
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =    " delete from persona "
                                    + " where "
                                    + " idpersona = " + s_idpersona + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_nombres = request.getParameter("f_nombres");
                        s_apellidos = request.getParameter("f_apellidos");
                        s_dni = request.getParameter("f_dni");
                        s_estado = request.getParameter("f_estado");
                        consulta =  "   insert into "
                                    + " persona(nombres, apellidos, dni, estado) "
                                    + " values ('"+ s_nombres +"','"+ s_apellidos +"','"+ s_dni +"','"+ s_estado +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_nombres = request.getParameter("f_nombres");
                        s_apellidos = request.getParameter("f_apellidos");
                        s_dni = request.getParameter("f_dni");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update  persona  "
                                + "  set  "
                                + "  nombres = '"+ s_nombres +"',"
                                + "  apellidos = '"+ s_apellidos +"',"
                                + "  dni = '"+ s_dni +"', "
                                + "  estado = '"+ s_estado +"' "
                                + "  where "
                                + "  idpersona = "+ s_idpersona +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select idpersona, nombres, apellidos, dni, estado "
                        + " from persona ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {  
                    ide = rs.getString(1);
                    num++;

                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        <td><a href="datospersona.jsp?f_accion=E&f_idpersona=<%out.print(ide);%>"><img src="./imagenes/eliminar.png" width="40px"></a></td>
                        <td><a href="datospersona.jsp?f_accion=M1&f_idpersona=<%out.print(ide);%>"><img src="./imagenes/editar.png" width="40px"></a></td>

                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL");
            }
            
        %>
        </table>
        <form name="regresar_rol" action="menu.jsp">
                    <td colspan="8"><input class="boton-login" type="submit" value="Volver" name="btn_regresar" /></td>
        </form>
        </div>
        </div>
    </body>
</html>