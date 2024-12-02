<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            String placa = request.getParameter("placa");
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/portarius", "root", "root123");
            st = conecta.prepareStatement("SELECT * FROM veiculos WHERE placa = ?");
            st.setString(1,placa);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
        %>
  
           <form method="post" action="alterar_veiculo.jsp">
            <p>
                <label for="placa">Placa do Veículo:</label>
                <input type="text" name="placa" id="placa" maxlength="10" required value="<%=rs.getString("placa")%>">
            </p>
            <p>
                <label for="marca">Marca do Veículo:</label>
                <input type="text" name="marca" id="marca" size="50" required value="<%=rs.getString("marca")%>">
            </p>
            <p>
                <label for="modelo">Modelo do Veículo:</label>
                <input type="text" name="modelo" id="modelo" size="50" required <input value="<%=rs.getString("modelo")%>">>
            </p>
            <p>
                <label for="tipo_veiculo">Tipo do Veículo:</label>
                <select name="tipo_veiculo" id="tipo_veiculo" required>
                    
                    <option value="Carro">Carro</option>
                    <option value="Moto">Moto</option>
                    <option value="Caminhão">Caminhão</option>
                    <option value="Ônibus">Ônibus</option>
                </select>
            </p>
            <p>
                <input type="submit" value="Salvar">
            </p>
        </form>
            <%
                } else {
        out.print("Veículo não encontrado.");
    }

    rs.close();
    st.close();
    conecta.close();
%>
    </body>
</html>
