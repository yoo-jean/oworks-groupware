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
                
                <h4>주간 근태현황</h4>

                <div class="attendanceWeek">
                    <i class="fas fa-chevron-left"></i>
                    <div>2021/05/31 ~ 2021/06/04</div>
                    <i class="fas fa-chevron-right"></i>
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
                    <tr>
                        <td>1</td>
                        <td>2021-05-31(월)</td>
                        <td>08:20</td>
                        <td>18:00</td>
                        <td>8시간 40분</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>2021-06-01(화)</td>
                        <td>08:20</td>
                        <td>18:00</td>
                        <td>8시간 40분</td>
                        <td>0</td>
                    </tr>                    
                    <tr>
                        <td>3</td>
                        <td>2021-06-02(수)</td>
                        <td>08:20</td>
                        <td>18:00</td>
                        <td>8시간 40분</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>2021-06-03(목)</td>
                        <td>08:20</td>
                        <td>18:00</td>
                        <td>8시간 40분</td>
                        <td>0</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>2021-06-04(금)</td>
                        <td>08:20</td>
                        <td>18:00</td>
                        <td>8시간 40분</td>
                        <td>1시간</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>2021-06-05(토)</td>
                        <td> - </td>
                        <td> - </td>
                        <td> - </td>
                        <td> - </td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>2021-06-06(일)</td>
                        <td> - </td>
                        <td> - </td>
                        <td> - </td>
                        <td> - </td>
                    </tr>
                    <tr style="font-weight: bold;">
                        <td colspan="4">주간 총 근무시간</td>
                        <td>40시간 50분</td>
                        <td>1시간</td>
                    </tr>
                </table>

                <br><br>

                <h4>월간 근태현황</h4>

                <div class="attendanceWeek">
                    <i class="fas fa-chevron-left"></i>
                    <div>2021/06</div>
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