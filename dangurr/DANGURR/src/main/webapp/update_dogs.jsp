<!-- 강아지 상세 정보 수정 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%@ include file="dbConn.jsp" %>

<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <title>🐶댕구르르🐶</title>
        <link rel="stylesheet" href="css/update_dogs.css?after"/>
    </head>
 <body>
        <%@include file="innerheader.jsp" %>
        
        <%
	        Statement stmt = conn.createStatement();
			ResultSet rs = null;
			
			try{
				String serial=request.getParameter("serial_number");
				
				String sql = "SELECT * FROM dog, protector WHERE dog.protector_name = protector.protector_name AND dog.serial_number = ?";
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
					String etc = rs.getString("etc");
					int ticket = rs.getInt("ticket");
					int attend = rs.getInt("attend");
					String phone = rs.getString("phone");
					String address = rs.getString("address");				
		%>
			<div class="update">
		        <h1> "<%=dog_name %>(<%=serial_number %>)" 정보 수정 </h1>
		        <br>
		        
		        <div class="content">
		        	<form method="post" action="update.jsp">
			        	<table>
			        		<tr>
			        			<tr>
				        			<th>이름</th>
				        			<td><input type="text" name="dog_name" value="<%=dog_name %>" required></td>
				        			<th>등록번호</th>
				        			<td><input type="text" name="serial_number" value="<%=serial_number %>" required readonly></td>
				        			<th>생년월일</th>
				        			<td><input type="date" name="birth" value="<%=birth %>" required></td>
			        			<tr>
			        			
			        			<tr>
				        			<th>성별</th>
				        			<td><input type="radio" name="gender" value="남" <% if(gender.equals("남")) { %> checked <% } %>> 남
				        				 <input type="radio" name="gender" value="여" <% if(gender.equals("여")) { %> checked <% } %>> 여 </td>
				        			 
				        			<th>체중</th>
				        			<td><input type="text" name="weight" value="<%=weight %>" required>kg</td>
				        		</tr>
			        		</tr>
			        		
			        		
			        		<tr>
			        			<th>잔여 이용권</th>
			        			<td><input type="text" name="ticket" value="<%=ticket %>" required>개</td>
			        			<th>출석횟수</th>
			        			<td><input type="text" name="attend" value="<%=attend %>" required>번</td>
			        		</tr>
			        		
			        		<tr>
			        			<th>종</th>
			        			<td><input type="text" name="species" value="<%=species %>"></td>
			        			<th>색깔</th>
			        			<td><input type="text" name="color" value="<%=color %>"></td>
			        		</tr>
			        		
			        		<tr>
			        			<th>중성화</th>
			        			<td><input type="radio" name="fixing" value="true" <% if(fixing) { %> checked <% } %> required> 예  
		        					<input type="radio" name="fixing" value="false" <% if(!fixing) { %> checked <% } %>> 아니오 </td>
			        			<th>인식칩</th>
			        			<td><input type="radio" name="chip" value="true" <% if(chip) { %> checked <% } %> required> 예  
		        					<input type="radio" name="chip" value="false" <% if(!chip) { %> checked <% } %>> 아니오</td>
			        			<th>접종</th>
			        			<td><input type="radio" name="vaccin" value="true" <% if(vaccin) { %> checked <% } %> required> 예  
		        					<input type="radio" name="vaccin" value="false" <% if(!vaccin) { %> checked <% } %>> 아니오</td>
			        		</tr>
			        		
			        		<tr>
			        			<th>알레르기</th>
			        			<td colspan="3"><textarea name="allergic"><%=allergic %></textarea></td>
			        		</tr>
			        		
			        		<tr>
			        			<th>보호자</th>
			        			<td><input type="text" name="protector_name" value="<%=protector_name %>" required readonly></td>
			        			<th>연락처</th>
			        			<td><input type="text" name="phone" value="<%=phone %>" required></td>
			        		</tr>
			        		
			        		<tr>
			        			<th>주소</th>
			        			<td colspan="3"><input type="text" name="address" value="<%=address %>" required></td>
			        		</tr>
			        		
			        		<tr>
			        			<th>기타</th>
			        			<td colspan="5"><textarea name="etc"><%=etc %></textarea></td>
			        		</tr>
			        	</table>
						
						<div class="btn-container">
						    <input type="submit" id="updateBtn" value="수정">
						    </form>
						    <form method="post" action="member_delete.jsp">
						        <input type="hidden" name="id" value="<%= serial_number %>">
						        <input type="hidden" name="password" value="<%= phone %>">
						        <input type="submit" id="deleteBtn" value="삭제">
						    </form>
						</div>
					
					
				</div>
			</div>
			
		<%
				}
				} catch(SQLException ex){
					out.println("dog 테이블 호출 실패 ");
					out.println("SQLException: " + ex.getMessage());
				} finally{
					if (rs != null) rs.close();
					if (stmt != null) stmt.close();
					if (conn != null) conn.close();
				}
		%>

        <%@ include file="footer.jsp" %>
    </body>
</html>
