<%-- 
    Document   : index
    Created on : 30-03-2025, 7:27:55 p. m.
    Author     : DesktopAMD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Inicio - Mi Portafolio</title>
  
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

  <!-- Custom CSS -->
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <header class="text-center bg-primary text-white py-5">
    <h1>¡Bienvenido a Mi Portafolio!</h1>
    <p>Explora mis proyectos, habilidades y experiencia.</p>
  </header>

  <nav>
    <div class="container d-flex justify-content-center py-3">
      <a href="index.jsp" class="active">Inicio</a>
      <a href="proyectos.jsp">Proyectos</a>
      <a href="habilidades.jsp">Habilidades</a>
      <a href="experiencia.jsp">Experiencia</a>
      <a href="contacto.jsp">Contacto</a>
    </div>
  </nav>

  <section class="container text-center my-5">
    <h2>Hola, soy [Tu Nombre]</h2>
    <p>Este es mi espacio para compartir mis proyectos y habilidades. ¡Bienvenido!</p>
  </section>

  <footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2025 Mi Portafolio</p>
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
