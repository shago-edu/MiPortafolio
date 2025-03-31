<%-- 
    Document   : experiencia
    Created on : 30-03-2025, 7:27:55 p. m.
    Author     : DesktopAMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Experiencia - Mi Portafolio</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header class="text-center bg-primary text-white py-5">
    <h1>Mi Experiencia</h1>
    <p>Aquí puedes ver mi trayectoria profesional y académica.</p>
  </header>

  <nav>
    <div class="container d-flex justify-content-center py-3">
      <a href="index.jsp">Inicio</a>
      <a href="proyectos.jsp">Proyectos</a>
      <a href="habilidades.jsp">Habilidades</a>
      <a href="experiencia.jsp" class="active">Experiencia</a>
      <a href="contacto.jsp">Contacto</a>
    </div>
  </nav>

  <section class="container my-5">
    <h2 class="text-center mb-4">Mi Trayectoria</h2>
    <div class="timeline">
      
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
              <p class="card-text">Desarrollo y mantenimiento de aplicaciones web utilizando Java, JSP y Bootstrap.</p>
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
              <p class="card-text">Colaboré en el diseño y desarrollo de soluciones tecnológicas para clientes internacionales.</p>
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
    </div>
  </section>

  <footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2025 Mi Portafolio</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
