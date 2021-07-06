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

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/approval/approvalDetailView.css">

<title>기안서 상세보기</title>
</head>
<body>


	<!--헤더바-->
	<jsp:include page="../common/mainHeader.jsp"/>
    
	<!--좌측메뉴바-->
    <jsp:include page="../common/mainMenubar.jsp"/> 
    
    <div class="approvalouter" style="position: absolute; left: 400px; top: 100px; width: 1000px;">
		
		<!-- 기안취소하기 버튼 -->
		<c:if test="${loginEmp.empNo == a.empNo }">
			<div class="left_area" style="padding:0">
				<form action = "collectApproval.ap"  id = "collectApproval" method = "post" enctype="multipart/form-data">
					<input type="hidden" name = "ano" value = "${a.appNo }">
					<input type="hidden" name ="filePath" value = "${a.mdfFileName }">
					
			      		<button type="submit" onClick="alert('기안문서를 취소하시겠습니까? 문서는 삭제처리되며 복구되지 않습니다!')" class="btn btn-dark btn-sm" onclick="addApprovalLine();">기안취소</button>
			        	<button type="button" class="btn btn-dark btn-sm">인쇄</button>
				</form>
		    </div>
	    </c:if>
	    
	    
	    
     	<br>
        <div class="container">
            <div class="approvalsetting">
                <table class="table table-bordered">
                    <tr>
                        <th>기안부서</th>
                        <td>${a.deptName }</td>
                        <th>작성자</th>
                        <td>${a.empName }</td>
                    </tr>
                    <tr>
                        <th>보존연한</th>
                        <td>${a.expireDate }</td>
                        <th>보안등급</th>
                        <td>${a.securityLevel }</td>
                    </tr>
                </table>
            </div>

            <br><br>

            <!--결재선-->
            <div class="approvalline">
                <table class="table table-bordered">
		                <tr>
		                    <th rowspan="3" id="approval">결재</th>
				                <c:forEach var="appLine" items="${appLine}">
					            	<td>${appLine.jobName}</td>
				                </c:forEach>
		                </tr>
	                
	                <tr>
                		<c:forEach var="appLine" items="${appLine }">
							<c:if test="${appLine.status ne '대기' }">
			                    <td style="font-weight: bold; color: rgb(42, 128, 185);" id="submitArea">승인</td>
		                    </c:if>
			            </c:forEach>
		                    
			            <c:forEach var ="appLine" items="${appLine}" end="${fn:length(appLine)}">
			            	<c:if test="${appLine.status eq '대기' }">
				            	<td>
				                	<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" style="background: rgb(42, 128, 185);">결재</button>
				            	</td>
				            </c:if>
			            </c:forEach>
	                </tr>
	                
	                <tr>
	               		<c:forEach var ="appLine" items="${appLine }">
		                    <td>${appLine.empName}</td>
		               	</c:forEach>
	                </tr>
                </table>

                <!--승인이나 반려 선택하는 모달-->
                <form id = "updateApprovalStatus" method="post" action = "update.ap" name = "approvalStatus">
                   	<input type="hidden" name="appNo" value=${a.appNo }>
                   	<input type="hidden" name="empNo" value=${loginEmp.empNo }>
                   	 
                	<div class="containerApproval" style="border: none;">
                    	
	                    <!-- The Modal -->
	                    <div class="modal fade" id="myModal">
	                      	<div class="modal-dialog modal-dialog-centered">
	                        	<div class="modal-content">
	                          
		                          	<!-- Modal body -->
		                          	<div class="modal-body" align="center">
		                            	<div class="yesorno">
		                                	<br>
		                                    	<input type="radio" name="appStatus" value="승인" id="ok" onclick="approvalSubmit(1);"><label for="ok">&nbsp;승인</label>
		                                    	&nbsp;&nbsp;
		                                    	<input type="radio" name="appStatus" value="반려" id="no" onclick="approvalSubmit(2);"><label for="no">&nbsp;반려</label>
		                                
		                            	</div>
		                            	<br>
		                            	<div>
		                                	<b>승인하시겠습니까?</b><br><br>
		                                	<textarea placeholder="의견을 입력하세요" style="resize: none;" id="content"></textarea>
		                                	<br>
		                            	</div>
		                          	</div>
	                          
		                          	<!-- Modal footer -->
		                          	<div class="modal-footer">
		                            	<div class="modalfooter2">
		                                	<button type="submit" id="approvalOk" class="btn btn-info" data-dismiss="modal" style="background: rgb(42, 128, 185);" onclick="addComment();">확인</button>
		                                	<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="test();">취소</button>
		                            	</div>    
		                          	</div>
	                        	</div>
	                      	</div>
	                    </div>
                	</div>
 		        </form>
            </div>
			
            <!--참조-->
            <div class="reference">
            <table class="table table-bordered">
                <tr>
                <th>참조</th>
                <td align="left">경영지원실-김사장</td>
                </tr>
            </table>
            </div>

            <!--내용영역-->
            <div class="content">
                <br>
                <div class="innerOuter">
                    <br>
                    <form id="updateForm" method="post" action="" enctype="">
                        <table class="table table-bordered">
                            <tr>
                                <th><label for="title">제목</label></th>
                                <td>${a.appTitle }</td>
                            </tr>
                            <tr>
                                <td colspan="2">${a.appContent }</td>
                            </tr>
                        </table>
                        <br>
                    </form>

                    <!--첨부파일 table-->
                    <div class="insertfile">
                        <table class="table table-bordered">
                            <tr>
                                <th><label for="upfile">첨부파일</label></th>
                                <td>
                            		<c:forEach var="attList" items="${attList }">
					            		<a href="${attList.mdfFileName }" download="${attList.filePath }">${attList.orgFileName }</a>
				                	</c:forEach>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <br>
        </div>

        <br><br>

        <br>
        
        <!-- 댓글기능 -->
        <table id="replyArea" class="table" style="width: 1000px;">
            <thead>
                <tr>
                    <td colspan="3">의견 (<span id="rcount">0</span>) </td> 
                </tr>
            </thead>
            
            <tbody>

            </tbody>
			
			
			<tfoot>                
                <tr>
                    <th colspan="2">
                        <textarea class="form-control" id="reply" cols="55" rows="2" style="resize:none; width:100%" placeholder="의견을 입력해주세요"></textarea>
                    </th>
                    <th style="vertical-align: middle"><button class="btn btn-warning" onclick="addReply();">등록하기</button></th>
                </tr>
            </tfoot>
			
        </table>
        
		<!-- 승인이나 반려 의견 작성시 코멘트 달림 -->
		<script>
			$(function(){
				selectCommentList();
				
			})
       		
			function addComment(){
        		// 승인, 반려 체크시 status input으로 넘기기
        		
        		var radio = $("input[name='appStatus']:checked").val();
        		var form = $("form[id='updateApprovalStatus']");
           		if(radio=="승인"){
           			form.append($('<input/>', {type:'hidden', name:'status', value:'진행'}));
           		}else{
           			form.append($('<input/>', {type:'hidden', name:'status', value:'반려'}));
           		}
				form.submit();
              	
				
				// 결재자 몇 명인지
				var test = ${fn:length(appLine)};
				
				console.log(test);
				
				// 승인이나 반려 이유 작성하는 ajax
				if($("#content").val().trim().length != 0){
					$.ajax({
						url : "cinsert.ap",
						data : {
							appComment:$("#content").val(),
							appNo:'${a.appNo}',
							empNo:${a.empNo}
						},
						success:function(status){
							if(status == "success"){
								$("#content").val("");
								selectCommentList();
							}
						}, error:function(){
							console.log("코멘트 작성용 ajax 통신 실패!");
						}
					})
				}else{
					console.log("댓글 작성 해주세요!!!");
				}
			}
			
			function addReply(){
				if($("#reply").val().trim().length != 0){
					$.ajax({
						url : "cinsert.ap",
						data : {
							appComment:$("#reply").val(),
							appNo:'${a.appNo}',
							empNo:${loginEmp.empNo}
						},
						success:function(status){
							if(status == "success"){
								$("#reply").val("");
								selectCommentList();
							}
						}, error:function(){
							console.log("코멘트 작성용 ajax 통신 실패!");
						}
					})
				}else{
					console.log("댓글 작성 해주세요!!!");
				}
			}
			
			function selectCommentList(){
				$.ajax({
					url:"clist.ap",
					type : "POST",
					data:{ano:"${a.appNo}"},
					success:function(list){
						var value = "";
						$.each(list, function(i, obj){
							value += "<tr>"
							      + "<th>" + obj.empName + "</th>"
							      + "<td>" + obj.appComment + "</td>"
							      + "<td>" + obj.commentDate + "</td>"
							      +"</tr>"
						})
						$("#replyArea tbody").html(value);
						$("#rcount").text(list.length);
					}, error:function(){
						console.log("의견 리스트 조회용 ajax 실패!");
					}
				})
			}
		</script>
        <br><br>
  
    </div>
</body>
</html>