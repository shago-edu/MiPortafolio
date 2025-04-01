/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import db.DatabaseConnection;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");
        
        if ("proyectos".equals(type)) {
            List<String[]> proyectos = obtenerProyectos();
            request.setAttribute("proyectos", proyectos);
            request.getRequestDispatcher("proyectos.jsp").forward(request, response);
        } else if ("habilidades".equals(type)) {
            List<String[]> habilidades = obtenerHabilidades();
            request.setAttribute("habilidades", habilidades);
            request.getRequestDispatcher("habilidades.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private List<String[]> obtenerProyectos() {
        List<String[]> proyectos = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM proyectos ORDER BY fecha DESC";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                proyectos.add(new String[]{
                        String.valueOf(rs.getInt("id")),
                        rs.getString("nombre"),
                        rs.getString("descripcion"),
                        rs.getString("fecha")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return proyectos;
    }

    private List<String[]> obtenerHabilidades() {
        List<String[]> habilidades = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM habilidades ORDER BY nombre ASC";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                habilidades.add(new String[]{
                        String.valueOf(rs.getInt("id")),
                        rs.getString("nombre"),
                        rs.getString("nivel")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return habilidades;
    }
}