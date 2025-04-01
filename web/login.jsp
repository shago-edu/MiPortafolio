<%-- 
    Document   : login
    Created on : 31-03-2025, 7:19:03 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Login - Administración</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <div class="container mt-5">
    <h2>Inicio de Sesión</h2>
    
    <!-- Mostrar mensajes de error -->
    <% String error = (String) session.getAttribute("error"); %>
    <% if (error != null) { %>
      <div class="alert alert-danger"><%= error %></div>
      <% session.removeAttribute("error"); %>
    <% } %>

    <form action="LoginServlet" method="post">
      <div class="mb-3">
        <label>Usuario</label>
        <input type="text" name="username" class="form-control" required />
      </div>
      <div class="mb-3">
        <label>Contraseña</label>
        <input type="password" name="password" class="form-control" required />
      </div>
      <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
    </form>
  </div>
</body>
</html>
