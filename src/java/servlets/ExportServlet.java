/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import db.DatabaseConnection;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/ExportServlet")
public class ExportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String exportType = request.getParameter("type");
        if (exportType == null || (!exportType.equals("pdf") && !exportType.equals("excel") && !exportType.equals("csv"))) {
            response.sendRedirect("AdminServlet");
            return;
        }

        List<String[]> mensajes = obtenerMensajes();

        switch (exportType) {
            case "pdf":
                exportarPDF(mensajes, response);
                break;
            case "excel":
                exportarExcel(mensajes, response);
                break;
            case "csv":
                exportarCSV(mensajes, response);
                break;
        }
    }

    private List<String[]> obtenerMensajes() {
        List<String[]> mensajes = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM mensajes_contacto";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                mensajes.add(new String[]{
                        String.valueOf(rs.getInt("id")),
                        rs.getString("nombre"),
                        rs.getString("email"),
                        rs.getString("mensaje"),
                        rs.getString("fecha")
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mensajes;
    }

    // Método para exportar a PDF (Ya Funciona)
    private void exportarPDF(List<String[]> mensajes, HttpServletResponse response) throws IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment;filename=mensajes.pdf");

        try (OutputStream out = response.getOutputStream()) {
            Document document = new Document();
            PdfWriter.getInstance(document, out);

            document.open();
            document.add(new Paragraph("Lista de Mensajes de Contacto\n\n"));

            PdfPTable table = new PdfPTable(5);
            table.addCell("ID");
            table.addCell("Nombre");
            table.addCell("Email");
            table.addCell("Mensaje");
            table.addCell("Fecha");

            for (String[] msg : mensajes) {
                for (String data : msg) {
                    table.addCell(data != null ? data : "-");
                }
            }

            document.add(table);
            document.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Método para exportar a Excel (Ya Funciona)
    private void exportarExcel(List<String[]> mensajes, HttpServletResponse response) throws IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment;filename=mensajes.xlsx");

        try (Workbook workbook = new XSSFWorkbook();
             OutputStream out = response.getOutputStream()) {

            Sheet sheet = workbook.createSheet("Mensajes de Contacto");
            Row headerRow = sheet.createRow(0);

            // Encabezados
            String[] columns = {"ID", "Nombre", "Email", "Mensaje", "Fecha"};
            for (int i = 0; i < columns.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(columns[i]);
                CellStyle headerStyle = workbook.createCellStyle();
                headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
                headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
                cell.setCellStyle(headerStyle);
            }

            // Agregar Datos
            int rowNum = 1;
            for (String[] msg : mensajes) {
                Row row = sheet.createRow(rowNum++);
                for (int i = 0; i < msg.length; i++) {
                    row.createCell(i).setCellValue(msg[i] != null ? msg[i] : "-");
                }
            }

            // Autoajustar Columnas
            for (int i = 0; i < columns.length; i++) {
                sheet.autoSizeColumn(i);
            }

            workbook.write(out);
        }
    }

    // Método para exportar a CSV
    private void exportarCSV(List<String[]> mensajes, HttpServletResponse response) throws IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment;filename=mensajes.csv");

        try (PrintWriter writer = response.getWriter()) {
            // Escribir encabezados
            writer.println("ID,Nombre,Email,Mensaje,Fecha");

            // Escribir los mensajes en formato CSV
            for (String[] msg : mensajes) {
                writer.println(String.join(",", 
                    msg[0] != null ? msg[0].replace(",", " ") : "-",
                    msg[1] != null ? msg[1].replace(",", " ") : "-",
                    msg[2] != null ? msg[2].replace(",", " ") : "-",
                    msg[3] != null ? msg[3].replace(",", " ") : "-",
                    msg[4] != null ? msg[4].replace(",", " ") : "-"
                ));
            }
        }
    }
}
