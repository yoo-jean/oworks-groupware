<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <title>자유게시판 상세</title>
    <style>
        .outer{
            margin: auto;
            margin-top: 50px;
            margin-bottom: 20px;
            width:700px;
        }
        .innerOuter{
            border:1px solid lightgray;
            width:800px;
            margin:auto;
            padding:5% 5%;
            background:white;
        }

        #text1{
            font-size:x-large; 
            font-weight: bold; 
            color: rgb(94, 94, 94);
        }
        #text1{
            font-size:x-large; 
            font-weight: bold; 
            color: rgb(94, 94, 94);
        }
        #text2{
            color: rgb(94, 94, 94);
        }
        #enrollForm>table{width:700px;}
        #enrollForm>table *{ margin:5px;}
    </style>
</head>
<body>

    <!-- 이쪽에 헤더바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 이쪽에 메뉴바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <div class="outer">
        <br><br>
        <div class="innerOuter">
            <h2 id="text1">자유게시판 상세</h2><hr>

            <form id="enrollForm" method="post" action="" enctype="">
                <table align="center">
                    <tr>
                        <td><label for="title"><b>제목</b></label>&emsp;&emsp;&emsp;자유게시판 제목입니당</td>
                    </tr>
                    <tr>
                        <td style="width:400px;"><label for="writer"><b>작성자</b></label>&emsp;&emsp;홍길동</td>
                        <td><label for="writer"><b>작성일</b></label>&emsp;&emsp;2021-06-01</td>
                    </tr>
                    <tr>
                        <td><label for="title"><b>조회수</b></label>&emsp;&emsp;&nbsp;10</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-top: 30px;"><label for="content"><b>내용</b></label><hr></td>
                    </tr>
                    <tr>
                        <td colspan="4"><p style="height:150px">&nbsp;&nbsp;내용자리 내용자리</p></td>
                    </tr>
                </table>
                <br><br><br><br>

                <div id="btn" align="center">
                    <!-- 글 작성한 사람만 보이는 수정/삭제 버튼 -->
                    <a class="btn btn-primary btn-sm" href=""><b>수정</b></a>&nbsp;
                    <a class="btn btn-danger btn-sm" href=""><b>삭제</b></a>&nbsp;
                    <!-- 모두에게 보이는 버튼 -->
                    <a class="btn btn-secondary btn-sm" href=""><b>목록</b></a>&nbsp;
                </div>
                
            </form>
            <br><br>
            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                       <td colspan="3"><img src="images/reply.png" style="width: 40px; height: 40px;"><b>댓글 <span id="rcount">3</span>개</b></td> 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>홍길동</th>
                        <td>첫번째 댓글입니다</td>
                        <td>&emsp;2020-06-02</td>
                    </tr>
                    <tr>
                        <th>강개순</th>
                        <td>두번째 댓글입니다</td>
                        <td>&emsp;2020-06-08</td>
                    </tr>
                    <tr>
                        <th>김개똥</th>
                        <td>세번째 댓글입니다</td>
                        <td>&emsp;2020-06-10</td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" name="reContent" id="reContent" cols="70" rows="1" style="resize:none; width:100%; "></textarea>
                        </th>
                        <th style="vertical-align: middle"><button class="btn btn-primary"><b>등록하기</b></button></th>
                    </tr>
                </tbody>
            </table>
        </div>
        <br><br>
    </div>
</body>
</html>