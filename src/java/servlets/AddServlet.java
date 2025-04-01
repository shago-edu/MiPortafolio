/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import db.DatabaseConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String type = request.getParameter("type");

        try (Connection conn = DatabaseConnection.getConnection()) {
            if ("proyecto".equals(type)) {
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String fecha = request.getParameter("fecha");

                String sql = "INSERT INTO proyectos (nombre, descripcion, fecha) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, nombre);
                stmt.setString(2, descripcion);
                stmt.setString(3, fecha);
                stmt.executeUpdate();
                response.sendRedirect("DataServlet?type=proyectos");

            } else if ("habilidad".equals(type)) {
                String nombre = request.getParameter("nombre");
                String nivel = request.getParameter("nivel");

                String sql = "INSERT INTO habilidades (nombre, nivel) VALUES (?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, nombre);
                stmt.setString(2, nivel);
                stmt.executeUpdate();
                response.sendRedirect("DataServlet?type=habilidades");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
