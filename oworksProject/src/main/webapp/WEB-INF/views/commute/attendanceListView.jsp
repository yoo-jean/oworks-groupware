<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>O work's - 근태현황</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- alertify 관련 --------------------------------------------------- -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
<style>
    /*네비게이션바 관련 스타일*/
    .attendanceWeek {
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 15px 0;
    }
    .attendanceWeek>div {
        margin: 0 10px;
        font-weight: bold;
        color: #4E95D1;
    }
    .fa-chevron-left, .fa-chevron-right {
    	color: #4E95D1;
    }
    /*테이블 관련 스타일*/
    .attendanceList{
        text-align: center;
        font-size: 13px;
        width: 100%;
    }
    .attendanceList>tbody>tr:hover{
        background: rgba(241, 196, 15, 0.329);
        cursor:pointer;
    }
    th, td {
        padding: 5px;
        border-bottom: 1px solid #ddd;
    }
    th {
        height: 30px;
        background-color: lightgray;
    }
    td {
        height: 35px;
    }
</style>

<script>
<%
	String flag = (String)request.getParameter("flag");
	System.out.println("flag: " + flag);
	if (flag.equals("menu")) {
		System.out.println("menu: " + flag);
%>
	$(document).ready(function() {
		var currentDay = new Date();  
		var theYear = currentDay.getFullYear();
		var theMonth = currentDay.getMonth();
		var theDate  = currentDay.getDate();
		var theDayOfWeek = currentDay.getDay();
		 
		var thisWeek = [];
		 
		for(var i=0; i<7; i++) {
		  var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
		  var yyyy = resultDay.getFullYear();
		  var mm = Number(resultDay.getMonth()) + 1;
		  var dd = resultDay.getDate();
		 
		  mm = String(mm).length === 1 ? '0' + mm : mm;
		  dd = String(dd).length === 1 ? '0' + dd : dd;
		 
		  thisWeek[i] = yyyy + '-' + mm + '-' + dd;

		}
		console.log(thisWeek);
		//var dateString = year + '-' + month  + '-' + day;
		$('#selectedDate').html(thisWeek[0] + ' ~ ' + thisWeek[6]);
		$('#start').val(thisWeek[0]);
		$('#end').val(thisWeek[6]);
		$('#weeklySearch').submit();

	});
	<%} else {
		String start = (String)request.getParameter("start");
		String end = (String)request.getParameter("end");
		System.out.println("start: " + start);
		System.out.println("end: " + end);
	%>
		$(document).ready(function() {
			$('#selectedDate').html("<%= start %>"+ ' ~ ' + '<%= end %>');
			$('#start').val("<%= start %>");
			$('#end').val('<%= end %>');
		});
	
	<%}%>

	function prevWeek() {
		
		var start = new Date($('#start').val());
		start.setDate(start.getDate()-7);
		var end = new Date($('#end').val());
		end.setDate(end.getDate()-7);
		
		var startStr = start.getFullYear() + '-' + ('0' + (start.getMonth() + 1)).slice(-2) + '-' + ('0' + start.getDate()).slice(-2);
		var endStr = end.getFullYear() + '-' + ('0' + (end.getMonth() + 1)).slice(-2) + '-' + ('0' + end.getDate()).slice(-2);
		
 		$('#start').val(startStr);
 		$('#end').val(endStr);
		$('#selectedDate').html(startStr + ' ~ ' + endStr);
		$('#weeklySearch').submit();
		
	}
	
	function nextWeek() {

		var start = new Date($('#start').val());
		start.setDate(start.getDate()+7);
		var end = new Date($('#end').val());
		end.setDate(end.getDate()+7);
		
		var startStr = start.getFullYear() + '-' + ('0' + (start.getMonth() + 1)).slice(-2) + '-' + ('0' + start.getDate()).slice(-2);
		var endStr = end.getFullYear() + '-' + ('0' + (end.getMonth() + 1)).slice(-2) + '-' + ('0' + end.getDate()).slice(-2);
		
 		$('#start').val(startStr);
 		$('#end').val(endStr);
		$('#selectedDate').html(startStr + ' ~ ' + endStr);
		$('#weeklySearch').submit();
		
	}
</script>
</head>
<body>
	<!-- 전체 화면 -->
    <div class="wrap">

	<!-- 헤더바 -->
	<jsp:include page="../common/mainHeader.jsp"/>
	
        <!-- 본문 전체 -->
        <div id="content">
            <!-- 좌측 메뉴바 -->
			<jsp:include page="../common/mainMenubar.jsp"/>
			
            <!-- 우측 본문 -->
            <div id="content_2">
                
                <h4>주간 근태현황</h4>
                
				<form id="weeklySearch" action="list.at?flag=notMenu" method="post">
				<input type="hidden" name="empNo" value="${ loginEmp.empNo }">
				<input type="hidden" name="start" id="start">
				<input type="hidden" name="end" id="end">
                <div class="attendanceWeek">
                    <a href="javascript:prevWeek()"><i class="fas fa-chevron-left"></i></a>
                    <div id="selectedDate">${ baseDate }</div>
                    <a href="javascript:nextWeek()"><i class="fas fa-chevron-right"></i></a>
                </div>

                <table class="attendanceList">
                    <tr>
                        <th>번호</th>
                        <th>근무일</th>
                        <th>출근</th>
                        <th>퇴근</th>
                        <th>기본근무시간</th>
                        <th>연장근무시간</th>
                    </tr>
                    <% int i = 0; %>
                    <c:forEach var="a" items="${ adList }"  varStatus="status">
                    <c:set var="sq" value="${status.index + 1}"/>
	                    <tr>
	                        <td><c:out value="${sq}"/></td>
	                        <td>${ a.workDate }</td>
	                        <td>${ a.startTime }</td>
	                        <td>${ a.endTime }</td>
	                        <td>${ a.workTime }</td>
	                        <td>${ a.afterTime }</td>
	                    </tr>
                    </c:forEach>
                    <tr style="font-weight: bold;">
                        <td colspan="4">주간 총 근무시간</td>
                        <td>40시간 50분</td>
                        <td>1시간</td>
                    </tr>
                </table>
				</form>
                <br><br>

                <h4>월간 근태현황</h4>

                <div class="attendanceWeek">
                    <i class="fas fa-chevron-left"></i>
                    <div>2021-06</div>
                    <i class="fas fa-chevron-right"></i>
                </div>

                <table class="attendanceList">
                    <tr>
                        <th>구분</th>
                        <th>월 소정근로시간</th>
                        <th>월 연장근로시간</th>
                        <th>총 월 근무시간</th>
                    </tr>
                    <tr>
                        <td>계획</td>
                        <td>174시간</td>
                        <td>52시간</td>
                        <td>226시간</td>
                    </tr>
                    <tr>
                        <td>현황</td>
                        <td>40시간 50분</td>
                        <td>1시간</td>
                        <td>41시간 50분</td>
                    </tr>
                </table>
                
                
            </div>

        </div>

    </div>


    


    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
</body>
</html>