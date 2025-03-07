<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbConn.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>🐶댕구르르🐶</title>
    <link rel="stylesheet" href="css/signup.css"/>
</head>

<body>
    <%@ include file="innerheader.jsp" %>
    
    <h1> 신규 회원 등록 </h1>
    
    <div class="signup">
        <div class="content">
            <!-- 폼 시작 -->
            <form method="post" action="signupAction.jsp">
                <table>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="dog_name" required></td>
                        <th>등록번호</th>
                        <td><input type="text" name="serial_number" required></td>
                        <th>생년월일</th>
                        <td><input type="date" name="birth" required></td>
                    </tr>

                    <tr>
                        <th>성별</th>
                        <td>
                            <input type="radio" name="gender" value="남" required> 남
                            <input type="radio" name="gender" value="여"> 여
                        </td>
                        
                        <th>체중</th>
                        <td><input type="number" name="weight" required step="0.1">kg</td>
                    </tr>

                    <tr>
                        <th>잔여 이용권</th>
                        <td><input type="number" name="ticket" required>개</td>
                        <th>출석횟수</th>
                        <td><input type="number" name="attend" required>번</td>
                    </tr>

                    <tr>
                        <th>종</th>
                        <td><input type="text" name="species"></td>
                        <th>색깔</th>
                        <td><input type="text" name="color"></td>
                    </tr>

                    <tr>
                        <th>중성화</th>
                        <td>
                            <input type="radio" name="fixing" value="true" required> 예  
                            <input type="radio" name="fixing" value="false"> 아니오
                        </td>
                        
                        <th>인식칩</th>
                        <td>
                            <input type="radio" name="chip" value="true" required> 예  
                            <input type="radio" name="chip" value="false"> 아니오
                        </td>
                        
                        <th>접종</th>
                        <td>
                            <input type="radio" name="vaccin" value="true" required> 예  
                            <input type="radio" name="vaccin" value="false"> 아니오
                        </td>
                    </tr>

                    <tr>
                        <th>알레르기</th>
                        <td colspan="3"><textarea name="allergic"></textarea></td>
                    </tr>

                    <tr>
                        <th>보호자</th>
                        <td><input type="text" name="protector_name"></td>
                        <th>연락처</th>
                        <td><input type="text" name="phone" required></td>
                    </tr>

                    <tr>
                        <th>주소</th>
                        <td colspan="3"><input type="text" name="address" required></td>
                    </tr>

                    <tr>
                        <th>기타</th>
                        <td colspan="5"><textarea name="etc"></textarea></td>
                    </tr>
                    
                    <div class="btn-container">
                        <input type="submit" id="signupBtn" value="등록">
                        <input type="reset" id="resetBtn" value="다시">
                    </div>
                </table>
            </form> 
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        // 이미지 미리보기 기능 (선택한 이미지를 미리 보여주는 기능)
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('profilePreview');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</body>
</html>
