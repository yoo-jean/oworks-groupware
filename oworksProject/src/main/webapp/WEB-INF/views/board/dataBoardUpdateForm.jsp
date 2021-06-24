<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 글 수정</title>
    <!-- css & 폰트 -->
    <link rel="stylesheet" href="dataBoardDetail.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
    

    <!-- 부트스트랩 : 아이콘 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- 헤더바 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 메뉴바 -->
    <%-- <jsp:include page=""/> --%>

    <div class="main">
        <h3 class="title">자료실 글 수정</h3>
        <br>
        <br>
        <br><br>

        <table align="center" style="border:1px solid rgb(227, 227, 227);" class="table">
            <tr>
                <th width="13%">제목</th>
                <td height="30px" colspan="5"><input type="text" class="form-control" name="title" value="${}" placeholder="제목을 입력하세요." required></td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td height="30px" colspan="5"><input type="file" name="fileUpload" required></td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="5" >
                    <textarea name="noticeContent" id="content" rows="15" name="content" class="form-control" style="resize:none;" required>${}</textarea>
                </td>
            </tr>
        </table>

        <div id="btn" align="center">
            <a class="btn btn-primary btn-sm" href="">수정</a>&nbsp;
            <button type="button" class="btn btn-secondary btn-sm">취소</button>
        </div>

    </div>

</body>
</html>