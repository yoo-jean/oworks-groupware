<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회의실 예약 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
        .outer{
            margin: auto;
            margin-top: 50px;
            margin-bottom: 20px;
            width:800px;
        }
        #text1{
            font-size:x-large; 
            font-weight: bold; 
            color: rgb(94, 94, 94);
        }
        #text2{
            font-weight: bold; 
            color: red;
        }
        #text3{
            font-size: small;
            color: rgb(28, 76, 207);
        }
        
    </style>
</head>
<body>
    <!-- 이쪽에 헤더바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 이쪽에 메뉴바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <div class="outer">
        <span id="text1">회의실 예약 수정</span><hr>

        <form id="meetingEnrollForm" action="버튼클릭시 이동할페이지 연동" method="post">
            <table id="meeting" border="1" style="text-align: center;">
                <tr style="border-right: white; height: 60px;">
                    <th style="width: 140px; padding-left: 50px;"><span id="text2">*</span> 회의제목</th>
                    <td style="width: 650px;">&emsp;&emsp;&emsp;<input type="text" name="mrTitle" required value="&nbsp;회의실예약 수정하기 페이지 제목" style="width: 550px;" maxlength="30"></td>
                </tr>
                <tr style="border-right: white; height: 60px;">
                    <th style="padding-left: 50px;"><span id="text2">*</span> 예약자</th>
                    <td><b>홍길동</b></td>
                </tr>
                <tr style="border-right: white; height:65px;">
                    <th style="padding-left: 50px;"><span id="text2">*</span> 예약시간</th>
                    <td>
                        <b>
                        2021-05-29
                        <br>
                        (09:00 ~ 10:00)
                        </b>
                    </td>
                </tr>
                <tr style="border-right: white; height: 75px;">
                    <th style="padding-left: 50px;"><span id="text2">*</span> 참석인원</th>
                    <td>
                        <input type="number" name="mrPerson" max="5" min="1" placeholder="1" style="width: 100px;"><br>
                        <span id="text3">(최소 1명, 최대 5명까지 선택하실 수 있습니다.)</span>
                    </td>
                </tr>
                <tr style="border-right: white; height: 60px;">
                    <th style="padding-left: 60px;">회의내용</th>
                    <td>&emsp;&emsp;&emsp;<input type="text" name="mrContent" style="width: 550px;" maxlength="30" value="&nbsp;예약 수정하기 페이지 회의내용칸"></td>
                </tr>
            </table>
            <br>
            <div id="btn" align="center">
                <a class="btn btn-primary btn-sm" href=""><b>수정</b></a>&nbsp;
                <a class="btn btn-secondary btn-sm" href=""><b>이전</b></a>&nbsp;
            </div>
            
        </form>
        
    </div>

    <script>
        
    </script>
</body>
</html>