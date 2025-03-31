<%-- 
    Document   : experiencia
    Created on : 30-03-2025, 7:27:55 p. m.
    Author     : DesktopAMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Experiencia - Mi Portafolio</title>
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
          <li class="nav-item"><a class="nav-link active" href="experiencia.jsp">Experiencia</a></li>
          <li class="nav-item"><a class="nav-link" href="contacto.jsp">Contacto</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="animate">
    <h1>Mi Experiencia</h1>
    <p>Aquí puedes ver mi trayectoria profesional y académica.</p>
  </header>

  <!-- Experiencia - Línea de Tiempo -->
  <section class="container my-5 animate">
    <h2 class="text-center mb-4">Trayectoria Profesional</h2>
    
    <!-- Experiencia 1 -->
    <div class="row mb-4">
      <div class="col-md-3 text-end">
        <h5>2023 - Actualidad</h5>
      </div>
      <div class="col-md-9">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Desarrollador Web</h5>
            <h6 class="card-subtitle mb-2 text-muted">Empresa ABC</h6>
            <p class="card-text">Desarrollo y mantenimiento de aplicaciones web utilizando tecnologías como Java, JSP y Bootstrap.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Experiencia 2 -->
    <div class="row mb-4">
      <div class="col-md-3 text-end">
        <h5>2021 - 2023</h5>
      </div>
      <div class="col-md-9">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Asistente de Desarrollo</h5>
            <h6 class="card-subtitle mb-2 text-muted">Empresa XYZ</h6>
            <p class="card-text">Colaboré en el diseño y desarrollo de soluciones para clientes internacionales.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Educación -->
    <div class="row mb-4">
      <div class="col-md-3 text-end">
        <h5>2018 - 2021</h5>
      </div>
      <div class="col-md-9">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Ingeniería en Sistemas</h5>
            <h6 class="card-subtitle mb-2 text-muted">Universidad Nacional</h6>
            <p class="card-text">Formación integral en desarrollo de software, bases de datos y gestión de proyectos.</p>
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