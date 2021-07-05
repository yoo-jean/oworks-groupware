<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사내 주소록</title>

    <!-- css & 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">

    <!-- 부트스트랩 : 아이콘 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


    <!-- 부트스트랩 : 모달 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<style>
	.main{
    width:1000px;
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
	    width:32%;
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
	    background-color: rgb(9, 118, 251);
	    line-height: 1.5;
	    color:white;
	}
	.table td{
	    text-align: center;
	    line-height: 1;
	}
	#fav_status{
	    cursor: pointer;
	}
	#pagingArea{
	    margin: auto;
	    width:fit-content;
	}
	#deleteBtn{
	    background-color:rgb(95, 95, 95);
        padding: 3.5px;
        border-radius: 7px;
        cursor:pointer;
	}
	#deleteBtn:hover{
	    background-color: rgb(224, 2, 2);
	    color:white;
	}
	.deleteList{
		font-weight:600;
	}
	</style>
</head>
<body>
    <!-- 헤더바 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 메뉴바 -->
    <%-- <jsp:include page=""/> --%>

    <div class="main">
        <!-- 사내 주소록 비었을 때 
        <h3 class="title">사내 주소록</h3>
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
                <th width="13%">사원번호</th>
                <th width="11%">사원명</th>
                <th width="22%">이메일</th>
                <th width="8%">사내전화</th>
                <th width="18%">휴대전화</th>
                <th width="10%">부서</th>
                <th width="10%">직급</th>
                <th width="8%"></th>
            </tr>
            <tr>
                <td colspan="9">주소록이 비었습니다. 주소록을 추가해 주세요!</td>
            </tr>
        </table>
    -->        


    <!-- 사내 주소록에 값 있을 때 -->

        <h3 class="title">사내 주소록</h3>
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
                <th width="13%">사원번호</th>
                <th width="11%">사원명</th>
                <th width="22%">이메일</th>
                <th width="8%">사내전화</th>
                <th width="18%">휴대전화</th>
                <th width="10%">부서</th>
                <th width="10%">직급</th>
                <th width="8%"></th>
            </tr>
			
			<c:forEach var="a" items="${ list }" >
	            <tr class="addressList">
	                <td class="empNo">${ a.favEmpNo }</td>
	                <td>${ a.empName }</td>
	                <td>${ a.email }</td>
	                <td>${ a.empPhone }</td>
	                <td>${ a.phone }</td>
	                <td>${ a.dept }</td>
	                <td>${ a.job }</td>
	                <td><a class="deleteBtn" id="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
	            </tr>
            </c:forEach>
        </table>

        <!-- 버튼(로그인한 회원) -->
        <div id="btn" align="right">
            <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#myModal">
                주소록 추가
            </button>
        </div>

        <!-- 페이징 -->
        <div id="pagingArea">
            <ul class="pagination">
            	
			   <c:choose>
			   		<c:when test="${ pi.currentPage eq 1 }">
		               <li class="page-item disabled"><a class="page-link" href="#"><<</a></li>
			   		</c:when>
			   		<c:otherwise>
		               <li class="page-item"><a class="page-link" href="list.ai?currentPage=${ pi.currentPage-1 }"><<</a></li>
			   		</c:otherwise>
			   </c:choose>
               
               <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	               <li class="page-item"><a class="page-link" href="list.ai?currentPage=${ p }">${ p }</a></li>
               </c:forEach>
               
               
               <c:choose>
                   <c:when test="${ pi.currentPage eq pi.maxPage }">
                           <li class="page-item disabled"><a class="page-link" href="#">>></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="list.ai?currentPage=${ pi.currentPage+1 }">>></a></li>
			   		</c:otherwise>
			   </c:choose>
               
           </ul>
       </div>
           
        <br clear="both"><br>


        <!-- 주수록 추가 모달 -->              
            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                <div class="modal-content">
                    
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">사내 주소록 추가</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <form action="insert.ai" method="post">
	                    <!-- Modal body -->
	                    <div class="modal-body">
	                        	<label>추가할 사원 번호 : </label>
	                        	<input type="text" class="form-control" name="submitEmpNo"  placeholder="ex)10001" maxlength="5"><br>
	                        	<label>* 없는 사번 입력 시 추가되지 않습니다</label><br>
	                        	<label>* 사원 번호를 입력하시면 사원 정보가 자동으로 등록됩니다</label>

	                    </div>
	                        
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <button type="submit" class="btn btn-primary btn-sm">등록</button>
	                        <button type="reset" class="btn btn-danger btn-sm" data-dismiss="modal">취소</button>
	                    </div>
                    </form>    
                      
                </div>
                </div>
            </div>



            <!-- 주소록 삭제 모달 -->              
            <!-- The Modal -->
            <div class="modal" id="myModal2">
                <div class="modal-dialog">
                <div class="modal-content">
                    
                    <form action="delete.ai" method="post">
	                    <!-- Modal Header -->
	                    <div class="modal-header">
	                        <h4 class="modal-title">주소록 삭제</h4>
	                        <button type="button" class="close" data-dismiss="modal">&times;</button>
	                    </div>
	                        
	                    <!-- Modal body -->
	                    <div class="modal-body" align="center">
	                   		<input type="text" class="deleteList form-control" id="deleteEmpNo" name="empNo" readonly></input><br>
	                   		<input type="text" class="deleteList form-control" id="deleteEmpName" name="empName" readonly></input><br>
	                    	<label>위 주소록을 정말 삭제하시겠습니까?</label> 
	                    </div>
	                        
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <button type="submit" class="btn btn-danger btn-sm modalDelBtn">삭제</button>
	                        <button type="reset" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
	                    </div>
                    </form>
                    
                    
                <script>
			        // 버튼 클릭시 Row 값 가져오기
		      		$(".deleteBtn").click(function(){ 
		            
		            var str = ""
		            var tdArr = new Array();    // 배열 선언
		            var deleteBtn = $(this);
		            
		            // checkBtn.parent() : checkBtn의 부모는 <td>이다.
		            // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		            var tr = deleteBtn.parent().parent();
		            var td = tr.children();
		            
		            //console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		            
		            var no = td.eq(0).text();
		            var no2 = td.eq(1).text();
		            
		            console.log(no);
		            
		            $("#deleteEmpNo").val(no);    
		            $("#deleteEmpName").val(no2); 
		            
		            
		      		});
			    </script>
                      
                </div>
                </div>
            </div>


    </div>

</body>
</html>