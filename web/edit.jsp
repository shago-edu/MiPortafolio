<%-- 
    Document   : edit
    Created on : 31-03-2025, 7:09:26 p. m.
    Author     : DesktopAMD
--%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Editar Mensaje</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <div class="container">
    <h2 class="mt-4">Editar Mensaje</h2>
    <form action="EditServlet" method="post">
      <input type="hidden" name="id" value="<%= request.getAttribute("id") %>" />
      <div class="mb-3">
        <label>Nombre</label>
        <input type="text" name="nombre" class="form-control" value="<%= request.getAttribute("nombre") %>" required />
      </div>
      <div class="mb-3">
        <label>Email</label>
        <input type="email" name="email" class="form-control" value="<%= request.getAttribute("email") %>" required />
      </div>
      <div class="mb-3">
        <label>Mensaje</label>
        <textarea name="mensaje" class="form-control" required><%= request.getAttribute("mensaje") %></textarea>
      </div>
      <button type="submit" class="btn btn-primary">Guardar Cambios</button>
      <a href="AdminServlet" class="btn btn-secondary">Cancelar</a>
    </form>
  </div>
</body>
</html>
