<%-- 
    Document   : proyectos
    Created on : 30-03-2025, 7:28:15 p. m.
    Author     : DesktopAMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Proyectos - Mi Portafolio</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header class="text-center bg-primary text-white py-5">
    <h1>Mis Proyectos</h1>
    <p>Algunos de los proyectos en los que he trabajado recientemente.</p>
  </header>

  <nav>
    <div class="container d-flex justify-content-center py-3">
      <a href="index.jsp">Inicio</a>
      <a href="proyectos.jsp" class="active">Proyectos</a>
      <a href="habilidades.jsp">Habilidades</a>
      <a href="experiencia.jsp">Experiencia</a>
      <a href="contacto.jsp">Contacto</a>
    </div>
  </nav>

  <section class="container my-5">
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

  <footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2025 Mi Portafolio</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


