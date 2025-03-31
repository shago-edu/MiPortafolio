<%-- 
    Document   : proyectos
    Created on : 30-03-2025, 7:28:15 p. m.
    Author     : DesktopAMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Proyectos - Mi Portafolio</title>
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
          <li class="nav-item"><a class="nav-link active" href="proyectos.jsp">Proyectos</a></li>
          <li class="nav-item"><a class="nav-link" href="habilidades.jsp">Habilidades</a></li>
          <li class="nav-item"><a class="nav-link" href="experiencia.jsp">Experiencia</a></li>
          <li class="nav-item"><a class="nav-link" href="contacto.jsp">Contacto</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="animate">
    <h1>Mis Proyectos</h1>
    <p>Aquí puedes ver algunos de los proyectos en los que he trabajado recientemente.</p>
  </header>

  <!-- Galería de Proyectos -->
  <section class="container my-5 animate">
    <div class="row">
      <!-- Proyecto 1 -->
      <div class="col-md-4 mb-4">
        <div class="card">
          <img src="images/proyecto1.jpg" class="card-img-top" alt="Proyecto 1">
          <div class="card-body">
            <h5 class="card-title">Proyecto 1</h5>
            <p class="card-text">Descripción breve del proyecto 1.</p>
          </div>
        </div>
      </div>

      <!-- Proyecto 2 -->
      <div class="col-md-4 mb-4">
        <div class="card">
          <img src="images/proyecto2.jpg" class="card-img-top" alt="Proyecto 2">
          <div class="card-body">
            <h5 class="card-title">Proyecto 2</h5>
            <p class="card-text">Descripción breve del proyecto 2.</p>
          </div>
        </div>
      </div>

      <!-- Proyecto 3 -->
      <div class="col-md-4 mb-4">
        <div class="card">
          <img src="images/proyecto3.jpg" class="card-img-top" alt="Proyecto 3">
          <div class="card-body">
            <h5 class="card-title">Proyecto 3</h5>
            <p class="card-text">Descripción breve del proyecto 3.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer>
    <p>&copy; 2025 Mi Portafolio</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>