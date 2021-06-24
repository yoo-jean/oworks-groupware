<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - 휴가현황</title>
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
    .off_nav {
        display: flex;
        align-items: center;
        margin: 15px 0;
    }
    label {
        margin-right: 10px;
    }
    .off_nav_date, .off_nav_search {
        width: 200px;
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
    .off_list{
        text-align: center;
        font-size: 13px;
        width: 100%;
    }
    .off_list>tbody>tr:hover{
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
                
                <h4>휴가 현황</h4>

                <div class="off_nav">
                    <input type="date" class="off_nav_date">
                    <input type="radio" class="off_nav_sort" checked><label for="1">전체</label>
                    <input type="radio" class="off_nav_sort"><label for="2">입사1년미만</label>
                    <input type="radio" class="off_nav_sort"><label for="3">입사1년이상</label>
                    <input type="text" class="off_nav_search" name="emp_name" placeholder="사번/사원명">
                    <button type="submit" class="btn btn-primary">검색</button>
                    <button url="#" class="btn btn-outline-primary">휴가분류관리</button>
                </div>

                <table class="off_list">
                    <tr>
                        <th>번호</th>
                        <th>소속</th>
                        <th>직위</th>
                        <th>사원명</th>
                        <th>지각</th>
                        <th>조퇴</th>
                        <th>결근</th>
                        <th>발생휴가</th>
                        <th>사용휴가</th>
                        <th>잔여휴가</th>
                        <th>누적<br>근무시간(연)</th>
                        <th>일 평균<br>근무시간</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>개발1팀</td>
                        <td>과장</td>
                        <td>오상식</td>
                        <td>0</td>
                        <td>1</td>
                        <td>0</td>
                        <td>19</td>
                        <td>0</td>
                        <td>19</td>
                        <td>225시간</td>
                        <td>9시간</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>개발1팀</td>
                        <td>과장</td>
                        <td>오상식</td>
                        <td>0</td>
                        <td>1</td>
                        <td>0</td>
                        <td>19</td>
                        <td>0</td>
                        <td>19</td>
                        <td>225시간</td>
                        <td>9시간</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>개발1팀</td>
                        <td>과장</td>
                        <td>오상식</td>
                        <td>0</td>
                        <td>1</td>
                        <td>0</td>
                        <td>19</td>
                        <td>0</td>
                        <td>19</td>
                        <td>225시간</td>
                        <td>9시간</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>개발1팀</td>
                        <td>과장</td>
                        <td>오상식</td>
                        <td>0</td>
                        <td>1</td>
                        <td>0</td>
                        <td>19</td>
                        <td>0</td>
                        <td>19</td>
                        <td>225시간</td>
                        <td>9시간</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>개발1팀</td>
                        <td>과장</td>
                        <td>오상식</td>
                        <td>0</td>
                        <td>1</td>
                        <td>0</td>
                        <td>19</td>
                        <td>0</td>
                        <td>19</td>
                        <td>225시간</td>
                        <td>9시간</td>
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