<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="./styles/styles-tablas.css" />
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@800&display=swap" rel="stylesheet">
        <title>Datos Sugerencia</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idsugerencia;
            String s_idpersona;
            String s_idarea;
            String s_idrol;
            String s_sugerencia;
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
                s_idsugerencia = request.getParameter("f_idsugerencia");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "    select idpersona, idarea, idrol, sugerencia, estado  "
                                + " from sugerencia "
                                + " where"
                                + " idsugerencia = " + s_idsugerencia + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        
        <form class="forma" name="EditarSugerenciaForm" action="datossugerencia.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Editar Sugerencia</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td >Nombres: </td>
                        <td><input type="text" name="f_idpersona" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Area: </td>
                        <td><input type="text" name="f_idarea" value="<% out.print(rs.getString(2)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Rol: </td>
                        <td><input type="text" name="f_idrol" value="<% out.print(rs.getString(3)); %>" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Sugerencia: </td>
                        <td><input type="text" name="f_sugerencia" value="<% out.print(rs.getString(4)); %>" maxlength="150" size="50"/></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(5)); %>" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idsugerencia" value="<% out.print(s_idsugerencia); %>" />
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
        <form class="forma" name="AgregarSugerenciaForm" action="datossugerencia.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Sugerencia</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombres: </td>
                        <td><input type="text" name="f_idpersona" value="" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Area: </td>
                        <td><input type="text" name="f_idarea" value="" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Rol: </td>
                        <td><input type="text" name="f_idrol" value="" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>sugerencia: </td>
                        <td><input type="text" name="f_sugerencia" value="" maxlength="150" size="50"/></td>
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
                    <th colspan="8">Datos Sugerencia</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Nombres</th>
                    <th>Area</th>
                    <th>Rol</th>
                    <th>Sugerencia</th>
                    <th>Estado</th>
                    <th colspan="2">Acciones</th>
                    
                </tr>
            </thead>

        <%
            
                
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  "   delete from sugerencia "
                                    + " where "
                                    + " idsugerencia = " + s_idsugerencia + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_idpersona = request.getParameter("f_idpersona");
                        s_idarea = request.getParameter("f_idarea");
                        s_idrol = request.getParameter("f_idrol");
                        s_sugerencia = request.getParameter("f_sugerencia");
                        s_estado = request.getParameter("f_estado");
                        consulta =  "   insert into "
                                    + " sugerencia (idpersona, idarea, idrol, sugerencia, estado) "
                                    + " values('"+ s_idpersona +"','"+ s_idarea +"','"+ s_idrol +"','"+ s_sugerencia +"','"+ s_estado +"');";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_idpersona = request.getParameter("f_idpersona");
                        s_idarea = request.getParameter("f_idarea");
                        s_idrol = request.getParameter("f_idrol");
                        s_sugerencia = request.getParameter("f_sugerencia");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update  sugerencia  "
                                + "  set  "
                                + "  idpersona = '"+ s_idpersona +"',"
                                + "  idarea = '"+ s_idarea +"',"
                                + "  idrol = '"+ s_idrol +"', "
                                + "  sugerencia = '"+ s_sugerencia +"', "
                                + "  estado = '"+ s_estado +"' "
                                + "  where "
                                + "  idsugerencia = "+ s_idsugerencia +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " SELECT sug.idsugerencia, per.nombres, are.nombre, ro.nombre, sug.sugerencia, sug.estado "
                        + " FROM sugerencia as sug, persona as per, area as are, rol as ro "
                        + " where sug.idpersona = per.idpersona and sug.idarea = are.idarea and sug.idrol = ro.idrol "
                        + " order by idsugerencia" ;
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
                        <td><%out.print(rs.getString(6));%></td>
                        <td><a href="datossugerencia.jsp?f_accion=E&f_idsugerencia=<%out.print(ide);%>"><img src="./imagenes/eliminar.png" width="40px"></a></td>
                        <td><a href="datossugerencia.jsp?f_accion=M1&f_idsugerencia=<%out.print(ide);%>"><img src="./imagenes/editar.png" width="40px"></a></td>

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
