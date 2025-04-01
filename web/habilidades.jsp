<%-- 
    Document   : habilidades
    Created on : 30-03-2025, 7:27:55 p. m.
    Author     : DesktopAMD
--%>

<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Habilidades</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <div class="container mt-5">
    <h2>Mis Habilidades</h2>

    <%
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mi_portafolio", "root", ""); // Ajusta según tu configuración
        String query = "SELECT nombre, nivel FROM habilidades ORDER BY nombre ASC";
        stmt = conn.prepareStatement(query);
        rs = stmt.executeQuery();
    %>
      <ul class="list-group">
        <%
          boolean hasData = false;
          while (rs.next()) {
            hasData = true;
        %>
        <li class="list-group-item"><strong><%= rs.getString("nombre") %></strong> - Nivel: <%= rs.getString("nivel") %></li>
        <% } %>
        <% if (!hasData) { %>
          <li class="list-group-item">No hay habilidades disponibles.</li>
        <% } %>
      </ul>
    <% 
      } catch (Exception e) {
        out.println("<p>Error al obtener habilidades: " + e.getMessage() + "</p>");
      } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
      }
    %>
  </div>
</body>
</html>
