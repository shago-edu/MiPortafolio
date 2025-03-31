<%-- 
    Document   : contacto
    Created on : 30-03-2025, 7:27:55 p. m.
    Author     : DesktopAMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contacto - Mi Portafolio</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">MiPortafolio</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a></li>
          <li class="nav-item"><a class="nav-link" href="proyectos.jsp">Proyectos</a></li>
          <li class="nav-item"><a class="nav-link" href="habilidades.jsp">Habilidades</a></li>
          <li class="nav-item"><a class="nav-link" href="experiencia.jsp">Experiencia</a></li>
          <li class="nav-item"><a class="nav-link active" href="contacto.jsp">Contacto</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="animate">
    <h1>Contacto</h1>
    <p>Envíame un mensaje y me pondré en contacto contigo lo antes posible.</p>
  </header>

  <!-- Formulario de Contacto -->
  <section class="container my-5 animate">
    <h2 class="text-center mb-4">Formulario de Contacto</h2>
    <form action="ContactoServlet" method="post" class="mx-auto col-md-8">
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" required />
      </div>

      <div class="mb-3">
        <label for="email" class="form-label">Correo Electrónico</label>
        <input type="email" class="form-control" id="email" name="email" required />
      </div>

      <div class="mb-3">
        <label for="mensaje" class="form-label">Mensaje</label>
        <textarea class="form-control" id="mensaje" name="mensaje" rows="5" required></textarea>
      </div>

      <button type="submit" class="btn btn-primary">Enviar Mensaje</button>
    </form>
  </section>

  <!-- Footer -->
  <footer>
    <p>&copy; 2025 Mi Portafolio</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>