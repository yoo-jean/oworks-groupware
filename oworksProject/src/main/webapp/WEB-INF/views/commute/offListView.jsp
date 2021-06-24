<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>O work's - 휴가현황</title>
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
    .offList{
        text-align: center;
        font-size: 13px;
        width: 100%;
    }
    .offList>tbody>tr:hover{
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

                <table class="offList" text-align="center">
                    <tr>
                        <th>근속연수</th>
                        <th>발생연차</th>
                        <th>사용연차</th>
                        <th>잔여연차</th>
                    </tr>
                    <tr>
                        <td>1년 2개월</td>
                        <td>20</td>
                        <td>5</td>
                        <td>15</td>
                    </tr>
                </table>

                <br><br>

                <h4>휴가 사용 내역</h4>

                <table class="offList">
                    <tr>
                        <th>번호</th>
                        <th>분류</th>
                        <th>휴가일</th>
                        <th>사용휴가</th>
                        <th>사유</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>병가</td>
                        <td>2021-02-15</td>
                        <td>1</td>
                        <td>감기몸살</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>경조사</td>
                        <td>2021-04-10</td>
                        <td>1</td>
                        <td>지인 결혼식</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>보건휴가</td>
                        <td>2021-05-26</td>
                        <td>1</td>
                        <td>보건휴가</td>
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