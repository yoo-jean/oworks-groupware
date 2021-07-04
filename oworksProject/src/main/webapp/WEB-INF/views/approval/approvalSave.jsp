<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>Document</title>

<style>
/*전체 감싸는 css*/
.approvalouter{width: 1000px;margin: auto;}

/*table*/
.table{text-align: center;}
.approvalall table>tbody>tr:hover{cursor: pointer;}

/*select, input css*/
#deletebtn{
    text-align: left;
    position: relative;
    top: 130px;
}
.searchfield select{
    width: 10%;
    position: relative;
    top: 92px;
    right: 380px;

}
.searchfield input{
    width: 30%;
    position: relative;
    top: 38px;
    right: 70px;
}

#pagingArea{width:fit-content;margin:auto;}
</style>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
    <jsp:include page="../common/mainMenubar.jsp"/>
    <div class="approvalouter" style="position: absolute; left: 400px; top: 50px; width: 1000px;">
        <br>
        <div class="approvalinner">

            <div class="searchfield">
                <button class="btn btn-secondary" id="deletebtn">삭제</button>
				
				<!-- 검색영역 -->
                <form id="searchForm" action="search.ap" align="center">
                	<input type="hidden" name="currentPage" value="1">
                	<input type="hidden" name="empNo" value="${loginEmp.empNo }">
		                <div align="right" class="select">
		                    <select name="condition" class="custom-select mb-3">
		                        <option value="title">제목</option>
		                        <option value="writer">기안자</option>
		                        <option value="content">내용</option>
		                    </select>
		                    
		                    <input type="text" class="form-control form-control" name="keyword" value = "${keyword}" placeholder="검색어를 입력하세요">
		                    <button type="submit" class="btn btn-primary" style="background:rgb(42, 128, 185);">검색</button>
		                </div>
                </form>
                
            </div>
            
            <c:if test="${!empty condition }">
             	<script>
             		$(function(){
             			$(".searchfield option[value=${condition}]").attr("selected", true);
             		})
             	</script>
             </c:if>
            
            
            
            
            <br>

            <div class="approvalall">
                <table class="table table-hover" id = "saveApprovalTable">
                    <thead class="thead-dark">
                        <tr>
                            <th width="40px"><input type="checkbox"></th>
                            <th width="150px">문서번호</th>
                            <th width="220px">제목</th>
                            <th width="90px">기안자</th>
                            <th width="200px">기안일</th>
                            <th width="80px">상태</th>                            
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test = "${fn:length(saveList) eq 0 }" >
                    			<tr>
                    				<td colspan = "7" align="center"> 임시저장 문서가 없습니다.</td>
                    			</tr>
                    		</c:when>
                    		
                    		<c:otherwise>
                    			<c:forEach var ="a" items="${saveList }">
			                        <tr>
			                            <td><input type="checkbox"></td>
			                            <td class = "ano">${a.appNo }</td>
			                            <td>${a.appTitle }</td>
			                            <td>${a.empName }</td>
			                            <td>${a.writeDate }</td>
			                            <td>임시저장</td>
			                        </tr>
		                        </c:forEach>
                        	</c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
				
	            <!-- 수정하기 페이지로 넘기기 -->
            
				<script>
					$(function(){
						$("#saveApprovalTable tbody tr").click(function(){
							location.href="updateForm.ap?ano="+$(this).children(".ano").text();
						})
					})
				
				</script>
				
				
                <!--페이징바-->
                <div id="pagingArea">
	                <ul class="pagination">
	                	<c:choose>
	                		<c:when test="${pi.currentPage eq 1 }">
	                    		<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="saveList.ap?currentPage=${pi.currentPage-1 }&empNo=${loginEmp.empNo}"><</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var = "p" begin = "${pi.startPage }" end = "${pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="saveList.ap?currentPage=${p }&empNo=${loginEmp.empNo}">${p }</a></li>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test = "${pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item"><a class="page-link" href="#">></a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="saveList.ap?currentPage=${pi.currentPage+1 }&empNo=${loginEmp.empNo}">></a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                </ul>
             	</div>
             	
             	<br clear="both"><br>
             	
            </div>
        </div>
    </div>
    
    
    
</body>
</html>
