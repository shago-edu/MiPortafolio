 Documentación del Proyecto - Mi Portafolio (EPE1)

Bienvenido a la documentación del proyecto **Mi Portafolio**. Este sistema fue desarrollado como parte de la **EPE1** en la asignatura **Desarrollo Web II**.

El proyecto permite administrar proyectos, habilidades y mensajes de contacto, proporcionando una interfaz amigable para la gestión de contenido.

---

## Descripción General

Este sistema tiene las siguientes funcionalidades:

- **Administración de Proyectos y Habilidades:**  
  Puedes agregar, editar y eliminar proyectos y habilidades de tu portafolio.

- **Gestión de Mensajes de Contacto:**  
  Visualiza los mensajes enviados por los visitantes desde el formulario de contacto. Además, puedes editarlos o eliminarlos si es necesario.

- **Exportación de Datos:**  
  Exporta los mensajes a **PDF** o **CSV** para tener un respaldo o compartirlos fácilmente.

- **Sistema de Autenticación:**  
  Solo los administradores pueden acceder al panel de administración a través de un inicio de sesión seguro.

---

## Requisitos Previos

Para ejecutar este proyecto, asegúrate de contar con lo siguiente:

- **Java JDK 8 o superior**  
- **Apache Tomcat 9 o superior**  
- **MySQL**  
- **NetBeans o cualquier IDE compatible con Java EE**  
- **Git** (opcional, para la gestión de versiones)

---

## Configuración del Proyecto

Sigue estos pasos para configurar y ejecutar el proyecto:

1. **Clonar el Repositorio:**  
   Si deseas descargar el proyecto desde GitHub, puedes hacerlo con el siguiente comando:
   
   ```bash
   git clone https://github.com/shago-edu/MiPortafolio
   ```

2. **Crear la Base de Datos:**  
   Conéctate a MySQL y ejecuta este script para crear la base de datos y las tablas necesarias:
   
   ```sql
   CREATE DATABASE mi_portafolio;
   USE mi_portafolio;

   CREATE TABLE proyectos (
       id INT AUTO_INCREMENT PRIMARY KEY,
       nombre VARCHAR(255) NOT NULL,
       descripcion TEXT,
       fecha DATE
   );

   CREATE TABLE habilidades (
       id INT AUTO_INCREMENT PRIMARY KEY,
       nombre VARCHAR(255) NOT NULL,
       nivel VARCHAR(50) NOT NULL
   );

   CREATE TABLE mensajes_contacto (
       id INT AUTO_INCREMENT PRIMARY KEY,
       nombre VARCHAR(255) NOT NULL,
       email VARCHAR(255) NOT NULL,
       mensaje TEXT,
       fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   ```

3. **Configurar la Conexión a la Base de Datos:**  
   Abre el archivo `DatabaseConnection.java` y ajusta los parámetros según tu configuración:

   ```java
   String url = "jdbc:mysql://localhost:3306/mi_portafolio";
   String user = "root"; 
   String password = "";
   ```

4. **Iniciar Apache Tomcat:**  
   Asegúrate de que Apache Tomcat esté configurado en NetBeans. Luego, ejecuta el proyecto.

5. **Acceder al Proyecto:**  
   - Para ver el portafolio:  
     ```
     http://localhost:8080/MiPortafolio/index.jsp
     ```
   - Para ingresar al panel de administración:  
     ```
     http://localhost:8080/MiPortafolio/login.jsp
     ```

---

## Cómo Usar el Sistema

1. **Iniciar Sesión:**  
   Usa las credenciales de administrador para iniciar sesión en el panel.  

2. **Administrar Proyectos y Habilidades:**  
   - Agregar nuevos proyectos o habilidades.  
   - Editar información existente.  
   - Eliminar proyectos o habilidades cuando sea necesario.  

3. **Gestionar Mensajes de Contacto:**  
   - Visualizar los mensajes recibidos desde el formulario de contacto.  
   - Editar los mensajes en caso de ser necesario.  
   - Eliminar mensajes que ya no sean relevantes.  

4. **Exportar Datos:**  
   - Puedes exportar los mensajes de contacto a **PDF** o **CSV** desde la sección de administración.

---

## Posibles Errores y Soluciones

- **Error de Conexión a la Base de Datos:**  
  - Asegúrate de que MySQL esté en ejecución.  
  - Verifica los datos de conexión en `DatabaseConnection.java`.  

- **Página 404 o 500:**  
  - Comprueba que Apache Tomcat esté ejecutándose.  
  - Revisa los logs del servidor en caso de errores.  

- **Problemas con la Exportación:**  
  - Verifica que las librerías necesarias para PDF o CSV estén correctamente configuradas.  

---

## Créditos

Este proyecto fue desarrollado por **Santiago Parra** como parte de la evaluación **EPE1**.  

Si deseas colaborar, reportar un error o sugerir mejoras, puedes hacerlo a través de la sección de **Issues** en GitHub.

---

## Conclusión

Ahora cuentas con un sistema funcional para administrar tu portafolio y gestionar mensajes de contacto. Si tienes alguna pregunta o necesitas soporte adicional, no dudes en contactarme.

**¡Gracias por usar Mi Portafolio!**
