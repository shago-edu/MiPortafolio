<%-- 
    Document   : contacto
    Created on : 30-03-2025, 7:27:55 p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contacto</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>

<body>
  <div class="container mt-5">
    <h2>Contáctame</h2>

    <!-- Mostrar Mensaje de Confirmación o Error -->
    <%
      String success = request.getParameter("success");
      String error = request.getParameter("error");
      if ("true".equals(success)) {
    %>
      <div class="alert alert-success">✅ Tu mensaje ha sido enviado con éxito. ¡Gracias por contactarnos!</div>
    <% } else if ("1".equals(error)) { %>
      <div class="alert alert-danger">❗ Ocurrió un error al enviar tu mensaje. Inténtalo de nuevo.</div>
    <% } %>

    <!-- Formulario de Contacto -->
    <form action="ContactoServlet" method="post" novalidate>
      
      <!-- Campo Nombre -->
      <div class="mb-3">
        <label for="nombre" class="form-label">Nombre completo</label>
        <input type="text" class="form-control" id="nombre" name="nombre" 
               placeholder="Ingresa tu nombre" required minlength="3" />
        <div class="invalid-feedback">El nombre debe tener al menos 3 caracteres.</div>
      </div>

      <!-- Campo Email -->
      <div class="mb-3">
        <label for="email" class="form-label">Correo electrónico</label>
        <input type="email" class="form-control" id="email" name="email"
               placeholder="correo@ejemplo.com" required />
        <div class="invalid-feedback">Por favor, ingresa un correo electrónico válido.</div>
      </div>

      <!-- Campo Mensaje -->
      <div class="mb-3">
        <label for="mensaje" class="form-label">Mensaje</label>
        <textarea class="form-control" id="mensaje" name="mensaje" 
                  rows="5" required minlength="10"></textarea>
        <div class="invalid-feedback">El mensaje debe tener al menos 10 caracteres.</div>
      </div>

      <!-- Botón de Enviar -->
      <button type="submit" class="btn btn-primary">Enviar Mensaje</button>
    </form>
  </div>

  <!-- Bootstrap JS para Validación -->
  <script>
    (function () {
      'use strict'
      const forms = document.querySelectorAll('.needs-validation')

      Array.from(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
          }
          form.classList.add('was-validated')
        }, false)
      })
    })()
  </script>
</body>

</html>

