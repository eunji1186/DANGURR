<!-- 수익내역  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <title>🐶댕구르르🐶</title>
        <link rel="stylesheet" href="css/profit.css"/>
    </head>
 <body>
        <%@ include file="innerheader.jsp" %>
		
		<h1> 수익 목록 </h1>
		
		<table>
			<thead>
				<tr>
					<th> 날짜 </th>
					<th> 항목 </th>
					<th> 금액 </th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<th scope="row"> 2024-11-28 </th>
					<td> 칸쵸 감자 쇼 </td>
					<td> 500,000 </td>
				</tr>
				
				<tr>
					<th scope="row"> 2024-11-28 </th>
					<td> 호시 학학 쇼 </td>
					<td> 500,000 </td>
				</tr>
			</tbody>
		</table>

        <%@ include file="footer.jsp" %>
    </body>
</html>