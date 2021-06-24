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

	/*content1 메뉴바 관련 style*/
    /* Fixed sidenav, full height */
    .sidenav {
    height: 820px;
    width: 200px;
    /*position: fixed;*/
    z-index: 1;
    top: 0;
    left: 0;
    background-color: lightgray;
    overflow-x: hidden;
    padding-top: 20px;
    }

    /* Style the sidenav links and the dropdown button */
    .sidenav a, .dropdown-btn {
    padding: 6px 8px 6px 16px;
    text-decoration: none;
    font-size: 16px;
    font-weight: 600;
    color: #636363;
    display: block;
    border: none;
    background: none;
    width: 100%;
    text-align: left;
    cursor: pointer;
    outline: none;
    }

    /* On mouse-over */
    .sidenav a:hover, .dropdown-btn:hover {
    color: rgb(241, 196, 15);
    }

    /* Main content */
    .main {
    margin-left: 200px; /* Same as the width of the sidenav */
    font-size: 15px; /* Increased text to enable scrolling */
    padding: 0px 10px;
    }

    /* Add an active class to the active dropdown button */
    .active {
    background-color: #1D8CDC;
    color: white;
    }

    /* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
    .dropdown-container {
    display: none;
    background-color: #FFFFFF;
    padding-left: 8px;
    }

    /* Optional: Style the caret down icon */
    .fa-angle-down {
    float: right;
    padding-right: 8px;
    }

    /* Some media queries for responsiveness */
    @media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
    }    
</style>
</head>
<body>

    <div class="sidenav">
        <button class="dropdown-btn"><i class="fas fa-envelope"></i> 메일함 
            <i class="fa fa-angle-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">메일작성</a>
            <a href="#">받은메일함</a>
            <a href="#">보낸메일함</a>
            <a href="#">내게쓴메일함</a>
            <a href="#">휴지통</a>
        </div>
        
        <button class="dropdown-btn"><i class="fas fa-calendar"></i> 일정 
            <i class="fa fa-angle-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">전체일정</a>
            <a href="#">개인일정</a>
            <a href="#">O Works'일정</a>
            <a href="#">일정등록</a>
        </div>
        
        <button class="dropdown-btn"><i class="fas fa-check-square"></i> 회의실예약 
            <i class="fa fa-angle-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">예약하기</a>
            <a href="#">예약내역</a>
        </div>
        
        <button class="dropdown-btn"><i class="fas fa-file-alt"></i> 전자결재 
            <i class="fa fa-angle-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">기안하기</a>
            <a href="#">결재함</a>
            <a href="#">임시저장함</a>
        </div>
        
        <button class="dropdown-btn"><i class="fas fa-users"></i> 인사관리 
            <i class="fa fa-angle-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">출퇴근관리</a>
            <a href="#">휴가관리</a>
            <a href="#">근무현황</a>
            <a href="#">임직원조회</a>
        </div>
        
        <button class="dropdown-btn"><i class="fas fa-address-book"></i> 주소록 
            <i class="fa fa-angle-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">전체주소록</a>
            <a href="#">즐겨찾는주소록</a>
        </div>
        
        <button class="dropdown-btn"><i class="fas fa-clipboard"></i> 게시판 
            <i class="fa fa-angle-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">공지사항</a>
            <a href="#">자유게시판</a>
        </div>
        
        <button class="dropdown-btn"><i class="fas fa-cog"></i> 관리자 
            <i class="fa fa-angle-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">사원관리</a>
            <a href="#">직위/직무관리</a>
            <button href="#" class="dropdown-btn">근무관리
                <i class="fa fa-angle-down"></i>
            </button>
            <div class="dropdown-container">
            <a href="#">근태</a>
            <a href="#">휴가</a>
            </div>
            <button href="#" class="dropdown-btn">결재관리
                <i class="fa fa-angle-down"></i>
            </button>
            <div class="dropdown-container">
            <a href="#">전체문서목록</a>
            <a href="#">삭제문서목록</a>
            <a href="#">양식함 관리</a>
            </div>
        </div>
        
    </div>
        
        
    <script>
    /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
    var dropdown = document.getElementsByClassName("dropdown-btn");
    var i;
    
    for (i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
    dropdownContent.style.display = "none";
    } else {
    dropdownContent.style.display = "block";
    }
    });
    }
    </script> 


    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
</body>
</html>