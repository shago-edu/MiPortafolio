<%-- 
    Document   : admin
    Created on : 31-03-2025, 5:52:08 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    // Verificación de sesión
    HttpSession sessionObj = request.getSession(false);
    String username = (sessionObj != null) ? (String) sessionObj.getAttribute("username") : null;
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%
    if (request.getAttribute("mensajes") == null) {
        response.sendRedirect("AdminServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin - Panel de Administración</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Panel de Administración</a>
      <a class="nav-link text-white" href="index.jsp">Volver al Inicio</a>
      <a class="btn btn-danger ms-auto" href="LogoutServlet">Cerrar Sesión</a>
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

  <!-- Botones de Exportación -->
  <div class="container my-4">
    <h4>Exportar Mensajes</h4>
    <a href="ExportServlet?type=pdf" class="btn btn-danger me-2">Exportar a PDF</a>
    <a href="ExportServlet?type=csv" class="btn btn-info">Exportar a CSV</a>
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
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            <% for (String[] mensaje : mensajes) { %>
              <tr>
                <td><%= mensaje[0] %></td>
                <td><%= mensaje[1] %></td>
                <td><%= mensaje[2] %></td>
                <td><%= mensaje[3] %></td>
                <td><%= mensaje[4] %></td>
                <td>
                  <form action="DeleteServlet" method="post" onsubmit="return confirm('¿Estás seguro de que deseas eliminar este mensaje?');">
                    <input type="hidden" name="mensajeId" value="<%= mensaje[0] %>" />
                    <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                  </form>
                  <a href="EditServlet?mensajeId=<%= mensaje[0] %>" class="btn btn-warning btn-sm">Editar</a>
                </td>
              </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    <% } else { %>
      <p class="text-center">No hay mensajes registrados.</p>
    <% } } %>
  </section>

  <!-- CRUD de Proyectos -->
  <section class="container my-5">
    <h2 class="text-center mb-4">Gestión de Proyectos</h2>
    <a href="addProject.jsp" class="btn btn-success mb-3">Agregar Proyecto</a>

    <% 
      Object proyectosObj = request.getAttribute("proyectos");
      if (proyectosObj instanceof List) {
        List<String[]> proyectos = (List<String[]>) proyectosObj;
        if (!proyectos.isEmpty()) {
    %>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Fecha</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <% for (String[] proyecto : proyectos) { %>
            <tr>
              <td><%= proyecto[1] %></td>
              <td><%= proyecto[2] %></td>
              <td><%= proyecto[3] %></td>
              <td>
                <a href="editProject.jsp?id=<%= proyecto[0] %>" class="btn btn-warning btn-sm">Editar</a>
                <a href="DeleteServlet?type=proyecto&id=<%= proyecto[0] %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este proyecto?');">Eliminar</a>
              </td>
            </tr>
          <% } %>
        </tbody>
      </table>
    <% } else { %>
      <p class="text-center">No hay proyectos registrados.</p>
    <% } } %>
  </section>

  <!-- CRUD de Habilidades -->
  <section class="container my-5">
    <h2 class="text-center mb-4">Gestión de Habilidades</h2>
    <a href="addSkill.jsp" class="btn btn-success mb-3">Agregar Habilidad</a>

    <% 
      Object habilidadesObj = request.getAttribute("habilidades");
      if (habilidadesObj instanceof List) {
        List<String[]> habilidades = (List<String[]>) habilidadesObj;
        if (!habilidades.isEmpty()) {
    %>
      <ul class="list-group">
        <% for (String[] habilidad : habilidades) { %>
          <li class="list-group-item">
            <strong><%= habilidad[1] %></strong> - Nivel: <%= habilidad[2] %>
            <a href="editSkill.jsp?id=<%= habilidad[0] %>" class="btn btn-warning btn-sm ms-2">Editar</a>
            <a href="DeleteServlet?type=habilidad&id=<%= habilidad[0] %>" class="btn btn-danger btn-sm ms-2" onclick="return confirm('¿Estás seguro de que deseas eliminar esta habilidad?');">Eliminar</a>
          </li>
        <% } %>
      </ul>
    <% } else { %>
      <p class="text-center">No hay habilidades registradas.</p>
    <% } } %>
  </section>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
