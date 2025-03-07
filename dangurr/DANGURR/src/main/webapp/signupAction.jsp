<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
    // 입력값 받기
    String serial_number = request.getParameter("serial_number");
    String protector_name = request.getParameter("protector_name");
    String dog_name = request.getParameter("dog_name");
    String species = request.getParameter("species");
    String color = request.getParameter("color");
    String birth = request.getParameter("birth");
    String gender = request.getParameter("gender");
    Boolean fixing = Boolean.parseBoolean(request.getParameter("fixing"));
    Float weight = Float.parseFloat(request.getParameter("weight"));
    Boolean chip = Boolean.parseBoolean(request.getParameter("chip"));
    Boolean vaccin = Boolean.parseBoolean(request.getParameter("vaccin"));
    String allergic = request.getParameter("allergic");
    String etc = request.getParameter("etc");
    int attend = Integer.parseInt(request.getParameter("attend"));
    int ticket = Integer.parseInt(request.getParameter("ticket"));
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    // DB 연결 설정
    String driverName = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/dangurr";
    String username = "root";
    String password = "root1357";
    Connection conn = null;
    PreparedStatement dogStmt = null;
    PreparedStatement protectorStmt = null;
    PreparedStatement memberStmt = null;

    try {
        // JDBC 드라이버 로드 및 연결
        Class.forName(driverName);
        conn = DriverManager.getConnection(url, username, password);
        
        // SQL 쿼리 준비 (INSERT INTO)
        String dogSql = "INSERT INTO dog (serial_number, protector_name, dog_name, species, color, birth, gender, fixing, weight, chip, vaccin, allergic, etc, attend, ticket) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String protectorSql = "INSERT INTO protector (protector_name, phone, address) VALUES (?, ?, ?)";
        String memberSql = "INSERT INTO member (id, password) VALUES (?, ?)";

        // PreparedStatement 생성
        dogStmt = conn.prepareStatement(dogSql);
        dogStmt.setString(1, serial_number);
        dogStmt.setString(2, protector_name);
        dogStmt.setString(3, dog_name);
        dogStmt.setString(4, species);
        dogStmt.setString(5, color);
        dogStmt.setString(6, birth);
        dogStmt.setString(7, gender);
        dogStmt.setBoolean(8, fixing);
        dogStmt.setFloat(9, weight);
        dogStmt.setBoolean(10, chip);
        dogStmt.setBoolean(11, vaccin);
        dogStmt.setString(12, allergic);
        dogStmt.setString(13, etc);
        dogStmt.setInt(14, attend);
        dogStmt.setInt(15, ticket);

        protectorStmt = conn.prepareStatement(protectorSql);
        protectorStmt.setString(1, protector_name);
        protectorStmt.setString(2, phone);
        protectorStmt.setString(3, address);

        memberStmt = conn.prepareStatement(memberSql);
        memberStmt.setString(1, serial_number);
        memberStmt.setString(2, phone);

        // 쿼리 실행
        int dogCount = dogStmt.executeUpdate();
        int protectorCount = protectorStmt.executeUpdate();
        int memberCount = memberStmt.executeUpdate();

        // 결과에 따른 메시지 출력
        if (dogCount == 1 && protectorCount == 1 && memberCount == 1) {
            out.println("<script>");
            out.println("alert('가입 성공!')");
            out.println("location.href='main.jsp';");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('가입 실패...')");
            out.println("location.href='main.jsp';");
            out.println("</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>");
        out.println("alert('오류 발생: " + e.getMessage() + "')");
        out.println("location.href='main.jsp';");
        out.println("</script>");
    } finally {
        // 자원 정리
        try {
            if (dogStmt != null) dogStmt.close();
            if (protectorStmt != null) protectorStmt.close();
            if (memberStmt != null) memberStmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
