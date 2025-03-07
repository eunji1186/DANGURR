<!-- 설정  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <title>🐶댕구르르🐶</title>
        <link rel="stylesheet" href="css/setting.css?after"/>
    </head>
 <body>
       <%@ include file="innerheader.jsp" %>

        <a href="signup.jsp">
        	<div class="container">
	        	<img src="images/backpack.png" width="200px" height="200px">
        		<div class="item">강아지등록 </div>	
        	</div>
        </a>
        
        <a href="dogs.jsp">
	        <div class="container">
	        	<img src="images/search.jpg" width="200px" height="200px">
	        	<div class="item"> 회원조회 </div>	
	        </div>
        </a>
        <!-- 
        <a href="signup_sheet.jsp">
	        <div class="container">
	        	<img src="images/document.png" width="200px" height="200px">
	        	<div class="item"> 등록 원서 양식 </div>		
	        </div>
        </a>
        
        <a href="a.jsp">
	        <div class="container">
	        	<div class="item"> 하나정도 더 있으면 좋겠는디 </div>		
	        </div>
        </a>
        
         -->
        <%@ include file="footer.jsp" %>
    </body>
</html>