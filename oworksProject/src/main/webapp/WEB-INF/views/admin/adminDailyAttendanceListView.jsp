<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - 일일 출퇴근 현황</title>
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
    .attendance_nav {
        display: flex;
        align-items: center;
        margin: 15px 0;
    }
    #sort_department {
        width: 130px;
        height: 35px;
        margin-right: 10px;
    }
    .sort_search {
        width: 200px;
        height: 35px;
        margin-right: 10px;
    }
    .btn-primary {
        width: 80px;
        height: 35px;
    }
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
    #pagingArea{
    	width:fit-content;
    	margin:auto;
    }
</style>
<script>
// $(document).ready(function() { 
// 	var today = new Date();

// 	var year = today.getFullYear();
// 	var month = ('0' + (today.getMonth() + 1)).slice(-2);
// 	var day = ('0' + today.getDate()).slice(-2);

// 	var dateString = year + '-' + month  + '-' + day;
// 	$('#selectedDate').html(dateString);
	
// });

function prevDate() {
	var baseText = $('#selectedDate').text();
	
	var ymd = baseText.split('-');
	var year = ymd[0];
	var month = ymd[1] - 1;
	var day = ymd[2];
	
	var baseDate = new Date(year, month, day);
	var prevDay = new Date(baseDate.setDate(baseDate.getDate() - 1 ));
	
	var prevStr = prevDay.getFullYear() + '-' + ('0' + (prevDay.getMonth() + 1)).slice(-2) + '-' + ('0' + prevDay.getDate()).slice(-2);
	
	$('#selectedDate').html(prevStr);
	$('#workDate').val(prevStr);
	$('#dailySearch').submit();
	
}

function nextDate() {
	var baseText = $('#selectedDate').text();
	
	var ymd = baseText.split('-');
	var year = ymd[0];
	var month = ymd[1] - 1;
	var day = ymd[2];
	
	var baseDate = new Date(year, month, day);
	var nextDay = new Date(baseDate.setDate(baseDate.getDate() + 1 ));
	
	var nextStr = nextDay.getFullYear() + '-' + ('0' + (nextDay.getMonth() + 1)).slice(-2) + '-' + ('0' + nextDay.getDate()).slice(-2);
	
	$('#selectedDate').html(nextStr);
	$('#workDate').val(nextStr);
	$('#dailySearch').submit();
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
                
                <h4>일일 출퇴근 현황</h4>
                
                <form id="dailySearch" action="adDailyList.at" method="post">
                <input id="workDate" type="hidden" name="workDate"/>
                <div class="attendance_nav">
                    <select name="sort_department" id="sort_department">
                        <option value="" selected disabled hidden>부서</option>
                        <option value="d1">개발부</option>
                        <option value="d2">인사부</option>
                        <option value="d3">영업부</option>
                        <option value="d4">기획부</option>
                        <option value="d5">마케팅부</option>
                    </select>
                    <input type="text" class="sort_search" name="emp_name" placeholder="사원명">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
                
                <div class="attendanceWeek">
                    <a href="javascript:prevDate()"><i class="fas fa-chevron-left"></i></a>
                    <div id="selectedDate">${ baseDate }</div>
                    <a href="javascript:nextDate()"><i class="fas fa-chevron-right"></i></a>
                </div>
                
                <table class="attendanceList">
                    <tr>
                        <th>번호</th>
                        <th>근무일</th>
                        <th>부서</th>
                        <th>사번</th>
                        <th>사원명</th>
                        <th>출근시간</th>
                        <th>퇴근시간</th>
                        <th>근무시간</th>
                        <th>연장근무시간</th>
                    </tr>
                    <% int i = 0; %>
                    <c:forEach var="a" items="${ list }"  varStatus="status">
                    <c:set var="sq" value="${status.index + 1 + (pi.currentPage-1) * 10}"/>
	                    <tr>
	                        <td><c:out value="${sq}"/></td>
	                        <td>${ a.workDate }</td>
	                        <td>${ a.deptName }</td>
	                        <td>${ a.empNo }</td>
	                        <td>${ a.empName }</td>
	                        <td>${ a.startTime }</td>
	                        <td>${ a.endTime }</td>
	                        <td>${ a.workTime }</td>
	                        <td>${ a.afterTime }</td>
	                    </tr>
	                </c:forEach>
                    
                </table>
                </form>
				
				<br>
				
                <div id="pagingArea">
                	<ul class="pagination">
                		
                		<c:choose>
                			<c:when test="${ pi.currentPage eq 1}">
	                			<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item"><a class="page-link" href="adDailyList.at?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
                			</c:otherwise>
                		</c:choose>
                		                		
                		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                			<li class="page-item"><a class="page-link" href="adDailyList.at?currentPage=${ p }">${ p }</a></li>
                		</c:forEach>
                		
                		<c:choose>
                			<c:when test="${ pi.currentPage eq pi.maxPage}">
	                			<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
	                		</c:when>
	                		<c:otherwise>
		                		<li class="page-item"><a class="page-link" href="adDailyList.at?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
	                		</c:otherwise>
                		</c:choose>
                		
                	</ul>
                </div>
                
                
                
            </div>

        </div>

    </div>


    


    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
</body>
</html>