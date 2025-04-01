<%-- 
    Document   : exportExcel
    Created on : 31-03-2025, 9:00:51?p. m.
    Author     : DesktopAMD
--%>

<%@ page contentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet; charset=UTF-8" %>
<%@ page import="java.io.*, java.util.*, org.apache.poi.ss.usermodel.*, org.apache.poi.xssf.usermodel.XSSFWorkbook" %>

<%
    // Configurar la respuesta como archivo Excel
    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    response.setHeader("Content-Disposition", "attachment;filename=mensajes.xlsx");

    // Obtener los mensajes de la sesión o de la base de datos
    List<String[]> mensajes = (List<String[]>) request.getAttribute("mensajes");

    if (mensajes == null || mensajes.isEmpty()) {
        mensajes = new ArrayList<>();
        mensajes.add(new String[]{"No hay mensajes disponibles", "", "", "", ""});
    }

    try (Workbook workbook = new XSSFWorkbook();
         OutputStream fileOut = response.getOutputStream()) {

        // Crear hoja de Excel
        Sheet sheet = workbook.createSheet("Mensajes de Contacto");
        Row headerRow = sheet.createRow(0);

        // Encabezados
        String[] columns = {"ID", "Nombre", "Email", "Mensaje", "Fecha"};
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);

            // Estilo del encabezado
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

        // Ajustar Columnas
        for (int i = 0; i < columns.length; i++) {
            sheet.autoSizeColumn(i);
        }

        workbook.write(fileOut);
    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().write("Error al generar el archivo Excel: " + e.getMessage());
    }
%>