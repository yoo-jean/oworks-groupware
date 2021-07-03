<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 글 작성</title>
    <!-- css & 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
    

    <!-- 부트스트랩 : 아이콘 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <style>
	.main{
	    width:1100px;
	    margin: auto;
	    margin-top: 50px;
	    font-size:16px;
	    font-family: 'Noto Sans KR', sans-serif;
	}
	
	.title{
	    width: 50%;
	    float: left;
	    margin-top: 0px;
	    font-size: 22px;
	    font-weight: bold;
	}
	.searchForm{
	    width:41%;
	    float:right;
	    margin-top: 0px;
	    margin-bottom: 20px;
	}
	.searchForm>*{
	    float: left;
	    margin: 1.5px;
	}
	.table{
	    height:400px;
	    width: 100%;
	    color:rgb(37, 37, 37);
	    text-align: center;
	}
	.table th{
	    background-color: rgb(231, 238, 243);
	    color:rgb(68, 68, 68);
	}
	.table td{
	    text-align: left;
	}
	
	.table pre{
	    width:700px;
	    word-wrap: break-word;
	    white-space: pre-wrap;
	    font-family:'Noto Sans KR', sans-serif;
	    font-size: 16px;
	    text-align: left;
	    line-height: 1.4;
	
	}
    </style>
</head>
<body>
    <!-- 헤더바 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 메뉴바 -->
    <%-- <jsp:include page=""/> --%>

    <div class="main">
        <h3 class="title">자료실 글 작성</h3>
        <br>
        <br>
        <br><br>
	
		<form id="enrollForm" method="post" action="insert.db" enctype="multipart/form-data">
	        <table align="center" style="border:1px solid rgb(227, 227, 227);" class="table">
	            <tr>
	                <th width="13%">제목</th>
	                <td height="30px" colspan="5"><input type="text" class="form-control" name="boardTitle" placeholder="제목을 입력하세요." required ></td>
	            </tr>
	            <tr>
	                <th>첨부파일</th>
	                <td height="30px" colspan="5"><input type="file" name="upfile"></td>
	            </tr>
	            <tr>
	                <th>내용</th>
	                <td colspan="5" >
	                    <textarea id="content" rows="15" name="boardContent" class="form-control" style="resize:none;" required>내용을 입력하세요</textarea>
	                </td>
	            </tr>
	        </table>
	
	        <div id="btn" align="center">
	        	<button type="submit" class="btn btn-primary btn-sm">작성</button>&nbsp;
	            <button type="button" class="btn btn-secondary btn-sm">취소</button>
	        </div>
		</form>

    </div>

</body>
</html>