/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import db.DatabaseConnection;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String type = request.getParameter("type");

        if (id == null || type == null) {
            response.sendRedirect("admin.jsp");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "";
            PreparedStatement stmt;

            // Determinar la tabla según el tipo de edición
            if ("mensaje".equals(type)) {
                query = "SELECT id, nombre, email, mensaje FROM mensajes_contacto WHERE id = ?";
            } else if ("proyecto".equals(type)) {
                query = "SELECT id, nombre, descripcion, fecha FROM proyectos WHERE id = ?";
            } else if ("habilidad".equals(type)) {
                query = "SELECT id, nombre, nivel FROM habilidades WHERE id = ?";
            }

            stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("id", rs.getString("id"));
                request.setAttribute("nombre", rs.getString("nombre"));
                
                if ("mensaje".equals(type)) {
                    request.setAttribute("email", rs.getString("email"));
                    request.setAttribute("mensaje", rs.getString("mensaje"));
                    request.getRequestDispatcher("editMessage.jsp").forward(request, response);
                } else if ("proyecto".equals(type)) {
                    request.setAttribute("descripcion", rs.getString("descripcion"));
                    request.setAttribute("fecha", rs.getString("fecha"));
                    request.getRequestDispatcher("editProject.jsp").forward(request, response);
                } else if ("habilidad".equals(type)) {
                    request.setAttribute("nivel", rs.getString("nivel"));
                    request.getRequestDispatcher("editSkill.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String type = request.getParameter("type");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "";
            PreparedStatement stmt;

            if ("mensaje".equals(type)) {
                String nombre = request.getParameter("nombre");
                String email = request.getParameter("email");
                String mensaje = request.getParameter("mensaje");

                query = "UPDATE mensajes_contacto SET nombre=?, email=?, mensaje=? WHERE id=?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, nombre);
                stmt.setString(2, email);
                stmt.setString(3, mensaje);
                stmt.setInt(4, Integer.parseInt(id));

            } else if ("proyecto".equals(type)) {
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String fecha = request.getParameter("fecha");

                query = "UPDATE proyectos SET nombre=?, descripcion=?, fecha=? WHERE id=?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, nombre);
                stmt.setString(2, descripcion);
                stmt.setString(3, fecha);
                stmt.setInt(4, Integer.parseInt(id));

            } else if ("habilidad".equals(type)) {
                String nombre = request.getParameter("nombre");
                String nivel = request.getParameter("nivel");

                query = "UPDATE habilidades SET nombre=?, nivel=? WHERE id=?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, nombre);
                stmt.setString(2, nivel);
                stmt.setInt(3, Integer.parseInt(id));
            }

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                request.getSession().setAttribute("success", "Registro actualizado correctamente.");
            } else {
                request.getSession().setAttribute("error", "No se pudo actualizar el registro.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Error al actualizar el registro.");
        }
        response.sendRedirect("AdminServlet");
    }
}


