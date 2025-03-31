<%-- 
    Document   : habilidades
    Created on : 30-03-2025, 7:27:55 p. m.
    Author     : DesktopAMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Habilidades - Mi Portafolio</title>
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
          <li class="nav-item"><a class="nav-link active" href="habilidades.jsp">Habilidades</a></li>
          <li class="nav-item"><a class="nav-link" href="experiencia.jsp">Experiencia</a></li>
          <li class="nav-item"><a class="nav-link" href="contacto.jsp">Contacto</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="animate">
    <h1>Mis Habilidades</h1>
    <p>Aquí puedes ver las principales habilidades que he adquirido a lo largo de mi carrera.</p>
  </header>

  <!-- Lista de Habilidades -->
  <section class="container my-5 animate">
    <ul class="list-group">
      <li class="list-group-item"><i class="bi bi-code-slash"></i> Desarrollo Web (HTML, CSS, JavaScript)</li>
      <li class="list-group-item"><i class="bi bi-database"></i> Bases de Datos (MySQL, SQL Server)</li>
      <li class="list-group-item"><i class="bi bi-brush"></i> Diseño UX/UI</li>
      <li class="list-group-item"><i class="bi bi-gear"></i> Programación Backend (Java, JSP, Servlets)</li>
    </ul>
  </section>

  <!-- Footer -->
  <footer>
    <p>&copy; 2025 Mi Portafolio</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>