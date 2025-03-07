<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="dbConn.jsp" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>🐶댕구르르🐶</title>
	</head>
	<body>
		<%
		
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM member WHERE id=? AND password=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            
			if(id.equals("94336") && password.equals("2438")){
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				
				out.println("<script>");
				out.println("alert('주인장 로그인')");
				out.println("location.href='main.jsp'");
				out.println("</script>");
			}
			
			else if(id.equals("staff") && password.equals("dangurr")){
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				
				out.println("<script>");
				out.println("alert('스태프 로그인')");
				out.println("location.href='main.jsp'");
				out.println("</script>");
			}
			
			else if(rs.next()){
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				
				out.println("<script>");
				out.println("alert('로그인 성공 ')");
				out.println("location.href='main.jsp'");
				out.println("</script>");
			}
			
			else{
				out.println("<script>");
				out.println("alert('로그인실패. 아이디, 비밀번호를 다시 한번 확인해 주세요. ')");
				out.println("history.back()");
				out.println("</script>");
			}
		%>
	</body>
</html>