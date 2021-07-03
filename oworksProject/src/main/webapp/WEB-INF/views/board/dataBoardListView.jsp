<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자료실 리스트</title>
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
	    font-size:14px;
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
	    width:31%;
	    float:right;
	    margin-top: 0px;
	    margin-bottom: 20px;
	}
	.searchForm>*{
	    float: left;
	    margin: 1.5px;
	}
	.table{
	    border-color: rgb(227, 227, 227);
	    width: 100%;
	    color:rgb(37, 37, 37);
	    text-align: center;
	}
	.table th{
	    background-color: rgb(231, 238, 243);
	    line-height: 1.5;
	    color:rgb(68, 68, 68);
	}
	.table td{
	    text-align: center;
	    line-height: 1;
	}
	.table td>a{
	    color: rgb(37, 37, 37);
	}
	.table td>a:hover{
	    text-decoration: none;
	    color:rgb(90, 144, 211);
	}
	
	#pagingArea{
	    margin: auto;
	    width:fit-content;
	}
	</style>

</head>
<body>
    <!-- 헤더바 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 메뉴바 -->
    <%-- <jsp:include page=""/> --%>


    <div class="main">

        <!-- 글이 없을 경우 -->
        <!--
        <h3 class="title">자료실</h3>
        <br>
        <br>
        <form class="searchForm" action="어쩌고.ad">
            <div class="search">
                <select class="custom-select custom-select-sm">
                    <option value="name">이름</option>
                    <option value="dept">부서</option>
                    <option value="job">직급</option>
                </select>
            </div>
            <div>
                <input type="text" class="form-control form-control-sm" name="keyword" value="">
            </div>
            <a class="btn btn-outline-primary btn-sm" href="">검색</a>
        </form>


        <table frame="hsides" rules="rows" class="table">
            <tr>
                <th width="15%">글 번호</th>
                <th width="40%">제목</th>
                <th width="18%">작성자</th>
                <th width="15%">등록일</th>
                <th width="12%">조회수</th>
            </tr>
            <tr>
                <td colspan="5">작성된 글이 없습니다. 글을 작성해 주세요!</td>
            </tr>
        </table>    
        -->

        <!-- 글이 있을 경우 -->
        <h3 class="title">자료실</h3>
        <br>
        <br>
        <form class="searchForm" action="어쩌고.ad">
            <div class="search">
                <select class="custom-select custom-select-sm">
                    <option value="name">이름</option>
                    <option value="dept">부서</option>
                    <option value="job">직급</option>
                </select>
            </div>
            <div>
                <input type="text" class="form-control form-control-sm" name="keyword" value="">
            </div>
            <a class="btn btn-outline-primary btn-sm" href="">검색</a>
        </form>


        <table class="table">
	        <thead class="thead">
	            <tr>
	                <th width="15%">글 번호</th>
	                <th width="40%">제목</th>
	                <th width="18%">작성자</th>
	                <th width="15%">등록일</th>
	                <th width="12%">조회수</th>
	            </tr>
	        </thead>
	        
	        <tbody class="tbody">
			<c:forEach var="b" items="${ list }" >
            <tr>
                <td>${ b.boardNo }</td>
                <td>
                    <a href="">${ b.boardTitle }</a>
                </td>
                <td>${ b.writerName }</td>
                <td>${ b.createDate }</td>
                <td>${ b.count }</td>
            </tr>
            </c:forEach>
	        </tbody>
        </table>


        <!-- 버튼(로그인한 회원) -->
        <!--  
        <c:if test="${ !empty loginUser }">
        </c:if>
        -->
	        <div id="btn" align="right">
	            <a class="btn btn-outline-primary btn-sm" href="enrollForm.db">글 작성</a>
	        </div>


        <!-- 페이징 -->
        <div id="pagingArea">
            <ul class="pagination">
            	
			   <c:choose>
			   		<c:when test="${ pi.currentPage eq 1 }">
		               <li class="page-item disabled"><a class="page-link" href="#"><<</a></li>
			   		</c:when>
			   		<c:otherwise>
		               <li class="page-item"><a class="page-link" href="list.db?currentPage=${ pi.currentPage-1 }"><<</a></li>
			   		</c:otherwise>
			   </c:choose>
               
               <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	               <li class="page-item"><a class="page-link" href="list.db?currentPage=${ p }">${ p }</a></li>
               </c:forEach>
               
               
               <c:choose>
                   <c:when test="${ pi.currentPage eq pi.maxPage }">
                           <li class="page-item disabled"><a class="page-link" href="#">>></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="list.db?currentPage=${ pi.currentPage+1 }">>></a></li>
			   		</c:otherwise>
			   </c:choose>
               
           </ul>
       </div>
          
       <br clear="both"><br>


    </div>



</body>
</html>