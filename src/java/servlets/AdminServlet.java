/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import db.DatabaseConnection;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<String[]> mensajes = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT id, nombre, email, mensaje, fecha FROM mensajes_contacto ORDER BY fecha DESC";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String[] mensaje = {
                    rs.getString("id"),
                    rs.getString("nombre"),
                    rs.getString("email"),
                    rs.getString("mensaje"),
                    rs.getString("fecha")
                };
                mensajes.add(mensaje);
            }

            request.setAttribute("mensajes", mensajes);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al obtener los mensajes.");
        }

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
} 