<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        /*전체 감싸는 css*/
        .approvalouter{width: 1000px;margin: auto;}

        /*table*/
        .table{text-align: center;}
        .approvalall table>tbody>tr:hover{cursor: pointer;}

        #insertbtn{
            text-align: left;
            position: relative;
            top: 40px;

        }
        #deletebtn{
            text-align: left;
            position: absolute;
            top: 66px;
        }
        /*모달 css*/
        .modal-content{width: 350px;}
        .modal-content textarea{width: 250px; height: 150px;}
        .modalfooter2{margin: auto;}

        /*select, input css*/
        #insertbtn{
            text-align: left;
            position: relative;
            top: 130px;
        }
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
    </style>

</head>
<body>
    <div class="approvalouter">
        <br>
        <div class="approvalinner">

            <div class="searchfield">
          		
          		<a type="button" href = "enrollForm.ap" class="btn btn-warning" id="insertbtn" >기안하기</a> &nbsp;
			
            	
                <div align="right">
                    <select name="" id="" class="custom-select mb-3">
                        <option value="제목">제목</option>
                        <option value="기안자">기안자</option>
                        <option value="내용">내용</option>
                    </select>
                    
                    <input type="text" class="form-control form-control" placeholder="검색어를 입력하세요">
                    <button class="btn btn-primary" style="background:rgb(42, 128, 185);">검색</button>
                </div>
            </div>

            <br>

            <!--테이블-->
            <div class="approvalall">
                <table class="table table-hover" id="formSelect">
                    <thead class="thead-dark">
                        <tr>
                            <th width=><input type="checkbox"></th>
                            <th width=>양식명</th>
                            <th width=>설명</th>
                            <th width=>보존연한</th>
                            <th width=>보안등급</th>                         
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="insertForm" id="1" value="1"></td>
                            <td>품의서</td>
                            <td>품의서</td>
                            <td>10년</td>
                            <td>A등급</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>지출결의서</td>
                            <td>지출결의서</td>
                            <td>5년</td>
                            <td>B등급</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>증명서</td>
                            <td>경력증명서/재직증명서</td>
                            <td>3년</td>
                            <td>C등급</td>
                        </tr>
                    </tbody> 
                    
                </table>
                
                <script>
                	$(function(){
                		$("#formSelect tbody tr:nth-child(1)").click(function(){
                			location.href = '${pageContext.servletContext.contextPath}/enrollForm.ap';
                		})
                		
                		$("#formSelect tbody tr:nth-child(2)").click(function(){
                			location.href = '${pageContext.servletContext.contextPath}/disbursement.ap';
                		})
 	
                		$("#formSelect tbody tr:nth-child(3)").click(function(){
                			location.href = '${pageContext.servletContext.contextPath}/certificate.ap';
                		})
                	})
                
                </script>
            </div>
        </div>
        
    </div>
</body>
</html>
