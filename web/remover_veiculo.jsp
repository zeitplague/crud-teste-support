<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remover Veículos</title>
    </head>
    <body>
        <%
             String placa = request.getParameter("placa");

            if (placa != null && !placa.isEmpty()) {
                try {
                    // Carregar o driver JDBC e estabelecer conexão
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/portarius", "root", "root123");

                    // Preparar a instrução SQL
                    PreparedStatement st = conecta.prepareStatement("DELETE FROM veiculos WHERE placa=?");
                    st.setString(1, placa);

                    // Executar a atualização
                    int linhasAfetadas = st.executeUpdate();

                    if (linhasAfetadas > 0) {
                        out.print("<p>Veículo removido com sucesso.</p>");
                    } else {
                        out.print("<p>Nenhum veículo encontrado com essa placa.</p>");
                    }

                    // Fechar recursos
                    st.close();
                    conecta.close();
                } catch (ClassNotFoundException e) {
                    out.print("<p>Erro ao carregar o driver: " + e.getMessage() + "</p>");
                } catch (SQLException e) {
                    out.print("<p>Erro ao acessar o banco de dados: " + e.getMessage() + "</p>");
                }
            }
        %>
    </body>
</html>
