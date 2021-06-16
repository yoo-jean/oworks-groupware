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
  <style>
    /*전체 틀 css*/
    .approvalouter table{margin: auto;}
    /*.approvalouter h2{font-size: 20px; font-weight: 700;}*/
    
    .container{
      border: 1px solid lightgray;
      padding: 29px 29px 0;
      border-radius: 6px;
    }
	
    
    /*기안설정 css*/
    .approvalsetting table th{vertical-align:middle;width: 14%;}
    .approvalsetting table td{vertical-align:middle;width: 36%;}
    
    /*테이블 css*/
    /*.approvalouter table{width: 80%;}*/

    
    .left_area{
      position: absolute;
      display: inline-block;
      padding-left: 17%;

    }
    

    /*테이블 css*/
    
    .container table{width: 80%;text-align: center;}
    .approvalline table{text-align: center;}
    .approvalline table th{vertical-align:middle;width: 14%;}
    .approvalline table td{vertical-align:middle;width: 14%;}
    
    /*참조 테이블 css*/
    .reference table th{vertical-align:middle;width: 14%;}

    /*내용 테이블 css*/
    #updateForm table th{vertical-align:middle;width: 14%;}
    #updateForm table td{text-align: left;}

    /*첨부파일 테이블 css*/
    .insertfile th{vertical-align:middle;width: 14%;}
    .insertfile td{text-align: left;}
	
    /*모달 css*/
    #modalapproval{
      position: absolute;
      left: -250px;
      width: 1050px;
      padding-left: 10px;
      padding-top: 10px;
    }
  </style>
</head>
<body>
    <div class="approvalouter">
        
        <br><br>
        
        <div class="left_area">
          <button type="button" class="btn btn-dark btn-sm">기안</button>
          <a type="button" class="btn btn-dark btn-sm" href="enrollFormLine.ap" data-toggle="modal" data-target="#myModal">결재선</a>
          <button type="button" class="btn btn-dark btn-sm">의견</button>
          <button type="button" class="btn btn-dark btn-sm">임시저장</button>
          <button type="button" class="btn btn-dark btn-sm">인쇄</button>
        </div>
  		
  		<!-- 결재선 버튼시 나오는 모달 -->
  		<div class="containerM">
		
		  <!-- The Modal -->
		  <div class="modal fade" id="myModal">
		    <div class="modal-dialog modal-dialog-centered" >
		      <div class="modal-content" id="modalapproval">
		      
		        <!-- Modal Header -->
		        <jsp:include page="approvalLine.jsp"/>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
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
                  <td>
                    <select name="" id="" class="custom-select mb-3" style="width: 100%;">
                      <option value="품의서">품의서</option>
                      <option value="지출결의서">지출결의서</option>
                      <option value="증명서">증명서</option>
                    </select>
                  </td>
                  <th>작성자</th>
                  <td>김개발</td>
                </tr>
                <tr>
                  <th>보존연한</th>
                  <td>
                    <select name="" id="" class="custom-select mb-3" style="width: 100%;">
                      <option value="3년">3년</option>
                      <option value="5년">5년</option>
                      <option value="10년">10년</option>
                    </select>
                  </td>
                  <th>보안등급</th>
                  <td>
                    <select name="" id="" class="custom-select mb-3" style="width: 100%;">
                      <option value="A">A</option>
                      <option value="B">B</option>
                      <option value="C">C</option>
                      <option value="D">D</option>
                    </select>
                  </td>
                </tr>
              </table>
          </div>
  
          <br><br>
  
          <!--결재선-->
          <div class="approvalline">
              <table class="table table-bordered">
                <tr>
                  <th colspan="7">결재선</th>
                </tr>
                <tr>
                  <th rowspan="3">결재</th>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                
                </tr>
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
  
          <!--내용영역-->
          <div class="content">
            <br><br>
            <div class="innerOuter">
                <br>
                <form id="updateForm" method="post" action="" enctype="">
                    <table class="table table-bordered">
                        <tr>
                            <th><label for="title">제목</label></th>
                            <td><input type="text" id="title" class="form-control" name="" value="결재제목" required></td>
                        </tr>
  
                        <tr>
                            <td colspan="2"><textarea class="form-control" required name="" id="content" rows="10" style="resize:none;">결재작성하기</textarea></td>
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
                          <input type="file" id="myFile" name="filename2">
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
  
      </div>
</body>
</html>