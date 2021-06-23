<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<title>기안하기 페이지</title>
  
  <!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/approval/approvalWrite.css">

</head>
<body>
    <div class="approvalouter">
      <br><br>
        
      <div class = approvalInner>
        <form id = "approvalWrite" method = "post" action="insert.ap" enctype="multipart/form-data">
        <input type="hidden" name="formNo" value="1">
        <input type="hidden" name="empNo" value = "10032">
        <input type="hidden" name="empNo" value = "10033">
        
          <div class="left_area">
            <button type="submit" class="btn btn-dark btn-sm" onclick="addApprovalLine();">기안</button>
            <a type="button" class="btn btn-dark btn-sm" href="" data-toggle="modal" data-target="#myModal">결재선</a>
            <button type="button" class="btn btn-dark btn-sm" data-toggle="modal" data-target="#comment">의견</button>
            <a type="button" class="btn btn-dark btn-sm" href="save.ap">임시저장</a>
            <button type="button" class="btn btn-dark btn-sm">인쇄</button>
          </div>
  		
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                  </div>
                  
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
                  <td>로그인한 사용자 직급</td>
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
                  <td>로그인한 사용자 이름</td>
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
          <table class="table table-bordered">
            <tr>
              <th>참조</th>
              <td></td>
            </tr>
          </table>
        </div>
    		
    		
	  	<!-- 결재선에서 확인버튼 클릭시 결재선에 결재자 뿌려지게 -->
        <script>
          	var list = new Array();
            function approvalLineOk(){
            	
              	$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(3)").text(c[0].slice(1,2));
              	$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(2)").text(c[0].slice(0,1));
              	
              	$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(4)").text(c[1].slice(1,2));
              	$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(3)").text(c[1].slice(0,1));
              
             	$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(5)").text(c[2].slice(1,2));
              	$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(4)").text(c[2].slice(0,1));
              	
              	$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(6)").text(c[3].slice(1,2));
              	$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(5)").text(c[3].slice(0,1))
              	
              	$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(7)").text(c[4].slice(1,2));
              	$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(6)").text(c[4].slice(0,1));
                
              	var test = document.getElementById("#user").value;
                
              	console.log(test);
              	
            }
            
        </script>
		
		
		<!-- 결재선에 있는 td값을 배열에 담아서 controller에 넘겨서 insert 하면되나? -->
		<script>
		
        

		
		
		</script>
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 문서양식  -->	
        <!-- 품의서 일때 -->
        <form action="">
              <div class="content">
                <br>
                <div class="innerOuter">
                    <br>
                    <table class="table table-bordered">
                        <tr>
                            <th><label for="title">제목</label></th>
                            <td><input type="text" id="title" class="form-control" name="appTitle" value=""></td>
                        </tr>

                        <tr>
                            <td colspan="2"><textarea class="form-control" name="appContent" id="content" rows="10" style="resize:none;"></textarea></td>
                        </tr>
                    </table>
                    <br>
      
                    <!--첨부파일-->
                    <div class="insertfile">
                      <table>
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
                          // Add the following code if you want the name of the file appear on select
                          $(".custom-file-input").on("change", function() {
                            var fileName = $(this).val().split("\\").pop();
                            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                          });
                          </script>
                      </table>
                    </div>
                </div>
                
                <!-- 지출 -->
                <div class="innerOuter2">
                    <br>
                    <table class="table table-bordered">
                        <tr>
                            <th><label for="title" >계좌정보</label></th>
                            <td>
                              <input type="text" id="title" class="form-control" name="appTitle" value="" placeholder="계좌정보를 입력하세요">
                            </td>
                        </tr>
  
                        <tr>
                            <th>총괄적요</th>
                            <td><input type="text" id="content" class="form-control" name="appContent"  style="resize:none; height:100px" placeholder="총괄적요를 적어주세요">
                            </td>
                        </tr>
                    </table>
                    <br>
                    <!--첨부파일-->
                    <div class="insertfile">
                      <table>
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
                          // Add the following code if you want the name of the file appear on select
                          $(".custom-file-input").on("change", function() {
                            var fileName = $(this).val().split("\\").pop();
                            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                          });
                          </script>
                      </table>
                    </div>
                </div>
                
                <!-- 증명서 -->
                <div class="innerOuter3">
                    <br>
                    <table class="table table-bordered">
                        <tr>
                            <th><label for="title" >제출처</label></th>
                            <td><input type="text" id="title" class="form-control" name="appTitle" value="" placeholder="제출처를 입력하세요"></td>
                        </tr>

                        <tr>
                            <th>용도</th>
                            <td><input type="text" id="content" class="form-control" name="appContent" style="resize:none; height:100px" placeholder="증명서의 용도를 적어주세요">
                            </td>
                        </tr>
                    </table>
                    <br>
      
                    <!--첨부파일-->
                    <div class="insertfile">
                      <table>
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
                          // Add the following code if you want the name of the file appear on select
                          $(".custom-file-input").on("change", function() {
                            var fileName = $(this).val().split("\\").pop();
                            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                          });
                          </script>
                      </table>
                    </div>
                </div>
                
              </div>    
              </form>
            
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
            
          </div>
        </form>
      </div>
    </div>
</body>
</html>