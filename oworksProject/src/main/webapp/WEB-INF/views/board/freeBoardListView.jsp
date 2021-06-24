<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 조회</title>
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
            border-bottom: 0.5px solid black;
            text-align: center;
            margin-top: 10px;
            margin-bottom: 5px;
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
        .listArea>tbody>tr{height: 40px;}
        #top{height: 40px;}
        #searchForm{
            width:80%;
            margin:auto;
            margin-left: 51%;
        }
        #searchForm>*{float:left; margin:3px;}
        .select{width:15%;}
        .text{width:35%;}
        .searchBtn{Width:10%;}
        #pagingArea{width:fit-content;margin:auto;}
    </style>
</head>
<body>
    <!-- 이쪽에 헤더바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 이쪽에 메뉴바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

     <div class="outer">
        <span id="text1">자유게시판</span><hr>

		<!-- 검색 -->
		<div class = "search-area">
	        <form id="searchForm" action="" method="Get" align="right">
	            <div class="select">
	                <select class="custom-select" name="condition">
	                    <option value="title">제목</option>
	                    <option value="content">내용</option>
	                    <option value="writer">작성자</option>
	                </select>
	            </div>
	            
	            <div class="text">
	                <input type="text" class="form-control" name="keyword" value="${keyword}">
	            </div>
	            <button type="submit" class="btn btn-primary"><b>검색</b></button>&nbsp;
	        </form>
        </div>
        <br>
        
        <c:if test="${!empty condition }">
             	<script>
             		$(function(){
             			$(".search-area option[value=#(condition)]").attr("selected", true);
             		})
             	</script>
        </c:if>

        <table class="listArea">
            <thead id="head">
                <tr id="top">
                    <th width="60">순번</th>
                    <th width="480">제목</th>
                    <th width="100">작성자</th>
                    <th width="100">등록일</th>
                    <th width="60">조회수</th>
                </tr>
            </thead>
            <tbody>  
            	<c:forEach var="fb" items="${list}"> 
	               <tr>
	                   <td class="fbno">${fb.fbNo}</td>
	                   <td>
	                       <a href="" style="color: black;">${fb.fbTitle}</a>&nbsp;
	                       <img src="${pageContext.servletContext.contextPath }/resources/images/board/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
	                   </td>
	                   <td>${fb.empName}</td>
	                   <td>${fb.fbDate}</td>
	                   <td>${fb.fbCount}</td>
	               </tr>
                </c:forEach>
            </tbody>
        </table>
        
		<script>
 		     	$(function(){
 		     		$("#listArea tbody a").click(function(){
 		     			location.href="detail.fb?fbno=" + $(this).children(".fbno").text();
 		     		})
 		     	})
 		</script>
      

        <!-- 사원 모두에게 보이는 글작성 버튼 -->
        <div id="btn" align="right">
            <a class="btn btn-outline-primary btn-sm" href="enrollForm.fb"><b>글작성</b></a>&nbsp;
        </div>

        
        	 <!-- 페이징바 -->
             <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1 }">
                    		<li class="page-item disabled"><a class="page-link" href="#"><<</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.fb?currentPage=${pi.currentPage-1 }"><<</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var = "p" begin = "${pi.startPage }" end = "${pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="list.fb?currentPage=${p }">${p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test = "${pi.currentPage eq pi.maxPage }">
                    		<li class="page-item"><a class="page-link" href="#">>></a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.fb?currentPage=${pi.currentPage+1 }">>></a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
             </div>
            
             <br clear="both"><br>
       
    </div>

    <script>
        
    </script>   
     
</body>
</html>