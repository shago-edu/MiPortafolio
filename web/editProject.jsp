<%-- 
    Document   : editProject
    Created on : 31-03-2025, 10:07:02 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, db.DatabaseConnection" %>
<%
    String id = request.getParameter("id");
    if (id == null) {
        response.sendRedirect("admin.jsp");
        return;
    }

    String nombre = "";
    String descripcion = "";
    String fecha = "";

    try (Connection conn = DatabaseConnection.getConnection()) {
        String sql = "SELECT nombre, descripcion, fecha FROM proyectos WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(id));
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            nombre = rs.getString("nombre");
            descripcion = rs.getString("descripcion");
            fecha = rs.getString("fecha");
        } else {
            response.sendRedirect("admin.jsp");
            return;
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("admin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Editar Proyecto</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <div class="container mt-5">
    <h1>Editar Proyecto</h1>
    <form action="EditServlet" method="post">
      <input type="hidden" name="type" value="proyecto">
      <input type="hidden" name="id" value="<%= id %>">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombre %>" required>
      </div>
      <div class="mb-3">
        <label for="descripcion" class="form-label">Descripción</label>
        <textarea class="form-control" id="descripcion" name="descripcion" required><%= descripcion %></textarea>
      </div>
      <div class="mb-3">
        <label for="fecha" class="form-label">Fecha</label>
        <input type="date" class="form-control" id="fecha" name="fecha" value="<%= fecha %>" required>
      </div>
      <button type="submit" class="btn btn-warning">Actualizar Proyecto</button>
      <a href="admin.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
  </div>
</body>
</html>
