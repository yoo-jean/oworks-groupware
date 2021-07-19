<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>외부 주소록</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">

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
	.updateBtn{
	    background-color:rgb(95, 95, 95);
        padding: 3.5px;
        border-radius: 7px;
        cursor:pointer;
	}
	.updateBtn:hover{
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

    <body>
        <div class="main">
        <!-- 외부 주소록 비었을 때 
        <h3 class="title">사내 주소록</h3>
        <br>
        <br>
        <form class="searchForm" action="어쩌고.ad">
            <div class="search">
                <select class="custom-select custom-select-sm">
                    <option value="name">저장명</option>
                    <option value="company">회사</option>
                    <option value="dept">부서</option>
                </select>
            </div>
            <div>
                <input type="text" class="form-control form-control-sm" name="keyword" value="">
            </div>
            <a class="btn btn-outline-primary btn-sm" href="">검색</a>
        </form>

        <table frame="hsides" rules="rows" class="table">
            <tr>
                <th width="7%">번호</th>
                <th width="10%">즐겨찾기</th>
                <th width="12%">저장명</th>
                <th width="20%">이메일</th>
                <th width="17%">휴대전화</th>
                <th width="14%">회사/소속</th>
                <th width="10%">부서</th>
                <th width="10%">직급</th>
            </tr>
            <tr>
                <td colspan="8">주소록이 비었습니다. 주소록을 추가해 주세요!</td>
            </tr>
        </table>
    -->        


    <!-- 외부 주소록에 값 있을 때 -->
            <h3 class="title">외부 주소록</h3>
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
                    <th width="7%">번호</th>
                    <th width="8%">즐겨찾기</th>
                    <th width="12%">저장명</th>
                    <th width="19%">이메일</th>
                    <th width="15%">휴대전화</th>
                    <th width="13%">회사/소속</th>
                    <th width="10%">부서</th>
                    <th width="8%">직급</th>
                    <th width="8%"></th>
                </tr>
                
				<c:forEach var="o" items="${ list }" >
	                <tr class="addressOutList">
	                    <td>${ o.outNo }</td>
	                    <td>
		                    <span id="fav_status">
		                    	<c:if test="${ o.favStatus eq 'Y' }">
	                       	 		💛                    
	                    		</c:if>
	                    		<c:if test="${ o.favStatus eq 'N' }">
	                       	 		🤍                  
	                    		</c:if>
	                    		<script>
				                    $(function() {
				                      $('#fav_status').click( function() {
				                        if( $(this).text() == '🤍' ) {
				                          $(this).text('💛');
				                        }
				                        else {
				                          $(this).text('🤍');
				                        }
				                      });
				                    });
				            </script>
		                    </span>
	                    </td>
	                    <td>${ o.outName }</td>
	                    <td>${ o.email }</td>
	                    <td>${ o.phone }</td>
	                    <td>${ o.company }</td>
	                    <td>${ o.dept }</td>
	                    <td>${ o.job }</td>
	                    <td><a class="updateBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
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
		               <li class="page-item"><a class="page-link" href="list.ao?currentPage=${ pi.currentPage-1 }"><<</a></li>
			   		</c:otherwise>
			   </c:choose>
               
               <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	               <li class="page-item"><a class="page-link" href="list.ao?currentPage=${ p }">${ p }</a></li>
               </c:forEach>
               
               
               <c:choose>
                   <c:when test="${ pi.currentPage eq pi.maxPage }">
                           <li class="page-item disabled"><a class="page-link" href="#">>></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="list.ao?currentPage=${ pi.currentPage+1 }">>></a></li>
			   		</c:otherwise>
			   </c:choose>
               
           </ul>
       </div>
           
            <br clear="both"><br>


            <!-- 모달 -->              
                <!-- The Modal -->
                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                      <div class="modal-content">
                      
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title" style="font-weight:bold;">외부 주소록 추가</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <form action="insert.ao" method="post">
	                        <!-- Modal body -->
	                        <div class="modal-body">
	                        
	                          <label style="color:black; font-weight:bold">저장명</label>
	                          <label style="color:rgb(9, 118, 251); font-weight:bold; font-size:12px;">(필수 입력 사항입니다)</label>
	                          <input type="text" class="form-control" name="outName" placeholder="김가나" maxlength="6" required><br>
	                          
	                          <label style="color:black; font-weight:bold">이메일</label>
	                          <label style="color:rgb(9, 118, 251); font-weight:bold; font-size:12px;">(필수 입력 사항입니다)</label>
	                          <input type="email" class="form-control" name="email" placeholder="123@a.com" maxlength="33" required><br>
	                        
	                          <label style="color:black; font-weight:bold">휴대전화</label>
	                          <label style="color:rgb(9, 118, 251); font-weight:bold; font-size:12px;">(필수 입력 사항입니다)</label>
	                          <input type="text" name="phone" class="form-control" placeholder="010-1111-2222" maxlength="13" required><br>
	                          
	                          <label style="color:black; font-weight:bold">회사/소속</label>
	                          <input type="text" name="company" class="form-control" placeholder="오스워크" maxlength="16"><br>
	                          
	                          <label style="color:black; font-weight:bold">부서</label>
	                          <input type="text" class="form-control" name="dept" placeholder="개발팀" maxlength="16"><br>
	                          
	                          <label style="color:black; font-weight:bold">직급</label>
	                          <input type="text" class="form-control" name="job" placeholder="대리" maxlength="16"><br><br>
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

                <!-- 수정 모달 -->              
                <!-- The Modal -->
                <div class="modal" id="myModal2">
                    <div class="modal-dialog">
                      <div class="modal-content">
                      
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title">외부 주소록 수정</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
							<form name="form" method="post">
		                        <!-- Modal body -->
		                        <div class="modal-body">
		                        
		                          <input type="hidden" id="addOutNo" name="addOutNo">
		                          
		                          <label style="color:black; font-weight:bold">저장명</label>
		                          <label style="color:rgb(9, 118, 251); font-weight:bold; font-size:12px;">(필수 항목)</label>
		                          <input type="text" class="form-control" id="outName" name="outName" maxlength="6"><br>
		                          
		                          <label style="color:black; font-weight:bold">이메일</label>
		                          <label style="color:rgb(9, 118, 251); font-weight:bold; font-size:12px;">(필수 항목)</label>
		                          <input type="email" class="form-control" id="email" name="email" maxlength="33"><br>
		                        
		                          <label style="color:black; font-weight:bold">휴대전화</label>
		                          <label style="color:rgb(9, 118, 251); font-weight:bold; font-size:12px;">(필수 항목)</label>
		                          <input type="text" name="phone" id="phone" class="form-control" placeholder="010-1111-2222" maxlength="13"><br>
		                          
		                          <label style="color:black; font-weight:bold">회사/소속</label>
		                          <input type="text" name="company" id="company" class="form-control" maxlength="16"><br>
		                          
		                          <label style="color:black; font-weight:bold">부서</label>
		                          <input type="text" class="form-control" id="dept" name="dept" maxlength="16"><br>
		                          
		                          <label style="color:black; font-weight:bold">직급</label>
		                          <input type="text" class="form-control" id="job" name="job" maxlength="16"><br><br>
		
		                        </div>
		                        
		                        <!-- Modal footer -->
		                        <div class="modal-footer">
		                          <button type="submit" class="btn btn-primary btn-sm" onclick="javascript: form.action='update.ao';">수정</button>
		                          <button type="button" class="btn btn-secondary btn-sm deleteBtn" data-dismiss="modal">취소</button>
		                          <button type="submit" class="btn btn-danger btn-sm" onclick="javascript: form.action='delete.ao';">삭제</button>
		                        </div>
							</form>
	                        
	                        <script>
						        // 버튼 클릭시 Row 값 가져오기
					      		$(".updateBtn").click(function(){ 
					            
					            var str = ""
					            var tdArr = new Array();    // 배열 선언
					            var updateBtn = $(this);
					            
					            //updateBtn.parent() : updateBtn의 부모는 <td>이다.
					            //updateBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
					            var tr = updateBtn.parent().parent();
					            var td = tr.children();
					            
					            //console.log("클릭한 Row의 모든 데이터 : "+tr.text());
					            
					            var no0 = td.eq(0).text();
					            var no1 = td.eq(2).text();
					            var no2 = td.eq(3).text();
					            var no3 = td.eq(4).text();
					            var no4 = td.eq(5).text();
					            var no5 = td.eq(6).text();
					            var no6 = td.eq(7).text();
					            
					            // console.log(no0);
					            
					            $("#addOutNo").val(no0);
					            $("#outName").val(no1);    
					            $("#email").val(no2); 
					            $("#phone").val(no3); 
					            $("#company").val(no4); 
					            $("#dept").val(no5); 
					            $("#job").val(no6); 
					            
					      		});
					        </script>
                        
                      </div>
                    </div>
                </div>




        </div>



</body>
</html>