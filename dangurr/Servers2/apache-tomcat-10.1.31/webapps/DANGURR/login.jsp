<!-- 로그인페이지(첫화면) -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <title>🐶댕구르르🐶</title>
        <link rel="stylesheet" href="css/login.css?after"/>
    </head>
 	<body>
 		<div class="innerHeader" style="text-align: center;">
                <h1 class="logo">
                    <a href="#">
                        <img src="images/dangurr.jpeg" width="200" height="200" >
                    </a>
                </h1>
        </div>
 		
        <div class="login-wrapper">
            <h2>로그인</h2>

            <form method="post" id="login-form" name="login-form" action="loginAction.jsp">
                <input type="text" name="id" id="id" placeholder="id">
                <input type="password" name="password" id="password" placeholder="password">
                <input type="submit" value="로그인">
            </form>
        </div>
        
        <div class="inform">
        	<fieldset>
	        	<legend> "이런 댕이들은 힘들어요" </legend>
	        	<ul>
	        		<li> 7KG 초과의 댕이 </li>
	        		<li> 중성화 수술이 안 된 댕이 </li>
	        		<li> 생후 3개월 미만의 댕이 </li>
	        		<li> 기본접종이 끝나지 않은 댕이 </li>
	        		<li> 공격 성향이 있는 댕이 </li>
	        		<li> 전염성 질환 또는 중증 질환을 앓고 있는 댕이 </li>
	        		<li> 본인이 판단하기에 문제 행동이 심한 댕이 </li>
	        	</ul>
        	</fieldset>
        </div>
		<footer>
			<a href="https://www.instagram.com/dang_gurrr?igsh=MTl1a2d2YXBpYWNhYQ==">
		    	<img src="images/instagram.webp" width="20" height="20" >
		   	</a>
		   	
		   	<br>
		   	<a> 회원만을 위한 공간입니다. 댕구르르 이용은 인스타그램을 참고해 주세요. </a>
		</footer>
    </body>
</html>