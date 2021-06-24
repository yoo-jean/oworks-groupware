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
                
                <h4>일일 출퇴근 현황</h4>
                
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
                    <i class="fas fa-chevron-left"></i>
                    <div>2021년 6월 21일</div>
                    <i class="fas fa-chevron-right"></i>
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
                    <tr>
                        <td>1</td>
                        <td>2021-06-21(월)</td>
                        <td>개발부</td>
                        <td>1000244</td>
                        <td>오상식</td>
                        <td>8:55</td>
                        <td>19:00</td>
                        <td>9시간 5분</td>
                        <td>1시간</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>2021-06-21(월)</td>
                        <td>개발부</td>
                        <td>1000244</td>
                        <td>김땡땡</td>
                        <td>8:55</td>
                        <td>19:00</td>
                        <td>9시간 5분</td>
                        <td>1시간</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>2021-06-21(월)</td>
                        <td>개발부</td>
                        <td>1000244</td>
                        <td>장그래</td>
                        <td>8:55</td>
                        <td>19:00</td>
                        <td>9시간 5분</td>
                        <td>1시간</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>2021-06-21(월)</td>
                        <td>개발부</td>
                        <td>1000244</td>
                        <td>한석율</td>
                        <td>8:55</td>
                        <td>19:00</td>
                        <td>9시간 5분</td>
                        <td>1시간</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>2021-06-21(월)</td>
                        <td>개발부</td>
                        <td>1000244</td>
                        <td>빈센조</td>
                        <td>8:55</td>
                        <td>19:00</td>
                        <td>9시간 5분</td>
                        <td>1시간</td>
                    </tr>
                </table>

                <!--Paging바 들어갈 자리-->

            </div>

        </div>

    </div>


    


    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
</body>
</html>