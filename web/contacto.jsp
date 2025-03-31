<%-- 
    Document   : contacto
    Created on : 30-03-2025, 7:27:55 p. m.
    Author     : DesktopAMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contacto - Mi Portafolio</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header class="text-center bg-primary text-white py-5">
    <h1>Contacto</h1>
    <p>¡Envíame un mensaje y estaré encantado de responder!</p>
  </header>

  <nav>
    <div class="container d-flex justify-content-center py-3">
      <a href="index.jsp">Inicio</a>
      <a href="proyectos.jsp">Proyectos</a>
      <a href="habilidades.jsp">Habilidades</a>
      <a href="experiencia.jsp">Experiencia</a>
      <a href="contacto.jsp" class="active">Contacto</a>
    </div>
  </nav>

  <section class="container my-5">
      <% String error = (String) request.getAttribute("error"); %>
<% String success = (String) request.getAttribute("success"); %>

<% if (error != null) { %>
    <div class="alert alert-danger" role="alert">
        <%= error %>
    </div>
<% } %>

<% if (success != null) { %>
    <div class="alert alert-success" role="alert">
        <%= success %>
    </div>
<% } %>

      
    <h2 class="text-center mb-4">Formulario de Contacto</h2>
    <form action="ContactoServlet" method="post" class="mx-auto col-md-8">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" required>
      </div>

      <div class="mb-3">
        <label for="email" class="form-label">Correo Electrónico</label>
        <input type="email" class="form-control" id="email" name="email" required>
      </div>

      <div class="mb-3">
        <label for="mensaje" class="form-label">Mensaje</label>
        <textarea class="form-control" id="mensaje" name="mensaje" rows="5" required></textarea>
      </div>

      <button type="submit" class="btn btn-primary">Enviar Mensaje</button>
    </form>
  </section>

  <footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2025 Mi Portafolio</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


