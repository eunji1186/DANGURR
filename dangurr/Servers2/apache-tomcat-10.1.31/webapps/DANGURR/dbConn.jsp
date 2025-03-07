<!--DB 커넥션 
   디비 연동이 필요한 경우만 사용 -->

<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%
	Connection conn = null;

	String url = "jdbc:mysql: //localhost:3306/dangurr";
	String user = "root";
	String passwd = "root1357";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	conn = DriverManager.getConnection(url, user, passwd);
%>