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
    <title>자유게시판 작성</title>
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
            <h2 id="text1">자유게시판 작성</h2><hr>

            <form id="enrollForm" method="post" action="" enctype="">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="fbTitle" class="form-control" name="fbTitle" required placeholder="제목을 입력하세요."></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="empNo" class="form-control" value="user01" name="empNo" readonly></td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="fbContent" id="fbContent" rows="10" style="resize:none;" placeholder="내용을 입력하세요."></textarea></th>
                    </tr>
                </table>
                <br>

                <div id="btn" align="center">
                    <a class="btn btn-primary btn-sm" href=""><b>등록</b></a>&nbsp;
                <a class="btn btn-secondary btn-sm" href=""><b>이전</b></a>&nbsp;
                </div>
            </form>
        </div>
        <br><br>
    </div>


</body>
</html>