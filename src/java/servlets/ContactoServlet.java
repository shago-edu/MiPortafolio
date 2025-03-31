/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package servlets;

import db.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactoServlet")
public class ContactoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String mensaje = request.getParameter("mensaje");

        if (nombre == null || email == null || mensaje == null ||
                nombre.trim().isEmpty() || email.trim().isEmpty() || mensaje.trim().isEmpty()) {
            request.setAttribute("error", "Todos los campos son obligatorios.");
            request.getRequestDispatcher("contacto.jsp").forward(request, response);
            return;
        }

        // Guardar en la base de datos
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO mensajes_contacto (nombre, email, mensaje) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, email);
            statement.setString(3, mensaje);
            statement.executeUpdate();
            request.setAttribute("success", "¡Mensaje enviado con éxito!");
        } catch (SQLException ex) {
            request.setAttribute("error", "Hubo un error al enviar tu mensaje. Inténtalo nuevamente.");
        }

        request.getRequestDispatcher("contacto.jsp").forward(request, response);
    }
}
