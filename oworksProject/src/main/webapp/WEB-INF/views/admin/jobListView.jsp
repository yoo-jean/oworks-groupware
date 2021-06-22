<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부서/직급 관리</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
        .outer{
            margin: auto;
            margin-top: 50px;
            margin-bottom: 20px;
            width:800px;
        }
        #text1{
            font-size:x-large; 
            font-weight: bold; 
            color: rgb(94, 94, 94);
        }
        #text2{font-weight: bold;}
        .listArea{
            border-top: 1px solid black; 
            border-bottom: 1px solid black;
            text-align: center;
            margin-top: 10px;
        }
        .listArea>tbody>tr:hover{
            cursor:pointer;
            background: rgba(37, 116, 219, 0.678);
            color: white;
        }
        .listArea>tbody>tr{height: 40px;}
        #head{background: rgb(237, 237, 237);}
        #top{height: 40px;}
        #btn2{
            border: 1px solid rgb(237, 237, 237);
            color: black;
            background-color: rgb(237, 237, 237);
            border-radius: 5px;
            padding: 6px;
            }
        #btn2:hover{background-color: rgba(37, 116, 219, 0.9); color:white;}
        .page{font-size: medium; margin-right: 40px;}
        #pagingArea{width:fit-content;margin:auto;}
        .btn3{
            width: 200px;
            height: 40px;
            border: 1px solid gray;
            color: white;
            background-color: rgba(37, 116, 219, 0.9);
            border-radius: 8px;
            padding: 5x;
            font-size: medium;
            cursor: pointer;
            font-weight: bold;
        }
        .btn4{
            width: 200px;
            height: 40px;
            border: 1px solid lightgray;
            color: gray;
            background-color: rgb(237, 237, 237);
            border-radius: 8px;
            padding: 5x;
            font-size: medium;
            cursor: pointer;
            font-weight: bold;
        }
        .btn4:hover{
            background-color: rgba(37, 116, 219, 0.9);
            font-weight: bold;
            color: white;
        }
        .modal{margin-top: 130px;}
        #enrollForm>table{width:300px;}
        #enrollForm>table *{ margin:5px;}
        #enrollForm{
            border-left: none; 
            border-right: none;
            border-top: 1.5px solid rgb(211, 211, 211);
            border-bottom: 1.5px solid rgb(211, 211, 211);
        }
    </style>
</head>
<body>
    <!-- 이쪽에 헤더바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 이쪽에 메뉴바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

     <div class="outer">
        <span id="text1">부서/직급 관리</span><hr>
        <div id="btn" align="center">
            <button class="btn4" onClick="location.href='xxxxx.jsp'">부서관리</button>
            <button class="btn3" onClick="location.href='xxxxx.jsp'">직급관리</button>

            <!--
            <a class="btn btn-outline-primary" href="" style="width: 250px;"><b>부서관리</b></a>
            <a class="btn btn-outline-primary" href="" style="width: 250px;"><b>직급관리</b></a>
            -->
        </div>
        <br><br>
        <div id="btn" align="right">
            <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#insertJob"><b style="color: white;">직급추가</b></a>
        </div>
        <table class="listArea">
            <thead id="head">
                <tr id="top">
                    <th width="400">직급코드</th>
                    <th width="400">직급명</th>
                </tr>
            </thead>
            <tbody>   
                <tr>
                    <td><a data-toggle="modal" data-target="#job"><u>J1</u></a></td>
                    <td>대표이사</td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#job"><u>J2</u></a></td>
                    <td>부장</td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#job"><u>J3</u></a></td>
                    <td>과장</td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#job"><u>J4</u></a></td>
                    <td>대리</td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#job"><u>J5</u></a></td>
                    <td>사원</td>
                </tr>
                
            </tbody>
        </table>
        <br>

        <!-- 직급추가 클릭시 뜨는 Modal -->
        <div class="modal" id="insertJob">
            <div class="modal-dialog">
            <div class="modal-content"> 
    
            <!-- Modal Header --> 
            <div class="modal-header">
            <b style="font-size:x-large;">&emsp;직급 등록</b>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!--Modal body --> 
            <div class="modal-body" align="center">
                    </table>
                    <table id="enrollForm" border="1" style="text-align: center;">
                        <tr>
                            <th style="background-color: rgba(211, 211, 211, 0.349); width: 150px;">직급코드</th>
                            <td style="width: 150px; padding: 6px;"><input type="text" id="jobCode" class="form-control" name="jobCode" required></td>
                        </tr>
                        <tr>
                            <th style="background-color: rgba(211, 211, 211, 0.349);">직급명</th>
                            <td style="width: 150px; padding: 6px;"><input type="text" id="jobName" class="form-control" name="jobName" required></td>
                        </tr>
                    </table>
		            <br>	
		         	
		         <form action="버튼클릭시 이동할페이지 연동" method="post">
		         	<button type="submit" class="btn btn-primary btn-sm"><b>등록</b></button>
                    <br>
		         </form>
            </div>
        </div>
        </div>
        </div>   


        <!-- 직급코드 a태그 클릭시 뜨는 Modal -->
        <div class="modal" id="job">
            <div class="modal-dialog">
            <div class="modal-content"> 
    
            <!-- Modal Header --> 
            <div class="modal-header">
            <b style="font-size:x-large;">&emsp;직급 수정</b>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!--Modal body --> 
            <div class="modal-body" align="center">
                    </table>
                    <table id="enrollForm" border="1" style="text-align: center;">
                        <tr>
                            <th style="background-color: rgba(211, 211, 211, 0.349); width: 150px;">직급코드</th>
                            <td style="width: 150px; padding: 6px;"><input type="text" id="jobCode" class="form-control" name="jobCode" value="J1" required></td>
                        </tr>
                        <tr>
                            <th style="background-color: rgba(211, 211, 211, 0.349);">직급명</th>
                            <td style="width: 150px; padding: 6px;"><input type="text" id="jobName" class="form-control" name="jobName" value="대표이사" required></td>
                        </tr>
                    </table>
		            <br>	
		         	
		         <form action="버튼클릭시 이동할페이지 연동" method="post">
		         	<button type="submit" class="btn btn-primary btn-sm"><b>수정</b></button>
                    <button type="submit" class="btn btn-danger btn-sm"><b>삭제</b></button>
                     <br>
		         </form>
            </div>
        </div>
        </div>
        </div>   


    </div>

    <script>
        
    </script>    
</body>
</html>