<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Veículos</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/portarius", "root", "root123");
            st = conecta.prepareStatement("SELECT * FROM veiculos");
            ResultSet rs = st.executeQuery();
        %>
        <table border="1">
            <tr>
                <th>Placa</th><th>Marca</th><th>Modelo</th><th>Tipo</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getString("placa")%></td>
                <td><%=rs.getString("marca")%></td>
                <td><%=rs.getString("modelo")%></td>
                <td><%=rs.getString("tipo_veiculo")%></td>
            </tr>
            <%
            }
            %>
        </table>
    </body>
</html>
