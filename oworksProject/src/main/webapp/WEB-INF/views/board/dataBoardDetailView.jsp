<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 상세페이지</title>
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
        a{color:black}
        a:hover{
            text-decoration:underline;
            color:black
        }
        .btn-sm{color:white}
        #list{
            margin-bottom: 15px;
            margin-left: 96%;
        }
        #update, #delete{
            color:white;
        }
    </style>

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

        <a class="btn btn-secondary btn-sm" href="list.db" id="list">목록</a>
        <table align="center" style="border:1px solid rgb(227, 227, 227);" class="table">
            <tr>
                <th width="10%">제목</th>
                <td height="30px" colspan="5">${ b.boardTitle }</td>
            </tr>
            <tr>
                <th width="10%">작성자</th>
                <td width="25%">${ b.writerName }</td>

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
                <td colspan="5">
                	<c:choose>
                		<c:when test="${ empty b.originName }">
                			첨부파일이 없습니다.
                		</c:when>
                		<c:otherwise>
		                    <a href="${ b.changeName }" download=" ${b.originName} ">${ b.originName }</a>
                		</c:otherwise>
                	</c:choose>
                </td>
            </tr>
        </table>

        <div id="btn" align="center">
        
            <c:if test="${ loginUser.userId eq b.boardWriter }">
		        <a class="btn btn-primary btn-sm" id="update" onclick="postFormSubmit(1);">수정</a>&nbsp;
		        <a class="btn btn-danger btn-sm" id="delete" onclick="postFormSubmit(2);">삭제</a>&nbsp;
		        
            	<form action="" id="postForm" method="post">
            		<input type="hidden" name="dbno" value="${ b.boardNo }">
            		<input type="hidden" name="filePath" value="${ b.changeName }">
            	</form>
            	
            	<script>
            		function postFormSubmit(num){
            			if(num == 1){	// 수정
            				$("#postForm").attr("action", "updateForm.db").submit();
            			}else{			// 삭제
            				$("#postForm").attr("action", "delete.db").submit();
            			}
            		}
            	</script>
            </c:if>
            
        </div>

    </div>

</body>
</html>