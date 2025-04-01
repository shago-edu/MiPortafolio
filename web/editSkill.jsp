<%-- 
    Document   : editSkill
    Created on : 31-03-2025, 10:07:18 p. m.
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
    String nivel = "";

    try (Connection conn = DatabaseConnection.getConnection()) {
        String sql = "SELECT nombre, nivel FROM habilidades WHERE id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(id));
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            nombre = rs.getString("nombre");
            nivel = rs.getString("nivel");
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
  <title>Editar Habilidad</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <div class="container mt-5">
    <h1>Editar Habilidad</h1>
    <form action="EditServlet" method="post">
      <input type="hidden" name="type" value="habilidad">
      <input type="hidden" name="id" value="<%= id %>">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombre %>" required>
      </div>
      <div class="mb-3">
        <label for="nivel" class="form-label">Nivel</label>
        <select class="form-select" id="nivel" name="nivel" required>
          <option value="Básico" <%= nivel.equals("Básico") ? "selected" : "" %>>Básico</option>
          <option value="Intermedio" <%= nivel.equals("Intermedio") ? "selected" : "" %>>Intermedio</option>
          <option value="Avanzado" <%= nivel.equals("Avanzado") ? "selected" : "" %>>Avanzado</option>
          <option value="Experto" <%= nivel.equals("Experto") ? "selected" : "" %>>Experto</option>
        </select>
      </div>
      <button type="submit" class="btn btn-warning">Actualizar Habilidad</button>
      <a href="admin.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
  </div>
</body>
</html>
