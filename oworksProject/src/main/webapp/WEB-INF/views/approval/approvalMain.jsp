<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Document</title>

<style>
    /*전체 틀 css*/
    .container{
        border: 1px solid lightgray;
    }

    /*table*/
    .table{text-align: center;}
    .container table>tbody>tr:hover{cursor: pointer;}

    /*글씨 크기 및 굵기 css*/
    .approvalMain h2{font-size: 30px; font-weight: 700;}
    .container h2{
        font-size: 20px;
        font-weight: 700;
    }

    /*아이콘 css*/
    #homeIcon{
        position: relative;
        top : -4px;
        width: 40px;

    }
    
    .main{
        position: relative;
        left: 250px;
        }

</style>
</head>
<body>
    <br><br>
    <div class="approvalMain">
        <h2 class="main"><img src="${pageContext.servletContext.contextPath }/resources/images/approval/home.png" id="homeIcon">전자결재 홈</h2><br><br>
        <div class="container">
        
            <br>
            <h2>결재대기문서</h2><br>
            <table class="table table-hover" id="approvalDocList">
                <thead class="thead-dark">
                    <tr>
                        <th>문서번호</th>
                        <th>제목</th>
                        <th>기안자</th>
                        <th>기안일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test = "${fn:length(list) eq 0}">
                			<c:forEach var = "a" items="${list }">
                			<c:if test = "${a.statue != '대기' }">
        			    	<tr>
                        		<td colspan = "7" align="center"> 결재할 문서가 없습니다.</td>
                    		</tr>
                    		</c:if>
                    		</c:forEach>
                		</c:when>
                		
                		<c:otherwise>
                			<c:forEach var ="a" items="${list }">
                				<c:if test="${a.status == '대기' }">
				                    <tr>
				                        <td class = "ano">${a.appNo }</td>
				                        <td>${a.appTitle }</td>
				                        <td>${a.empName }</td>
				                        <td>${a.writeDate }</td>
				                        <td>${a.status}</td>
				                    </tr>
				                </c:if>
                    		</c:forEach>
                		</c:otherwise>
                	</c:choose>
                	
                	
                </tbody>

            </table>
            
            <h2>기안진행문서</h2> <br>
            <table class="table table-hover" id="approvalDocList">
                <thead class="thead-dark">
                    <tr>
                        <th>문서번호</th>
                        <th>제목</th>
                        <th>기안자</th>
                        <th>기안일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test = "${fn:length(list) eq 0}">
        			    	<tr>
                        		<td colspan = "6" align="center"> 결재할 문서가 없습니다.</td>
                    		</tr>
                		</c:when>
                		
                		<c:otherwise>
                			<c:forEach var ="a" items="${list }">
                				<c:if test="${a.status == '진행' }">
				                    <tr>
				                        <td class = "ano">${a.appNo }</td>
				                        <td>${a.appTitle }</td>
				                        <td>${a.empName }</td>
				                        <td>${a.appDate }</td>
				                        <td>${a.status}</td>
				                    </tr>
				                </c:if>
                    		</c:forEach>
                		</c:otherwise>
                	</c:choose>
                	
                	
                </tbody>
            </table>
            
            
            
            <h2>완료 문서</h2> <br>
            <table class="table table-hover" id="approvalDocList">
                <thead class="thead-dark">
                    <tr>
                        <th>문서번호</th>
                        <th>제목</th>
                        <th>기안자</th>
                        <th>기안일</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test = "${fn:length(list) eq 0}">
        			    	<tr>
                        		<td colspan = "6" align="center"> 결재할 문서가 없습니다.</td>
                    		</tr>
                		</c:when>
                		
                		<c:otherwise>
                			<c:forEach var ="a" items="${list }">
                				<c:if test="${a.status == '완료' }">
				                    <tr>
				                        <td class = "ano">${a.appNo }</td>
				                        <td>${a.appTitle }</td>
				                        <td>${a.empName }</td>
				                        <td>${a.appDate }</td>
				                        <td>${a.status}</td>
				                    </tr>
				                </c:if>
                    		</c:forEach>
                		</c:otherwise>
                	</c:choose>
                	
                	
                </tbody>
            </table>
            

            
            <!-- 상세보기 페이지로 넘기기 -->
            
			<script>
				$(function(){
					$("#approvalDocList tbody tr").click(function(){
						location.href="detail.ap?ano="+$(this).children(".ano").text();
					})
				})
			
			</script>

        </div>
    </div>
</body>
</html>