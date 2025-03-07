<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>🐶댕구르르🐶</title>
        <link rel="stylesheet" href="css/main.css?after"/>
    </head>
    <body>
        <%@ include file="innerheader.jsp" %>

        <div class="dogList">        
            <h1> 원생 현황 </h1>
            <br>
            <%
                Statement stmt = conn.createStatement();
                ResultSet rs = null;

                try {
                    String sql = "SELECT serial_number, dog_name, attend, ticket FROM dog ORDER BY dog_name";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        String serial_number = rs.getString("serial_number");
                        String dog_name = rs.getString("dog_name");
                        int attend = rs.getInt("attend");
                        int ticket = rs.getInt("ticket");
            %>
            <div class="container">
            	<br>
                <div class="item"><%= dog_name %></div>
                <div class="item">(<%= serial_number %>)</div>

                <img src="${pageContext.request.contextPath}/photoView.jsp?serial_number=<%= serial_number %>" class="profile-photo" width="230px" height="230px">
                
                <div class="item2">출석: <%= attend %></div> 
                <div class="item2">이용권: <%= ticket %></div>

                <div class="btn-container">
                    <form method="post" action="attend_ticket.jsp">
                        <input type="hidden" name="serial_number" value="<%= serial_number %>">
                        <input type="hidden" name="attend" value="<%= attend %>">
                        <input type="hidden" name="ticket" value="<%= ticket %>">
                        <div class="item3"><input type="submit" id="attend" value=" 출석 "></div>
                    </form>

                    <form method="post" action="dogs_detail.jsp">
                        <input type="hidden" name="serial_number" value="<%= serial_number %>">
                        <div class="item3"><input type="submit" id="detail" value=" 상세 "></div>
                    </form>
                </div>
                <br><br>
            </div>
            &nbsp;

            <%
                    }
                } catch (SQLException ex) {
                    out.println("dog 테이블 호출 실패 ");
                    out.println("SQLException: " + ex.getMessage());
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </div>
        
        <%@include file ="footer.jsp" %>
    </body>
</html>