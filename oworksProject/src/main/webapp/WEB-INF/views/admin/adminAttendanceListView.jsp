<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - 근태통계</title>
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
    /*테이블 관련 스타일*/
    .attendance_nav {
        display: flex;
        align-items: center;
        margin: 15px 0;
    }
    #sort_year, #sort_department, #sort_job {
        width: 130px;
        height: 35px;
        margin-right: 10px;
    }
    .btn-primary {
        width: 80px;
        height: 35px;
        margin-right: 10px;
    }
    .btn-outline-primary {
        width: 150px;
        height: 35px;
    }
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
                
                <h4>근태 통계</h4>

                <div class="attendance_nav">
                	<form action="adList.at">
	                    <select name="deptCode" id="sort_department">
	                        <option value="" selected disabled hidden>부서</option>
	                        <option value="D1">개발부</option>
	                        <option value="D2">인사부</option>
	                        <option value="D3">영업부</option>
	                        <option value="D4">기획부</option>
	                        <option value="D5">마케팅부</option>
	                    </select>
	                    <select name="jobCode" id="sort_job">
	                        <option value="" selected disabled hidden>직급</option>
	                        <option value="J2">부장</option>
	                        <option value="J3">과장</option>
	                        <option value="J4">대리</option>
	                        <option value="J5">사원</option>
	                    </select>
	                    <button type="submit" class="btn btn-primary">검색</button>
                    </form>
                    <a href="adDailyList.at"><button class="btn btn-outline-primary">일일 출퇴근 현황</button></a>
                </div>

                <table class="attendanceList">
                    <tr>
                        <th>번호</th>
                        <th>소속</th>
                        <th>직위</th>
                        <th>사원명</th>
                        <th>지각</th>
                        <th>조퇴</th>
                        <th>휴가</th>
                        <th>출근</th>
                        <th>발생휴가</th>
                        <th>사용휴가</th>
                        <th>잔여휴가</th>
                        <th>누적<br>근무시간(연)</th>
                        <th>일 평균<br>근무시간</th>
                    </tr>
                    <% int i = 0; %>
                    <c:forEach var="a" items="${ list }"  varStatus="status">
                    <c:set var="sq" value="${status.index + 1 + (pi.currentPage-1) * 10}"/>
	                    <tr>
	                        <td><c:out value="${sq}"/></td>
	                        <td>${ a.deptName }</td>
	                        <td>${ a.jobName }</td>
	                        <td>${ a.empName }</td>
	                        <td>${ a.workStatusLate }</td>
	                        <td>${ a.workStatusEarly }</td>
	                        <td>${ a.workStatusOff }</td>
	                        <td>${ a.workStatusOn }</td>
	                        <td>${ a.offGiven }</td>
	                        <td>${ a.offUsed }</td>
	                        <td>${ a.offAvailable }</td>
	                        <td>${ a.workStatusSum }</td>
	                        <td>${ a.workTimeAvg }</td>
	                    </tr>
					</c:forEach>
                </table>
                
				<br>
				
                <div id="pagingArea">
                	<ul class="pagination">
                		
                		<c:choose>
                			<c:when test="${ pi.currentPage eq 1}">
	                			<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item"><a class="page-link" href="adList.at?currentPage=${ pi.currentPage-1 }">&lt;</a></li>
                			</c:otherwise>
                		</c:choose>
                		                		
                		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                			<li class="page-item"><a class="page-link" href="adList.at?currentPage=${ p }">${ p }</a></li>
                		</c:forEach>
                		
                		<c:choose>
                			<c:when test="${ pi.currentPage eq pi.maxPage}">
	                			<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
	                		</c:when>
	                		<c:otherwise>
		                		<li class="page-item"><a class="page-link" href="adList.at?currentPage=${ pi.currentPage+1 }">&gt;</a></li>
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