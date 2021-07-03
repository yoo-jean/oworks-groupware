<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 상세페이지</title>
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
        <h3 class="title">자료실 상세 보기</h3>
        <br>
        <br>
        <br><br>

        <table align="center" style="border:1px solid rgb(227, 227, 227);" class="table">
            <tr>
                <th width="10%">제목</th>
                <td height="30px" colspan="5">${ b.boardTitle }</td>
            </tr>
            <tr>
                <th width="10%">작성자</th>
                <td width="25%">${ b.boardWriter }</td>

                <th width="10%">작성일</th>
                <td height="30px" width="24%">${ b.createDate }</td>


                <th width="10%">조회수</th>
                <td width="15%">${ b.count }</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="5" >
                    <p>${ b.boardContent }</p>
                </td>
            </tr>
            <tr>
                <th height="40px">첨부파일</th>
                <td colspan="5">${ b.originName } </td>
            </tr>
        </table>

        <div id="btn" align="center">
            <!-- 수정과 삭제는 본인 및 관리자한테만 노출 -->
            <a class="btn btn-primary btn-sm" href="">수정</a>&nbsp;
            <a class="btn btn-secondary btn-sm" href="">목록</a>&nbsp;
            <a class="btn btn-danger btn-sm" href="">삭제</a>&nbsp;
        </div>

    </div>

</body>
</html>