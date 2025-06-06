<%-- 
    Document   : addSkill
    Created on : 31-03-2025, 10:06:40 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Agregar Habilidad</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <div class="container mt-5">
    <h1>Agregar Habilidad</h1>
    <form action="AddServlet" method="post">
      <input type="hidden" name="type" value="habilidad">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" required>
      </div>
      <div class="mb-3">
        <label for="nivel" class="form-label">Nivel</label>
        <select class="form-select" id="nivel" name="nivel" required>
          <option value="Básico">Básico</option>
          <option value="Intermedio">Intermedio</option>
          <option value="Avanzado">Avanzado</option>
          <option value="Experto">Experto</option>
        </select>
      </div>
      <button type="submit" class="btn btn-success">Guardar Habilidad</button>
      <a href="admin.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
  </div>
</body>
</html>

