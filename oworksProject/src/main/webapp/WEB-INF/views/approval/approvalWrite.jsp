<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안하기 페이지</title>
  
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/approval/approvalWrite.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- 썸머노트 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous" defer></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" defer>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous" defer></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet" defer>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js" defer></script>
</head>

<body>
	
	
	<!--헤더바-->
	<jsp:include page="../common/mainHeader.jsp"/>
    
	<!--좌측메뉴바-->
    <jsp:include page="../common/mainMenubar.jsp"/> 
    
    <div class="approvalouter" style="position: absolute; left: 400px; top: 100px; width: 1000px;">
      	<div class = approvalInner >
        	<form id = "approvalWrite" name = "approvalWrite" method = "post" action="insert.ap" enctype="multipart/form-data">
	        	<input type="hidden" name="empNo" value="${loginEmp.empNo }">
			        <div class="left_area" style="padding:0">
		      		    <button type="button" class="btn btn-dark btn-sm" onclick="addApprovalLine();">기안</button>
			            <a type="button" class="btn btn-dark btn-sm" href="" data-toggle="modal" data-target="#myModal">결재선</a>
				        <button type="submit" class="btn btn-dark btn-sm" onclick="approvalSave();">임시저장</button>
			            <button type="button" class="btn btn-dark btn-sm" id = "print">인쇄</button>
			        </div>
  			
  			
		  			<!-- 기안하기 버튼 클릭시 form에 input type hidden으로 넘기기 -->
		  			<script>
			  			function addApprovalLine(){
			  				if(addEmpNo[1] == null){ //[0]에는 무조건 로그인회원이 담기기 때문에 [1]이 비워져 있으면 페이지 이동 없게
			  					var test = alert("결재선이 비어있습니다 확인해주세요");
			  				}else{
				            	var form = $("form[name='approvalWrite']");
				            	var count = 0;
			       				for(var i=0; i<addEmpNo.length; i++){
			       					//사원번호
			       					form.append($('<input/>', {type:'hidden', name: 'lineList[' + count + '].empNo', value:addEmpNo[i]}));
			       					//결재 || 참조 상태
			       					form.append($('<input/>', {type:'hidden', name: 'lineList[' + count + '].refer', value:'결재'}));
			       					//상태
			       					if(i==0){
			       						form.append($('<input/>', {type:'hidden', name:'lineList[0].status', value:'완료'}));
			       						// appStatus [0]번은 승인으로 들어가게 하기
					       				form.append($('<input/>', {type:'hidden', name:'lineList[0].appStatus', value:'승인'}));
			       					}else{
			       						form.append($('<input/>', {type:'hidden', name:'lineList[' + count + '].status', value:'대기'}));
			       					}
			       					count++;
			       				}
			       				// 참조
			       				for(var i=0; i<referNo.length; i++){
			       					//사원번호
			       					form.append($('<input/>', {type:'hidden', name: 'lineList[' + count + '].empNo', value:referNo[i]}));
			       					//결재 || 참조 상태
			       					form.append($('<input/>', {type:'hidden', name: 'lineList[' + count + '].refer', value:'참조'}));
			       					count++;
			       				}
			       				
			       				//저장여부
				  				form.append($('<input/>', {type:'hidden', name: 'appStorage', value:'N'}));
			       				
				  				//문서양식
				  				if(category == "품의서"){
				  					$("#formTitle").val($("#formTitle").val()) ;
					  				$("#formContent").val($("#formContent").val());
					  				form.append($('<input/>', {type:'hidden', name: 'formNo', value:1}));
				  				}else if(category == "지출결의서"){
					  				$("#formTitle").val($("#accountTitle").val()) ;
					  				$("#formContent").val($("#accountContent").val());
					  				form.append($('<input/>', {type:'hidden', name: 'formNo', value:2}));
				  				}else if(category == "증명서"){
					  				$("#formTitle").val($("#certiTitle").val()) ;
					  				$("#formContent").val($("#certiContent").val());
					  				form.append($('<input/>', {type:'hidden', name: 'formNo', value:3}));
				  				}else{
				  					form.append($('<input/>', {type:'hidden', name: 'formNo', value:0}));
				  				}
				  				
				  				document.getElementById("approvalWrite").submit();
			  				}
			  				
			  			}
			  			
			  			
			  			<!-- 임시저장하는 스크립트 
			  			function approvalSave(){
			  				//form에 input type hidden으로 사원번호, 상태, 결재||참조 값 넘기기
			            	var form = $("form[name='approvalWrite']");
			            	var i;
		       				for(i=0; i<addEmpNo.length; i++){
		       					//사원번호
		       					form.append($('<input/>', {type:'hidden', name: 'lineList[' + i + '].empNo', value:addEmpNo[i]}));
		       					
		       					//결재 || 참조 상태
		       					form.append($('<input/>', {type:'hidden', name: 'lineList[' + i + '].refer', value:'결재'}));
		       					
		       					//$("#referTable> tbody > tr:nth-child(1)> td:nth-child(2)").text(refer[0]);
		       					
		       					
		       					//상태
		       					if(i==0){
		       						form.append($('<input/>', {type:'hidden', name:'lineList[0].status', value:'진행'}));
		       					}else{
		       						form.append($('<input/>', {type:'hidden', name:'lineList[' + i + '].status', value:'대기'}));
		       					}
		       				}
		       				
		       				//저장여부
		       				form.append($('<input/>', {type:'hidden', name: 'appStorage', value:'Y'}));
		       				
		       				//문서양식 DB에 배열로 들어가는거 방지하기 위해 첫번재 양식에만 name 값 주고 나머지는 name 값없이!!!
			  				if(category == "품의서"){
			  					$("#formTitle").val($("#formTitle").val()) ;
			  					$("#formContent").val($("#formContent").val());
				  				form.append($('<input/>', {type:'hidden', name: 'formNo', value:1}));
			  				}else if(category == "지출결의서"){
				  				$("#formTitle").val($("#accountTitle").val()) ;
				  				$("#formContent").val($("#accountContent").val());
				  				form.append($('<input/>', {type:'hidden', name: 'formNo', value:2}));
			  				}else if(category == "증명서"){
				  				$("#formTitle").val($("#certiTitle").val()) ;
				  				$("#formContent").val($("#certiContent").val());
				  				form.append($('<input/>', {type:'hidden', name: 'formNo', value:3}));
			  				}else{
			  					form.append($('<input/>', {type:'hidden', name: 'formNo', value:0}));
			  				}
			  			}
			  			-->
		  			</script>
  					
  					<!-- 프린트 자바스크립트 -->
  					<script>
  						$("#print").click(function(){
  							const completeParam = makeHtml();
  							reportPrint(completeParam);
  						})
  						
  						function makeHtml(){
  							const obj = {html : ''};
  						    let html = '<div class="approvalouter">';
  						    html += '</div>';    
  						    obj.html = html;
  						    return obj;

  						}
  						
  						function reportPrint(param){
  						    const setting = "width=890, height=841";
  						    const objWin = window.open('', 'print', setting);
  						    objWin.document.open();
  						    objWin.document.write('<html><head><title>기안서 </title>');
  						    objWin.document.write('<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}"/resources/css/images/common/logo.png>');
  						    objWin.document.write('</head><body>');
  						    objWin.document.write(param.html);
  						    objWin.document.write('</body></html>');
  						    objWin.focus(); 
  						    objWin.document.close();
  						 
  						  setTimeout(function(){objWin.print();objWin.close();}, 1000);

  						}

  					</script>
  			
  			
		          	<!-- 결재선 버튼 클릭 시 나오는 모달 -->
				    <div class="containerM">
			          	<!-- The Modal -->
			         	<div class="modal fade" id="myModal">
			            	<div class="modal-dialog modal-dialog-centered" >
			              		<div class="modal-content" id="modalapproval">
			                
				                	<!-- Modal Header -->
				                	<jsp:include page="approvalLine.jsp"/>
				                  
				                	<!-- Modal footer -->
				                	<div class="modal-footer">
				                  		<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick = "approvalLineOk();">확인</button>
				                  		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				                	</div>
			              		</div>
			            	</div>
			          	</div>
			        </div>
		  
		          	<!-- 의견 버튼 클릭시 나오는 모달 -->
		          	<!-- The Modal -->
		          	<div class="containerC">
		        
		            	<!-- The Modal -->
		            	<div class="modal fade" id="comment">
		              		<div class="modal-dialog modal-dialog-centered">
		                		<div class="modal-content">
		                             
				                  	<!-- Modal body -->
				                  	<div class="modal-body">
				                    	<input id="modalc" name = "appOpinion" type="text" placeholder="의견을 입력하세요" style="width: 100%; height: 100px;">
				                  	</div>
				                  
				                  	<!-- Modal footer -->
				                  	<div class="modal-footer" style="margin: auto;">
				                    	<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				                    	<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick = "test();">취소</button>
				                  	</div>
		                		</div>
		              		</div>
		            	</div>
		          	</div>
		       		<br><br>
        
			      	<!--기안 설정-->
			      	<div class="container">
			        	<div class="approvalsetting">
			            	<table class="table table-bordered" id=approval>
			              		<tr>
			                		<th colspan="4">기안설정</th>
			              		</tr>
				              	<tr>
				            	    <th>문서종류</th>
					                <td>
					                  	<select name="appType" id="appType" class="custom-select mb-3" style="width: 100%;">
					                    	<option value="선택">선택</option>
					                    	<option name="insertForm" id="1" value="품의서">품의서</option>
					                    	<option name="insertForm" id="2" value="지출결의서">지출결의서</option>
					                    	<option name="insertForm" id="3" value="증명서">증명서</option>
					                  	</select>
					                </td>
					                <th>작성자</th>
					                <td>김개발</td>
					            </tr>
			              		<tr>
			                		<th>보존연한</th>
			                		<td id="approvalYear"></td>
			                		<th>보안등급</th>
			                		<td id="approvalLevel"></td>
			              		</tr>
			            	</table>
			        	</div>
			            
			            
			   			<!-- select문 선택 -->
			   			
			   			<!-- 보존연한이랑 등급 바꾸는 스크립트 -->
			   			<script>
			   				var category = "";
			   				$("select[name=appType]").change(function(){
			   					category = $("select[name=appType] option:selected").text();
			   					
			   					if(category == '품의서'){
			   	    				document.getElementById("approvalYear").innerHTML = '10년';
			   	    				document.getElementById("approvalLevel").innerHTML = 'A';
			   	    			}else if(category == '지출결의서'){
			   	    				document.getElementById("approvalYear").innerHTML = '5년';
			   	    				document.getElementById("approvalLevel").innerHTML = 'B';
			   	    			}else if(category == '증명서'){
			   	    				document.getElementById("approvalYear").innerHTML = '3년';
			   	    				document.getElementById("approvalLevel").innerHTML = 'C';
			   	    			}else{
			   	    				document.getElementById("approvalYear").innerHTML = '';
			   	    				document.getElementById("approvalLevel").innerHTML = '';
			   	    			}
			   				})
			   			</script>
			
			
			        	<br><br>
			    
			        	<!--결재선-->
			        	<div class="approvalline">
			            	<table class="table table-bordered" id = "realApprlvalLine">
			              		<thead>
			                		<tr>
			                  			<th colspan="7">결재선</th>
			                		</tr>  	
			              		</thead>
			              
			              		<tbody>
					                <tr>
					                  <th rowspan="3">결재</th>
					                  <td>${loginEmp.jobName }</td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                </tr>
					                <tr>
					                  <td>
					                    <img src="${pageContext.servletContext.contextPath }/resources/images/approval/approval.png" style="width:80px">
					                  </td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                  
					                </tr>
					                <tr id="employeeName">
					                  <td>${loginEmp.empName }</td>
					                  <td id="user"></td>
					                  <td></td>
					                  <td></td>
					                  <td></td>
					                </tr>
			              		</tbody>
			            	</table>
			        	</div>
			        	<br>
			  	
			    	
			        	<!--참조-->
				        <div class="reference">
				          <table class="table table-bordered" id="referTable">
				          	<tbody>
					            <tr>
					              <th>참조</th>
					              <td align="left"></td>
					            </tr>
				            </tbody>
				          </table>
				        </div>
			    		
					  	<!-- 결재선에서 확인버튼 클릭시 결재선에 결재자 및 참조자 확인 -->
				        <script>
				            function approvalLineOk(){
			       				
								<!--참조-->
				              	$("#referTable> tbody > tr:nth-child(1)> td:nth-child(2)").text(referName);
				              	
				              	<!--결재선-->
				              	var tr = $("#realApprlvalLine tbody tr"); 
				              	
				              	var test = tdArr.length;
				              	console.log(test);
				              	
				              	var j = 0;
				              	j++;
				              	
				              	/* i값을 어떻게 앞에 숫자랑 더해야되는지 생각해보기!
				              	for(var i=0; i<tdArr.length; i++){
					              	$('#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(3' + i + ')').text(tdArr[i].slice(1,2));
					              	$('#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(2' + i + ')').text(tdArr[i].slice(0,1));
				              	}
				              	*/
				              	
				              	
				              	$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(3)").text(tdArr[1].slice(1,2));
				              	$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(2)").text(tdArr[1].slice(0,1));
				              
				             	$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(4)").text(tdArr[2].slice(1,2));
				              	$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(3)").text(tdArr[2].slice(0,1));
				              	
				              	$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(5)").text(tdArr[3].slice(1,2));
				              	$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(4)").text(tdArr[3].slice(0,1))
				              	
				              	$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(6)").text(tdArr[4].slice(1,2));
				              	$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(5)").text(tdArr[4].slice(0,1));
				              	
				            };
				        </script>
					
				
						<!-- 문서양식  -->	
			       		<!-- 품의서 일때 -->
			            <div class="content">
			              	<br>
			              	<div class="innerOuter">
			                  	<br>
			                  	<table class="table table-bordered">
			                      	<tr>
			                          	<th><label for="title">제목</label></th>
			                          	<td><input type="text" id="formTitle" class="form-control" name="appTitle" value=""></td>
			                      	</tr>
			
			                      	<tr>
			                      		<td colspan="2"><textarea class="summernote" name="appContent" id="formContent" rows="10" style="resize:none;"></textarea></td>
			                      	</tr>
			                  	</table>
			                  	<br>
			    
			                  	<!--첨부파일-->
			                  	<div class="insertfile">
			                   		<table class="table table-bordered">
			                     		<tr>
			                       			<th><label for="upfile">첨부파일</label></th>
			                       			<td>
			                         			<input type="file" id="upfile" name="upfile" class="form-control-file border">
			                       			</td>
			                   			</tr>
			                   		</table>
			                      
			                     	<br>
			                      
			                      	<script>
			                       		$(".custom-file-input").on("change", function() {
			                          		var fileName = $(this).val().split("\\").pop();
			                          		$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
			                        	});
			                        </script>
			                  	</div>
			                </div>
			                
			                <!-- 지출 -->
			                <div class="innerOuter2">
			                    <br>
			                    <table class="table table-bordered">
			                        <tr>
			                            <th><label for="title" >계좌정보</label></th>
			                            <td>
			                              <input type="text" id="accountTitle" class="form-control" value="" placeholder="계좌정보를 입력하세요">
			                            </td>
			                        </tr>
			  
			                        <tr>
			                            <th>총괄적요</th>
			                            <td colspan="2"><textarea class="summernote" id="accountContent" rows="10" style="resize:none;"></textarea></td>
			                        </tr>
			                    </table>
			                    <br>
			                    <!--첨부파일-->
			                    <div class="insertfile">
			                        <table class="table table-bordered">
			                          	<tr>
			                            	<th><label for="upfile">첨부파일</label></th>
			                            	<td>
			                              		<input type="file" id="upfile" name="upfile" class="form-control-file border">
			                            	</td>
			                        	</tr>
			                        </table>
			                		<br>
			                
			                        <script>
			                          	$(".custom-file-input").on("change", function() {
			                            	var fileName = $(this).val().split("\\").pop();
			                            	$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
			                         	 });
			                         </script>
			                    </div>
			                </div>
			                
			                <!-- 증명서 -->
			                <div class="innerOuter3">
			                    <br>
			                    <table class="table table-bordered">
			                        <tr>
			                            <th><label for="title" >제출처</label></th>
			                            <td><input type="text" id="certiTitle" class="form-control" value="" placeholder="제출처를 입력하세요"></td>
			                        </tr>
			
			                        <tr>
			                            <th>용도</th>
			                            <td colspan="2"><textarea class="summernote" id="certiContent" rows="10" style="resize:none;"></textarea></td>
			                        </tr>
			                    </table>
			                    <br>
			      
			                    <!--첨부파일-->
			                    <div class="insertfile">
			                        <table class="table table-bordered">
			                          	<tr>
			                            	<th><label for="upfile">첨부파일</label></th>
			                            	<td>
			                              		<input type="file" id="upfile" name="upfile" class="form-control-file border">
			                            	</td>
			                        	</tr>
			                        </table>
			                		<br>
			                        
			                        <script>
			                          	$(".custom-file-input").on("change", function() {
			                            	var fileName = $(this).val().split("\\").pop();
			                            	$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
			                          	});
			                         </script>
			                    </div>
			                </div>
			                
			              </div>    
			            
			              <!-- 문서양식 바꾸기 -->
			              <script>
			                $(document).ready(function(){
			                  	// 처음 페이지 로드시에는 숨기기
					            $(".innerOuter").hide();
				              	$(".innerOuter2").hide();
				              	$(".innerOuter3").hide();
				              
			                  	$("#appType").change(function(){
			                    	var result = $("#appType option:selected").val();
			                    	if(result=='품의서'){
			                      		$(".innerOuter").show();
			                      		$(".innerOuter2").hide();
			                      		$(".innerOuter3").hide();
			                    	}else if(result == '지출결의서'){
			                      		$(".innerOuter2").show();
			                      		$(".innerOuter").hide();
			                      		$(".innerOuter3").hide();
			                    	}else if(result == '증명서'){
			                      		$(".innerOuter3").show();
			                      		$(".innerOuter").hide();
			                      		$(".innerOuter2").hide();
			                    	}else{
			                      		$(".innerOuter").hide();
			                      		$(".innerOuter2").hide();
			                      		$(".innerOuter3").hide();
			                    	}
			                  	})
			                })
			              </script>
			              
			              <!-- 썸머노트 script -->
							<script>
							$(document).ready(function(){
						          $('.summernote').summernote({
						                width:900,						// 에디터 너비
						                height: 500,                 	// 에디터 높이
						                minHeight: 500,             		// 최소 높이
						                maxHeight: 500,             		// 최대 높이
						                focus: false,               		// 에디터 로딩후 포커스를 맞출지 여부
						                lang: "ko-KR",					// 한글 설정
						                placeholder: '내용을 입력해주세요',	// placeholder 설정
						                toolbar: [
						                    ['fontname', ['fontname']],
						                    ['fontsize', ['fontsize']],
						                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
						                    ['color', ['forecolor','color']],
						                    ['table', ['table']],
						                    ['para', ['ul', 'ol', 'paragraph']],
						                    ['height', ['height']],
						                    ['insert',['picture','link','video']],
						                    ['view', ['fullscreen', 'help']]
						                ],
						                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
						                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			
						          });
						        });
									
			
							</script>
						</div>
			</form>
		</div>
    </div>
	<br><br><br>
</body>
</html>