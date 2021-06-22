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
<title>지출결의서 페이지</title>
  
  <!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/approval/approvalWrite.css">

</head>
<body>
    <div class="approvalouter">
      <br><br>
        
      <div class = approvalInner>
        <form id = "approvalWrite" method = "post" action="insert.ap" enctype="multipart/form-data">
        <input type="hidden" name = "formNo" value="2">
          <div class="left_area">
            <button type="submit" class="btn btn-dark btn-sm">기안</button>
            <a type="button" class="btn btn-dark btn-sm" href="enrollFormLine.ap" data-toggle="modal" data-target="#myModal">결재선</a>
            <button type="button" class="btn btn-dark btn-sm">의견</button>
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
                    <td><input type="text" readonly  name = "appType" value="지출결의서" style="border:none;"></td>
                    <th>작성자</th>
                    <td>김개발</td>
                  </tr>
                  <tr>
                    <th>보존연한</th>
                    <td>5년</td>
                    <th>보안등급</th>
                    <td>B</td>
                  </tr>
                </table>
            </div>
    		
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
                      <td></td>
                    </tr>
                    <tr>
                      <td>승인</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      
                    </tr>
                    <tr>
                      <td>로그인한 사용자 이름</td>
                      <td></td>
                      <td></td>
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
			  	function approvalLineOk(){
			  		$("#realApprlvalLine> tbody > tr:nth-child(1)> td:nth-child(3)").html(apjob);
			  		$("#realApprlvalLine> tbody > tr:nth-child(3)> td:nth-child(2)").html(apname);
			  	}
			</script>
			
            <!--내용영역-->
            <div class="content">
              <div class="innerOuter">
                  <br>
                  <form id="updateForm" method="post" action="" enctype="">
                      <table class="table table-bordered">
                          <tr>
                              <th><label for="title" >계좌정보</label></th>
                              <td><input type="text" id="title" class="form-control" name="appTitle" value="" required placeholder="계좌정보를 입력하세요"></td>
                          </tr>
    
                          <tr>
                              <th>총괄적요</th>
                              <td><input type="text" id="content" class="form-control" name="appContent"  required style="resize:none; height:100px" placeholder="총괄적요를 적어주세요">
                              </td>
                          </tr>
                      </table>
                      <br>
                  </form>
    
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
              
              <br><br>
            </div>    
          </div>
        </form>
      </div>
    </div>
</body>
</html>