<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약내역</title>
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
        #text2{font-weight: bold;}
        .listArea{
            border-top: 1px solid black; 
            border-bottom: 1px solid black;
            text-align: center;
            margin-top: 10px;
        }
        .listArea>tbody>tr:hover{
            cursor:pointer;
            background: rgba(37, 116, 219, 0.678);
            color: white;
        }
        .listArea>tbody>tr{height: 35px;}
        #head{background: rgb(237, 237, 237);}
        #top{height: 40px;}
        #btn2{
            border: 1px solid rgb(237, 237, 237);
            color: black;
            background-color: rgb(237, 237, 237);
            border-radius: 5px;
            padding: 6px;
            }
        #btn2:hover{background-color: rgba(37, 116, 219, 0.9); color:white;}
        .page{font-size: medium; margin-right: 40px;}
        .listArea>tbody>tr{height: 60px;}
        #top{height: 60px;}
        #pagingArea{width:fit-content;margin:auto;}
    </style>
</head>
<body>
    <!-- 이쪽에 헤더바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 이쪽에 메뉴바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

     <div class="outer">
        <span id="text1">전체 예약내역</span><hr>

        <table class="listArea">
            <thead id="head">
                <tr id="top">
                    <th width="60">순번</th>
                    <th width="320">회의제목</th>
                    <th width="70">예약자</th>
                    <th width="270">예약시간</th>
                    <th width="80">참석인원</th>
                </tr>
            </thead>
            <tbody>   
                <tr>
                    <td>5</td>
                    <td>파이널 프로젝트 회의</td>
                    <td>홍길동</td>
                    <td>2021-05-29&nbsp;&nbsp;09:00 ~ 10:00</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>화면구현 회의</td>
                    <td>선동일</td>
                    <td>2021-05-29&nbsp;&nbsp;10:00 ~ 11:00</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>회의 제목입니다3</td>
                    <td>유재식</td>
                    <td>2021-05-29&nbsp;&nbsp;11:00 ~ 12:00</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>회의 제목입니다2</td>
                    <td>정중하</td>
                    <td>2021-05-29&nbsp;&nbsp;12:00 ~ 13:00</td>
                    <td>4</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>회의 제목입니다1</td>
                    <td>방명수</td>
                    <td>2021-05-29&nbsp;&nbsp;13:00 ~ 14:00</td>
                    <td>3</td>
                </tr>
            </tbody>
        </table>
        <br>

        <div id="pagingArea">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#"><<</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item disabled"><a class="page-link" href="#">>></a></li>
            </ul>
        </div>

    </div>

    <script>
        
    </script>    
</body>
</html>