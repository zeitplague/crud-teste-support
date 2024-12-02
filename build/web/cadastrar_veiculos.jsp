<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Veículos</title>
    </head>
    <body>
        <%  
             request.setCharacterEncoding("UTF-8");
            String placa = request.getParameter("placa");
           
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String tipo_veiculo = request.getParameter("tipo_veiculo");
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/portarius", "root", "root123");
            st = conecta.prepareStatement("INSERT INTO veiculos(placa,marca,modelo,tipo_veiculo) VALUES(?,?,?,?)");
            st.setString(1,placa);
            st.setString(2,marca);
            st.setString(3,modelo);
            st.setString(4,tipo_veiculo);
            st.executeUpdate();
            out.print("Veículo cadastrado com sucesso");
        %>
    </body>
</html>
