<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/board/noticeListView.css">

</head>
<body>
     
	<jsp:include page="../common/mainHeader.jsp"/>
	<jsp:include page="../common/mainMenubar.jsp"/>
     <div class="content">
         
         <div id="content">
         
	         <div class="article-board" style="position: absolute; left: 400px; top: 150px; width:850px;">
	             
	            <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
	            <br><br>
	            <c:if test="${loginEmp ne null }">
	           		<a id="writebtn" class="btn btn-outline-primary btn-sm" style="float:right" href="enrollForm.no">글작성</a>
	            </c:if>
	            <table id="boardList" align="center">
	               	<colgroup>
	                	<col style="width: 50px;">
	                    <col style=" ">
	                    <col style="width: 80px;">
	                    <col style="width: 80px;">
	                    <col style="width: 100px;">
	                </colgroup>
	
	                 <thead>
	                   <tr class="normalTableTitle">
	                     <th scope="col"></th>
	                     <th scope="col">
	                         <span class="article_title">제목</span>
	                     </th>
	                     <th scope="col" class="" align="center">작성자</th>
	                     <th scope="col">조회수</th>
	                     <th scope="col">작성일</th>
	                   </tr>
	                 </thead>
	                 <tbody>
	                 	<c:forEach var="n" items="${list }">
		                     <tr class="body_notice">
	                             <td class="nno">${n.noticeNo }</td>
		                         <td  id="td_article">
	                                <div class="board-list"> 
	                                    <div class="inner_list">
	                                        <span class="list-i-new">
	                                            <span class="build">${n.noticeTitle }</span>
	                                        </span>
	                                    </div>
	                                </div>
	                             </td>
		                         <td class="td_name">${n.empName }</td>
		                         <td class="td_count">${n.noticeCount }</td>
		                         <td class="td_date">${n.enrollDate }</td>
		                     </tr>
		                 </c:forEach>
	                 </tbody>
	             </table>
	             <br>
	 		     <script>
	 		     	$(function(){
	 		     		$("#boardList tbody tr").click(function(){
	 		     			location.href="detail.no?nno=" +$(this).children(".nno").text();
	 		     		})
	 		     	})
	 		     </script>
	 		     
	 		     <!-- 페이징바 영역 -->
	 		     
	             <div id="pagingArea">
	                <ul class="pagination">
	                	<c:choose>
	                		<c:when test="${pi.currentPage eq 1 }">
	                    		<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage-1 }"><</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var = "p" begin = "${pi.startPage }" end = "${pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="list.no?currentPage=${p }">${p }</a></li>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test = "${pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item"><a class="page-link" href="#">></a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage+1 }">></a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                </ul>
	             </div>
	            
	             <br clear="both"><br>
	             
	 			 
	 			 
	 			 <!-- 검색 영역 -->
	 			 <div class = "search-area">
		             <form id="searchForm" action="search.no" align="center">
		             	<input type="hidden" name="currentPage" value="1">
		                	<div class="select">
			                    <select class="custom-select" name="condition">
			                        <option value="title">제목</option>
			                        <option value="content">내용</option>
			                        <option value="writer">작성자</option>
			                    </select>
		                 	</div>
		                 	
		                 <div class="text">
		                     <input type="text" class="form-control" name="keyword" value = "${keyword }">
		                 </div>
		                 <button type="submit" class="btn btn-outline-primary">검색</button>
		             </form>
	             </div>
	             
	             <c:if test="${!empty condition }">
	             	<script>
	             		$(function(){
	             			$(".search-area option[value=${condition}]").attr("selected", true);
	             		})
	             	</script>
	             </c:if>
	             
	             
	             
	             
	             <br><br>
	         </div>
         </div>
         <br><br>
     </div>
 
     <!-- 이쪽에 푸터바 포함할꺼임 -->

     
</body>
</html>