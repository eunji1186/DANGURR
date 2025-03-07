<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>🐶댕구르르🐶</title>
	</head>
	<body>
		<%
		PrintWriter script = response.getWriter();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String serial_number = request.getParameter("serial_number");
		int ticket = Integer.parseInt(request.getParameter("ticket"));
		int attend = Integer.parseInt(request.getParameter("attend"));
		
		if (ticket == 0) {
		    script.println("<script>");
		    script.println("alert('이용권이 더 없어요ㅠㅠ ')");
		    script.println("location.href='main.jsp'");
		    script.println("</script>");
		    return;
		}

		try {
		    String updateSQL = "UPDATE dog SET attend = ?, ticket = ? WHERE serial_number = ?";
		    pstmt = conn.prepareStatement(updateSQL);
		    pstmt.setInt(1, attend + 1);
		    pstmt.setInt(2, ticket - 1);
		    pstmt.setString(3, serial_number);
		    
		    int rowsUpdated = pstmt.executeUpdate();
		    
		    if (rowsUpdated > 0) {
		    	Date date = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd kk:mm");
				String strDate = simpleDate.format(date);
				
				String insertSQL = "INSERT INTO date(id, date) VALUE (?, ?)";
				pstmt = conn.prepareStatement(insertSQL);
				pstmt.setString(1, serial_number);
				pstmt.setString(2, strDate);
				pstmt.executeUpdate();
				
		        script.println("<script>");
		        
		        if (attend == 0) {
		            script.println("alert('첫출석!! ')");
		        } else {
		            script.println("alert('출석완료! ')");
		        }
		        
		        script.println("location.href='main.jsp'");
		        script.println("</script>");
		        
		    } else {
		        script.println("<script>");
		        script.println("alert('사용자 정보 업데이트에 실패했습니다. 다시 시도해주세요. ')");
		        script.println("location.href='main.jsp'");
		        script.println("</script>");
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		    
		    script.println("<script>");
		    script.println(e.getMessage());
		    script.println("location.href='main.jsp'");
		    script.println("</script>");
		} finally {
		    try {
		        if (rs != null) rs.close();
		        if (pstmt != null) pstmt.close();
		        if (conn != null) conn.close(); 
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}
		
		%>	
	</body>
</html>