<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Veículo</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");

            String placa = request.getParameter("placa");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String tipo_veiculo = request.getParameter("tipo_veiculo");

            if (placa == null || placa.isEmpty()) {
                out.print("A placa do veículo é obrigatória para alterar os dados.");
            } else {
                Connection conecta = null;
                PreparedStatement st = null;

                try {
                    request.setCharacterEncoding("UTF-8");
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/portarius", "root", "root123");

                    String sql = ("UPDATE veiculos SET marca = ?, modelo = ?, tipo_veiculo = ? WHERE placa = ?");
                    st = conecta.prepareStatement(sql);
                    st.setString(1, marca);
                    st.setString(2, modelo);
                    st.setString(3, tipo_veiculo);
                    st.setString(4, placa);

                    int resultado = st.executeUpdate();

                    if (resultado > 0) {
                        out.print("Veículo atualizado com sucesso.");
                    } else {
                        out.print("Erro ao atualizar o veículo. Verifique se a placa está correta.");
                    }
                } catch (ClassNotFoundException e) {
                    out.print("Erro ao carregar o driver JDBC: " + e.getMessage());
                } catch (SQLException e) {
                    out.print("Erro ao conectar ao banco de dados ou executar a operação: " + e.getMessage());
                } finally {
                    if (st != null) {
                        st.close();
                    }
                    if (conecta != null) {
                        conecta.close();
                    }
                }
            }
        %>
    </body>
</html>
