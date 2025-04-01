<%-- 
    Document   : proyectos
    Created on : 30-03-2025, 7:28:15 p. m.
    Author     : DesktopAMD
--%>

<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Proyectos</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <div class="container mt-5">
    <h2>Mis Proyectos</h2>

    <%
      Connection conn = null;
      PreparedStatement stmt = null;
      ResultSet rs = null;
      try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mi_portafolio", "root", ""); // Ajusta según tu configuración
        String query = "SELECT nombre, descripcion, fecha FROM proyectos ORDER BY fecha DESC";
        stmt = conn.prepareStatement(query);
        rs = stmt.executeQuery();
    %>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Fecha</th>
          </tr>
        </thead>
        <tbody>
          <%
            boolean hasData = false;
            while (rs.next()) {
              hasData = true;
          %>
          <tr>
            <td><%= rs.getString("nombre") %></td>
            <td><%= rs.getString("descripcion") %></td>
            <td><%= rs.getString("fecha") %></td>
          </tr>
          <% } %>
          <% if (!hasData) { %>
            <tr><td colspan="3">No hay proyectos disponibles.</td></tr>
          <% } %>
        </tbody>
      </table>
    <% 
      } catch (Exception e) {
        out.println("<p>Error al obtener proyectos: " + e.getMessage() + "</p>");
      } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
      }
    %>
  </div>
</body>
</html>
