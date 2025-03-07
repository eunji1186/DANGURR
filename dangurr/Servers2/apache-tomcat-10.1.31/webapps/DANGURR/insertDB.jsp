<!-- 입력받은 데이터 DB에 저장  -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>

<%
	String serial_number = request.getParameter("serial_number");
	String protector_name = request.getParameter("protector_name");
	String dog_name = request.getParameter("dog_name");
	String species = request.getParameter("species");
	String color = request.getParameter("color");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	Boolean fixing = Boolean.parseBoolean(request.getParameter("fixing"));
	String weight = request.getParameter("weight");
	Boolean chip = Boolean.parseBoolean(request.getParameter("chip"));
	Boolean vaccin = Boolean.parseBoolean(request.getParameter("vaccin"));
	Boolean allergic = Boolean.parseBoolean(request.getParameter("allergic"));
	String etc = request.getParameter("etc");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	String dog_sql = "INSERT INTO dog(serial_number, protector_name, dog_name, species, color, birth, gender, fixing, weight, chip, vaccin, allergic, etc) VALUES";
	dog_sql+="('" + serial_number + ", " + protector_name + ", " + dog_name + ", " + species + ", " + color + ", " + birth + ", " + gender + ", " + fixing + ", " + weight + ", " + chip + ", " + vaccin + ", " + allergic + ", " + etc + "')";
	
	String protector_sql = "INSERT INTO protector(protector_name, phone, address) VALUES";
	protector_sql+="('" + protector_name + ", " + phone + ", " + address + "')";
	
	String member_sql = "INSERT INTO member(id, password) VALUES";
	member_sql += "('" + serial_number + ", " + phone + "')";
	
	Statement dsm = conn.createStatement();
	Statement psm = conn.createStatement();
	Statement msm = conn.createStatement();
	
	int dcount = dsm.executeUpdate(dog_sql);
	int pcount = psm.executeUpdate(protector_sql);
	int mcount = msm.executeUpdate(member_sql);
	
	if(dcount==1 && pcount==1){
		out.println("회원 등록에 성공했습니다. ");
		response.sendRedirect("login.jsp");
	}
	
	else{
		out.println("등록 실패! 입력 내용을 다시 한번 확인해 주세요. ");
		response.sendRedirect("singup.jsp");
	}
	
	dsm.close();
	psm.close();
	conn.close();
%>
