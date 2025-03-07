<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
<%@page import = "java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>🐶댕구르르🐶</title>
        <link rel="stylesheet" href="css/calendar.css?after">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@300;400;700&display=swap" rel="stylesheet">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    </head>
    
    <body>
        <%
            Statement stmt = conn.createStatement();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            List<String> attendanceDates = new ArrayList<>(); // 출석 날짜를 저장할 리스트
			
            String serial = request.getParameter("serial_number");
            String name = request.getParameter("dog_name");
            
            try {
                
                
                // dog_name과 출석 날짜를 한 번에 가져오는 쿼리
                String sql = "SELECT dog_name, date FROM date JOIN dog ON date.id = dog.serial_number WHERE dog.serial_number=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, serial);
                rs = pstmt.executeQuery();
                
                // 결과 출력
                while (rs.next()) {
                    String dog_name = rs.getString("dog_name");
                    String strdate = rs.getString("date"); // VARCHAR로 저장된 날짜
                    
                    // date 컬럼에서 가져온 값을 "yyyy-MM-dd" 형식으로 파싱
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd kk:mm");
                    Date numdate = formatter.parse(strdate);
                    
                    // numdate를 "yyyy-MM-dd" 형식으로 변환하여 출석 날짜 리스트에 추가
                    SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd kk:mm");
                    String numdateStr = dateFormatter.format(numdate);
                    attendanceDates.add(numdateStr);
                }
            } catch (SQLException ex) {
                out.println("dog 테이블 호출 실패 ");
                out.println("SQLException: " + ex.getMessage());
            } catch (ParseException ex) {
                out.println("날짜 파싱 오류: " + ex.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
		
		<h1> "<%=name %>" 출석 현황 </h1>
        <div id="calendar"></div>
        
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    headerToolbar: {
                        start: 'prev next today',
                        center: 'title',
                        end: 'dayGridMonth,dayGridWeek,dayGridDay'
                    },
                    titleFormat: function(date) {
                        return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
                    },
                    selectable: true,
                    droppable: true,
                    editable: true,
                    nowIndicator: true,
                    locale: 'ko',
                    
                    // 서버에서 가져온 출석 날짜에 이미지 추가
                    events: [
                        <%
                            for (String date : attendanceDates) {
                                // FullCalendar는 이벤트를 JSON 형식으로 받아들임
                        %>
                        {
                            title: "<%= date %>",
                            start: "<%= date %>", // 출석 날짜
                            description: "출석한 날짜",
                        },
                        <%
                            }
                        %>
                    ]
                });

                calendar.render();
            });
        </script>
    </body>
</html>