<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<%
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	String msql = "DELETE FROM member WHERE id=?";
	String dsql = "DELETE FROM dog WHERE serial_number=?";
	String psql = "DELETE FROM protector WHERE phone=?";
	
	try{
		PreparedStatement msm = conn.prepareStatement(msql);
		msm.setString(1, id);
		
		PreparedStatement dsm = conn.prepareStatement(dsql);
		dsm.setString(1, id);
		
		PreparedStatement psm = conn.prepareStatement(psql);
		psm.setString(1, password);
		
		int mcount = msm.executeUpdate();
		int dcount = dsm.executeUpdate();
		int pcount = psm.executeUpdate();
		
		if(mcount==1 && dcount==1 && pcount==1){
			out.println("<script>");
			out.println("alert('삭제가 완료 되었습니다. 지금까지 고마웠댕~ ')");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}
		
		else{
			out.println("<script>");
			out.println("alert('삭제에 실패했습니다. 아이디와 비밀번호를 다시 확인해보고 이상없으면 최은지한테 연락주세용 ㅠ ')");
			out.println("location.href='member_delete.jsp'");
			out.println("</script>");
		}
		
		msm.close();
		dsm.close();
		psm.close();
		
	} catch(SQLException e){
		out.println("<script>");
		out.println("alert('존재하지 않는 회원입니다. 아이디와 비밀번호를 다시 확인해주세요. ')");
		out.println("location.href='member_delete.jsp'");
		out.println("</script>");
		
	}
	
	
	conn.close();
%>