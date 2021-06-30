<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>O work's GroupWare</title>
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
    /* 세부 페이지마다 공통적으로 유지할 style */
    div {
        outline: 1px solid violet;
        box-sizing: border-box;
    }
    .wrap {
        margin: auto;
    }
    .wrap>div {
        width: 100%;
    }
    #header>div, #content>div {
        float: left;
        height: 100%;
    }
    #header { /*높이는 나중에 수정할수도*/
        height: 80px;
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #ddd;
    }
    #content { /*높이는 나중에 수정할수도*/
        height: 820px;
    }
    #content_1 {
        width: 200px;
    }
    #content_2 {
        width: 85%;
        padding: 20px 10px;
    }

    /*header 관련 style*/
    #header_logo>img {
        height: 60px;
    }
    #header_logo, #header_list {
        display: flex;
        align-items: center;
        list-style-type: none;
    }
	#header_list {
		margin-top: 23px;
	}
    .header_link {
        position: relative;
        margin-right: 15px;
        color: gray;
    }
    .header_notification {
        position: absolute;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: orange;
        width: 25px;
        height: 25px;
        border-radius: 15px;
        color: white;
        font-weight: 600;
        left: 15px;
        bottom: 15px;
    }
    .header_notification:hover {
        background-color: #339AF0;
    }
</style>
</head>
<body>

<div id="header">
	
    <div id="header_logo">
    	<img src="resources/images/oworks_logo.png">
    </div>
    <ul id="header_list">
        <li class="header_btn">
            <a class="header_link" href="#">
                <i class="far fa-comment-dots fa-2x"></i>
                <span class="header_notification">2</span>

            </a>
        </li>
        <li class="header_btn">
            <a class="header_link" href="#"><i class="far fa-user fa-2x"></i></a>
        </li>
        <li class="header_btn">
            <a class="header_link" href="#"><i class="fas fa-sign-out-alt fa-2x"></i></a>
        </li>
    </ul>
</div>

<script
  src="https://kit.fontawesome.com/6478f529f2.js"
  crossorigin="anonymous"
></script>

</body>
</html>