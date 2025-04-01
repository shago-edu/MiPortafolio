<%-- 
    Document   : addProject
    Created on : 31-03-2025, 10:06:27 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Agregar Proyecto</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <div class="container mt-5">
    <h1>Agregar Proyecto</h1>
    <form action="AddServlet" method="post">
      <input type="hidden" name="type" value="proyecto">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" required>
      </div>
      <div class="mb-3">
        <label for="descripcion" class="form-label">Descripción</label>
        <textarea class="form-control" id="descripcion" name="descripcion" required></textarea>
      </div>
      <div class="mb-3">
        <label for="fecha" class="form-label">Fecha</label>
        <input type="date" class="form-control" id="fecha" name="fecha" required>
      </div>
      <button type="submit" class="btn btn-success">Guardar Proyecto</button>
      <a href="admin.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
  </div>
</body>
</html>
