<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사원조회</title>
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
            border-bottom: 0.5px solid black;
            text-align: center;
            margin-top: 10px;
            margin-bottom: 5px;
        }
        .listArea>tbody>tr{height: 35px;}
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
        .listArea>tbody>tr{height: 40px;}
        #top{height: 40px;}
        #searchForm{
            width:80%;
            margin:auto;
            margin-left: 51%;
        }
        #searchForm>*{float:left; margin:3px;}
        .select{width:15%;}
        .text{width:35%;}
        .searchBtn{Width:10%;}
        #pagingArea{width:fit-content;margin:auto;}
    </style>
</head>
<body>
    <!-- 이쪽에 헤더바 포함할꺼임 <jsp:include page=""/> -->
    <!-- 이쪽에 메뉴바 포함할꺼임 <jsp:include page=""/>-->

     <div class="outer">
        <span id="text1">사원조회</span><hr>

        <form id="searchForm" action="" method="Get" align="right">
            <div class="select">
                <select class="custom-select" name="condition">
                    <option value="emp_name">이름</option>
                    <option value="emp_no">부서</option>
                    <option value="emp_no">직급</option>
                </select>
            </div>
            <div class="text">
                <input type="text" class="form-control" name="keyword">
            </div>
            <a class="btn btn-primary" href=""><b>검색</b></a>&nbsp;
        </form>
        <br>

        <table class="listArea">
            <thead id="head">
                <tr id="top">
                    <th class="eno" width="120px">사원번호</th>
                    <th width="120px">이름</th>
                    <th width="120px">아이디</th>
                    <th width="200px">휴대전화</th>
                    <th width="120px">부서</th>
                    <th width="120px">직급</th>
                    <th width="100px">상태</th>
                </tr>
            </thead>
            <tbody>   
                <tr>
                    <td>10001</td>
                    <td><a href="" style="color: black; font-weight: bold;">홍길동</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(0, 119, 255);">근무</span></td>
                    <!-- 퇴사사원 조건문
                     <td><span  style="color: rgb(255, 60, 0);">퇴사</span></td>
                    -->
                </tr>
                <tr>
                    <td>10002</td>
                    <td><a href="" style="color: black; font-weight: bold;">김나나</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(0, 119, 255);">근무</span></td>
                </tr>
                <tr>
                    <td>10003</td>
                    <td><a href="" style="color: black; font-weight: bold;">강개똥</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(0, 119, 255);">근무</span></td>
                </tr>
                <tr>
                    <td>10004</td>
                    <td><a href="" style="color: black; font-weight: bold;">김개순</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(0, 119, 255);">근무</span></td>
                </tr>
                <tr>
                    <td>10005</td>
                    <td><a href="" style="color: black; font-weight: bold;">홍분홍</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(0, 119, 255);">근무</span></td>
                </tr>
                <tr>
                    <td>10006</td>
                    <td><a href="" style="color: black; font-weight: bold;">김보라</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(0, 119, 255);">근무</span></td>
                </tr>
                <tr>
                    <td>10007</td>
                    <td><a href="" style="color: black; font-weight: bold;">오초록</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(0, 119, 255);">근무</span></td>
                </tr>
                <tr>
                    <td>10008</td>
                    <td><a href="" style="color: black; font-weight: bold;">황주황</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(0, 119, 255);">근무</span></td>
                </tr>
                <tr>
                    <td>10009</td>
                    <td><a href="" style="color: black; font-weight: bold;">이노랑</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(0, 119, 255);">근무</span></td>
                </tr>
                <tr>
                    <td>10010</td>
                    <td><a href="" style="color: black; font-weight: bold;">박빨강</a>&nbsp;</td>
                    <td>emp01</td>
                    <td>010-1111-2222</td>
                    <td>개발부</td>
                    <td>대표이사</td>
                    <td><span  style="color: rgb(255, 60, 0);">퇴사</span></td>
                </tr>
            </tbody>
        </table>

        <!--
        <script>
            $(function(){
                $("#boardList tbody tr").click(function(){
                    location.href="detail.bo?bno=" + $(this).children(".bno").text();
                })
            })
        </script>
        -->
        <span style="color: rgb(0, 119, 255);">근무</span> : 9명&nbsp;
        <span style="color: rgb(255, 60, 0);">퇴사</span> : 1명
        <a class="btn btn-outline-primary btn-sm" href="" style="margin-left: 575px;"><b>사원등록</b></a><br>

        </div>

        
        <div id="pagingArea">
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#"><<</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item disabled"><a class="page-link" href="#">>></a></li>
            </ul>
        </div>
       
        <br clear="both"><br>
       
    </div>

    <script>
        
    </script>   
     
</body>
</html>