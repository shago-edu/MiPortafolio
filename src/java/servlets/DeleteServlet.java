/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import db.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String mensajeId = request.getParameter("mensajeId");

        if (mensajeId != null && !mensajeId.isEmpty()) {
            try (Connection conn = DatabaseConnection.getConnection()) {
                String query = "DELETE FROM mensajes_contacto WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setInt(1, Integer.parseInt(mensajeId));
                
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    request.getSession().setAttribute("success", "Mensaje eliminado correctamente.");
                } else {
                    request.getSession().setAttribute("error", "No se encontró el mensaje para eliminar.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.getSession().setAttribute("error", "Error al eliminar el mensaje.");
            }
        }
        
        response.sendRedirect("AdminServlet");
    }
}

