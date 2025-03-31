<%-- 
    Document   : admin
    Created on : 31-03-2025, 5:52:08 p. m.
    Author     : DesktopAMD
--%>

<%
    if (request.getAttribute("mensajes") == null) {
        response.sendRedirect("AdminServlet");
        return;
    }
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin - Mensajes de Contacto</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Panel de Administración</a>
      <a class="nav-link text-white" href="index.jsp">Volver al Inicio</a>
    </div>
  </nav>

  <!-- Mensajes de Error -->
  <div class="container my-4">
    <% 
      String error = (String) request.getAttribute("error");
      if (error != null && !error.isEmpty()) { 
    %>
      <div class="alert alert-danger" role="alert"><%= error %></div>
    <% } %>
  </div>

  <!-- Tabla de Mensajes -->
  <section class="container my-5">
    <h2 class="text-center mb-4">Mensajes Recibidos</h2>
    <% 
      Object mensajesObj = request.getAttribute("mensajes");
      if (mensajesObj instanceof List) {
        List<String[]> mensajes = (List<String[]>) mensajesObj;
        if (!mensajes.isEmpty()) {
    %>
      <div class="table-responsive">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Email</th>
              <th>Mensaje</th>
              <th>Fecha</th>
            </tr>
          </thead>
          <tbody>
            <% for (String[] mensaje : mensajes) { %>
              <tr>
                <td><%= mensaje[0] != null ? mensaje[0] : "-" %></td>
                <td><%= mensaje[1] != null ? mensaje[1] : "-" %></td>
                <td><%= mensaje[2] != null ? mensaje[2] : "-" %></td>
                <td><%= mensaje[3] != null ? mensaje[3] : "-" %></td>
                <td><%= mensaje[4] != null ? mensaje[4] : "-" %></td>
              </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    <% 
        } else { 
    %>
      <p class="text-center">No hay mensajes registrados.</p>
    <% 
        }
      } else {
    %>
      <p class="text-center">No hay mensajes disponibles para mostrar.</p>
    <% } %>
  </section>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>