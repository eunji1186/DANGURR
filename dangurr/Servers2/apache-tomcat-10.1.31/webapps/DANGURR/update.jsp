<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🐶댕구르르🐶</title>
</head>
<body>
    <%
    String serial_number =request.getParameter("serial_number");
    String protector_name = request.getParameter("protector_name");
    String dog_name = request.getParameter("dog_name");
    String species = request.getParameter("species");
    String color = request.getParameter("color");
    String birth = request.getParameter("birth");
    String gender = request.getParameter("gender");
    String fixingStr = request.getParameter("fixing");
    String chipStr = request.getParameter("chip");
    String vaccinStr = request.getParameter("vaccin");
    Boolean fixing = fixingStr != null ? Boolean.valueOf(fixingStr) : null;
    Boolean chip = chipStr != null ? Boolean.valueOf(chipStr) : null;
    Boolean vaccin = vaccinStr != null ? Boolean.valueOf(vaccinStr) : null;
    float weight = Float.parseFloat(request.getParameter("weight"));
    String allergic = request.getParameter("allergic");
    String etc = request.getParameter("etc");
    int attend = Integer.parseInt(request.getParameter("attend"));
    int ticket = Integer.parseInt(request.getParameter("ticket"));
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    String driverName = "com.mysql.cj.jdbc.Driver";  // 최신 MySQL 드라이버 사용
    String url = "jdbc:mysql://localhost:3306/dangurr?useSSL=false&serverTimezone=UTC";
    String username = "root";
    String password = "root1357";
    Connection conn = null;
    PreparedStatement dogStmt = null;
    PreparedStatement protectorStmt = null;

    try {
        // JDBC 드라이버 로드 및 연결
        conn = DriverManager.getConnection(url, username, password);
        conn.setAutoCommit(false);  // 자동 커밋 비활성화

        // dog 테이블 업데이트 쿼리
        String dogSql = "UPDATE dog SET dog_name=?, species=?, color=?, birth=?, gender=?, fixing=?, weight=?, chip=?, vaccin=?, allergic=?, etc=?, ticket=?, attend=? WHERE serial_number=?";
        // protector 테이블 업데이트 쿼리
        String protectorSql = "UPDATE protector SET phone=?, address=? WHERE protector_name=?";

        // 디버깅: 쿼리 실행 전 파라미터 값 확인
        System.out.println("Executing SQL...");
        System.out.println("dogSql: " + dogSql);
        System.out.println("Protector Name: " + protector_name);
        System.out.println("serial_number: " + serial_number);
        System.out.println("dog_name: " + dog_name);
        System.out.println("species: " + species);
        System.out.println("birth: " + birth);
        System.out.println("gender: " + gender);
        System.out.println("fixing: " + fixing);
        System.out.println("weight: " + weight);
        System.out.println("ticket: " + ticket);
        System.out.println("attend: " + attend);

        // 디버깅: 실제 데이터베이스에서 해당 레코드가 존재하는지 확인하기 위한 쿼리
        String checkDogSql = "SELECT * FROM dog WHERE serial_number=?";
        PreparedStatement checkDogStmt = conn.prepareStatement(checkDogSql);
        checkDogStmt.setString(1, serial_number);
        ResultSet checkDogRs = checkDogStmt.executeQuery();
        if (!checkDogRs.next()) {
            System.out.println("No record found in 'dog' table for serial_number: " + serial_number);
        }
        
        String checkProtectorSql = "SELECT * FROM protector WHERE protector_name=?";
        PreparedStatement checkProtectorStmt = conn.prepareStatement(checkProtectorSql);
        checkProtectorStmt.setString(1, protector_name);
        ResultSet checkProtectorRs = checkProtectorStmt.executeQuery();
        if (!checkProtectorRs.next()) {
            System.out.println("No record found in 'protector' table for protector_name: " + protector_name);
        }

        // dog 테이블 PreparedStatement 준비
        dogStmt = conn.prepareStatement(dogSql);
        dogStmt.setString(1, dog_name);
        dogStmt.setString(2, species);
        dogStmt.setString(3, color);
        dogStmt.setString(4, birth);
        dogStmt.setString(5, gender);
        dogStmt.setObject(6, fixing, Types.BOOLEAN);
        dogStmt.setFloat(7, weight);
        dogStmt.setObject(8, chip, Types.BOOLEAN);
        dogStmt.setObject(9, vaccin, Types.BOOLEAN);
        dogStmt.setString(10, allergic);
        dogStmt.setString(11, etc);
        dogStmt.setInt(12, ticket);
        dogStmt.setInt(13, attend);
        dogStmt.setString(14, serial_number);

        // protector 테이블 PreparedStatement 준비
        protectorStmt = conn.prepareStatement(protectorSql);
        protectorStmt.setString(1, phone);
        protectorStmt.setString(2, address);
        protectorStmt.setString(3, protector_name);

        // 쿼리 실행
        int dogCount = dogStmt.executeUpdate();
        int protectorCount = protectorStmt.executeUpdate();

        // 디버깅: 쿼리 실행 후 영향받은 레코드 수 확인
        System.out.println("dogStmt executed: " + dogCount);
        System.out.println("protectorStmt executed: " + protectorCount);

        // 결과에 따른 메시지 출력
        if (dogCount == 1 && protectorCount == 1) {
            conn.commit();  // 성공 시 커밋
            out.println("<script>");
            out.println("alert('수정 성공!')");
            out.println("location.href='main.jsp';");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('수정 실패...')");
            out.println("location.href='main.jsp';");
            out.println("</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        try {
            conn.rollback();  // 실패 시 롤백
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        out.println("<script>");
        out.println("alert('SQL 오류 발생: " + e.getMessage() + "')");
        out.println("location.href='main.jsp';");
        out.println("</script>");
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
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    %>
</body>
</html>
