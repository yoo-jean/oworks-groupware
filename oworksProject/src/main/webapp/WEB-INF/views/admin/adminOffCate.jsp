<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - 휴가 분류 관리</title>
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
    /*작성 폼 관련 스타일*/
    .offCate {
        display: flex;
    }
    .offCate_enroll_btn {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 20px;
    }
    .offCate_enroll_text>input {
        width: 300px;
        height: 35px;
        margin: 0 0 20px 10px;
    }
    .btn-primary, .btn-outline-primary {
        width: 80px;
        height: 35px;
        margin-left: 10px;
    }
    /*테이블 관련 스타일*/
    .offCate_list{
        text-align: center;
        font-size: 13px;
        width: 400px;
        margin-right: 80px;
    }
    .offCate_list>tbody>tr:hover{
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
                
                <h4>휴가 분류 관리</h4>
                <br>
                
                <div class="offCate">
                    <table class="offCate_list">
                        <tr>
                            <th>번호</th>
                            <th>휴가분류</th>
                            <th>휴가일수</th>
                        </tr>
                        <c:forEach var="a" items="${ offCate }">
	                        <tr>
	                            <td>${ a.offCateNo }</td>
	                            <td>${ a.offCateName }</td>
	                            <td>${ a.offCateDay }</td>
	                        </tr>
                        </c:forEach>
                    </table>
                    <form class="offCate_enroll" action="insertCate.of">
                        <div class="offCate_enroll_btn">
                            <button type="submit" class="btn btn-primary">저장</button>
                            <button type="submit" class="btn btn-outline-primary">삭제</button>
                        </div>
                        <div class="offCate_enroll_text">
                            <span>휴가 분류</span> <input type="text" id="cate" name="offCateName" placeholder="휴가 분류명을 입력하세요" required><br>
                            <span>휴가 일수</span> <input type="text" id="day" name="offCateDay" placeholder="숫자만 입력하세요 (ex. 1)" required>
                        </div>
                    </form>
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