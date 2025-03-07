<!-- 강아지 상세 정보 리스트  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
<%@page import = "java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <title>🐶댕구르르🐶</title>
        <link rel="stylesheet" href="css/dogs_detail.css?after"/>
    </head>
 <body>
        <%@ include file = "innerheader.jsp" %>
        <h1> 상세 정보 </h1>
		<br>
		
        <table class="detail">
			<thead>
				<th> 등록<br>번호 </th>
				<th> 보호자 </th>
				<th> 강아지<br>이름 </th>
				<th> 종 </th>
				<th> 색깔 </th>
				<th> 생년<br>월일 </th>
				<th> 성별 </th>
				<th> 중성화 </th>
				<th> 몸무게 </th>
				<th> 인식칩 </th>
				<th> 접종 </th>
				<th> 알레<br>르기 </th>
				<th> 이용권 </th>
				<th> 출석 </th>
				<th> 연락처 </th>
				<th> 주소 </th>
				<th> 기타 </th>
			</thead>
				
			<%
				Statement stmt = conn.createStatement();
				ResultSet rs = null;
					
				try{
					String serial=request.getParameter("serial_number");
					
					String sql="SELECT * FROM dog, protector WHERE dog.protector_name=protector.protector_name AND dog.serial_number = ? ORDER BY dog_name";
					PreparedStatement pstmt = conn.prepareStatement(sql);
	                pstmt.setString(1, serial);
					
	                rs = pstmt.executeQuery();
						
					while(rs.next()){
						String serial_number = rs.getString("serial_number");
						String protector_name = rs.getString("protector_name");
						String dog_name = rs.getString("dog_name");
						String species = rs.getString("species");
						String color = rs.getString("color");
						String birth = rs.getString("birth");
						String gender = rs.getString("gender");
						Boolean fixing = rs.getBoolean("fixing");
						float weight = rs.getFloat("weight");
						Boolean chip = rs.getBoolean("chip");
						Boolean vaccin = rs.getBoolean("vaccin");
						String allergic = rs.getString("allergic");
						int ticket = rs.getInt("ticket");
						int attend = rs.getInt("attend");
						String phone = rs.getString("phone");
						String address = rs.getString("address");
						String etc = rs.getString("etc");
						
						String sfixing, schip, svaccin;
						
						if(fixing.equals(true)){
							sfixing="O";
						}
						
						else{
							sfixing="X";
						}
						
						if(chip.equals(true)){
							schip="O";
						}
						
						else{
							schip="X";
						}
						
						if(vaccin.equals(true)){
							svaccin="O";
						}
						
						else{
							svaccin="X";
						}
			%>
			
			
				<tbody>
					<tr>
						<td><%=serial_number %></td>
						<td><%=protector_name %></td>
						<td><%=dog_name %></td>
						<td><%=species %></td>
						<td><%=color %></td>
						<td><%=birth %></td>
						<td><%=gender %></td>
						<td><%=sfixing %></td>
						<td><%=weight %>kg</td>
						<td><%=schip %></td>
						<td><%=svaccin %></td>
						<td><%=allergic %></td>
						<td><%=ticket %></td>
						<td><%=attend %></td>
						<td><%=phone %></td>
						<td><%=address %></td>
						<td><%=etc %></td>
						
						<form method="post" action="update_dogs.jsp" id="update">
							<input type="hidden" name="serial_number" value="<%= serial_number %>">
							<td><input class="fix" type="submit" value=" 수정 ">
						</form>
						
						<form method="post" action="member_delete.jsp">
							<input type="hidden" name="id" value="<%= serial_number %>">
							<input type="hidden" name="password" value="<%= phone %>">
							<td><input type="submit" id="delete" value="삭제"></td>
						</form>
					</tr>
				</tbody>
			</table>
			
			<form method="post" action="detail_calendar.jsp" target="_blank">
				<input type="hidden" name="dog_name" value="<%= dog_name %>">
				<input type="hidden" name="serial_number" value="<%= serial_number %>">
				<button type="submit">출석<br>현황</button>
			</form>

			<%
					}
				} catch(SQLException ex){
					out.println("dog 테이블 호출 실패 ");
					out.println("SQLException: " + ex.getMessage());
				} finally{
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				}
			%>
		

        <%@ include file="footer.jsp" %>
    </body>
</html>