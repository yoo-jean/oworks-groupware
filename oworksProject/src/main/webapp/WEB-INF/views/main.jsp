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
    /*테이블 관련 스타일*/
    .main_emp, .main_menu {
        display: flex;
        padding: 13px 10px;
        width: 1080px;
        margin-left: 40px;
    }
    .main_emp, .mail_list, .notice_list {
        border: 1px solid #ddd;
        box-shadow: 5px 5px 5px lightgray;
    }
    .btn-primary, .btn-outline-primary {
        width: 80px;
        height: 32px;
        font-size: 13px;
    }
    .inout_list, .attendance_list, .mail_list, .notice_list {
        text-align: center;
        font-size: 13px;
        width: 500px;
    }
    .main_emp_today, .mail_list {
        margin-right: 60px;
    }
    /* 나의근무,근태현황,근무시간 테이블 관련 스타일*/
    .main_emp span {
        font-weight: bold;
        font-size: 18px;
        color: #636363;
    }
    .inout_list, .attendance_list {
        margin-top: 15px;
    }
    .inout_list td {
        height: 45px;
    }
    .inout_list img {
        width: 200px;
    }
    .attendance_list th,td {
        height: 50px;
    }
    /* 메일함,공지사항 테이블 관련 스타일*/
    .mail_list>tbody>tr:hover
    , .notice_list>tbody>tr:hover{
        background: rgba(241, 196, 15, 0.329);
        cursor: pointer;
    }
    .mail_list th,td
    , .notice_list th,td {
        padding: 5px;
        height: 38px;
    }
    .mail_list th
    , .notice_list th {
        font-size: 15px;
        color: #636363;
    }
</style>
</head>
<body>
	<!-- 전체 화면 -->
    <div class="wrap">
	<!-- 헤더바 -->
	<jsp:include page="common/mainHeader.jsp"/>
		
        <!-- 본문 전체 -->
        <div id="content">
            <!-- 좌측 메뉴바 -->
			<jsp:include page="common/mainMenubar.jsp"/>

            <!-- 우측 본문 -->
            <div id="content_2">

                <div class="main_emp">
                    <div class="main_emp_today">
                        <span><i class="far fa-address-card"></i> 나의 근무 현황</span>
                        <table class="inout_list">
                            <tr height="70px" style="background-color: #7ebef14b;">
                                <td rowspan="2" width="250px"  style="border-bottom: 1px solid #ddd;">사진</td>
                                <td style="font-weight: bold; font-size: 18px;">오상식 과장</td>
                            </tr>
                            <tr height="65px" style="background-color: #7ebef14b;">
                                <td style="font-size:15px; font-weight: bold; color: #4E95D1;">개발부</td>
                            </tr>
                            <tr height="70px" style="background-color: rgba(241, 241, 241, 0.432);">
                                <td colspan="2" style="font-size: 25px; font-weight: bold; color: #636363;">
                                    08:19:55
                                </td>
                            </tr>
                            <tr style="background-color: rgba(241, 241, 241, 0.432);">
                                <td><button type="submit" class="btn btn-primary">출근</button></td>
                                <td><button type="submit" class="btn btn-outline-primary">퇴근</button></td>
                            </tr>
                            <tr style="background-color: rgba(241, 241, 241, 0.432);">
                                <td style="font-size: 18px; font-weight: bold; color: #6d6d6d;">
                                    <i class="far fa-clock"></i> 08:19:55
                                </td>
                                <td style="font-size: 18px; font-weight: bold; color: #6d6d6d;">
                                    <i class="far fa-clock"></i> 00:00:00
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="main_emp_total">
                        <span><i class="fas fa-list"></i> 근태현황</span>
                        <table class="attendance_list">
                            <tr style="border-bottom: 1px solid #ddd;">
                                <th>지각</th>
                                <th>조기퇴근</th>
                                <th>결근</th>
                            </tr>
                            <tr>
                                <td>1회</td>
                                <td>1회</td>
                                <td>1회</td>
                            </tr>
                        </table>
                        <br><br>
                        <span><i class="far fa-chart-bar"></i> 근무시간</span>
                        <table class="attendance_list">
                            <tr style="border-bottom: 1px solid #ddd;">
                                <th>근무일수</th>
                                <th>총 근무시간</th>
                                <th>평균 근무시간</th>
                            </tr>
                            <tr>
                                <td>51일</td>
                                <td>224시간</td>
                                <td>8시간30분</td>
                            </tr>
                        </table>

                    </div>
                </div>
                <div class="main_menu">
                    <table class="mail_list">
                        <tr>
                            <th style="text-align: left;">&emsp;<i class="far fa-envelope"></i> 메일함</th>
                            <th style="text-align: right;"><i class="fas fa-chevron-right"></i></th>
                        </tr>
                        <tr>
                            <td>xxx대리님 자료 회신드립니다</td>
                            <td>2021-05-19</td>
                        </tr>
                        <tr>
                            <td>메일 제목입니다</td>
                            <td>2021-05-15</td>
                        </tr>
                        <tr>
                            <td>메일 제목입니다</td>
                            <td>2021-05-10</td>
                        </tr>
                        <tr>
                            <td>메일 제목입니다</td>
                            <td>2021-05-15</td>
                        </tr>
                        <tr>
                            <td>메일 제목입니다</td>
                            <td>2021-05-10</td>
                        </tr>
                    </table>
                    <table class="notice_list">
                    	<thead>
	                        <tr>
	                            <th style="text-align: left;" colspan="2">&emsp;<i class="far fa-clipboard"></i> 공지사항</th>
	                            <th style="text-align: right;"><i class="fas fa-chevron-right"></i></th>
	                        </tr>
                        </thead>
                        <tbody>
	                       	<c:forEach var = "n" items = "${list }">
		                        <tr>
		                        	<td class="nno" style="visibility:hidden;width:15px">${n.noticeNo }</td>
		                            <td>${n.noticeTitle }</td>
		                            <td>${n.enrollDate }</td>
		                        </tr>
	                        </c:forEach>
                        </tbody>
                    </table>
					
					<!-- 공지사항 상세보기 페이지로 이동 -->                    
       		        <script>
 		     			$(function(){
 		     				$(".notice_list tbody tr").click(function(){
 		     					location.href="detail.no?nno=" +$(this).children(".nno").text();
 		     			})
 		     		})
 		     		</script>
                    
                    
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