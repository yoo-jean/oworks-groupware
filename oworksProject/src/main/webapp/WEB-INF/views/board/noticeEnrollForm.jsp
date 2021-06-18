<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
    .content{
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 15%;
        background:white;
    }
    
    #updateForm>table{width:100%;}
    #updateForm>table *{ margin:5px;}
</style>
</head>
<body>
	
    <!-- 이쪽에 메뉴바 포함 할꺼임 -->


    <div class="content">
        <br><br>
        <div class="innerOuter">
            <br>

            <form id="updateForm" method="post" action="insert.no" enctype="">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" value="${n.noticeTitle }" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="10002" name="empNo" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="">
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="noticeContent" id="content" rows="10" style="resize:none;">${n.noticeContent }</textarea></th>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="button" class="btn btn-outline-dark btn-sm">취소하기</button>
                    <button type="submit" class="btn btn-dark btn-sm">작성하기</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>
  
    <!-- 이쪽에 푸터바 포함할꺼임 -->
</body>
</html>