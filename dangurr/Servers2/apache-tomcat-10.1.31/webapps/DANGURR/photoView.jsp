<%@ page import="java.io.*" %>
<%@ page contentType="image/jpeg" %>
<%@ page language="java" pageEncoding="UTF-8"%>

<%
    String serialNumber = request.getParameter("serial_number");

    if (serialNumber == null || serialNumber.isEmpty()) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "serial_number parameter is missing");
        return;
    }

    String uploadPath = application.getRealPath("/upload/");
    String[] extensions = {".jpg", ".jpeg"};
    File imageFile = null;
    boolean imageFound = false;

    for (String ext : extensions) {
        String imagePath = uploadPath + serialNumber + ext;
        imageFile = new File(imagePath);
        if (imageFile.exists()) {
            imageFound = true;
            break;
        }
    }

    if (imageFound) {
        response.setContentType("image/jpeg");
        try (FileInputStream fis = new FileInputStream(imageFile);
             OutputStream os = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error reading image file.");
        }
    } else {
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found.");
    }
%>