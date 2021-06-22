<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 조회</title>
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
    <!-- 이쪽에 헤더바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 이쪽에 메뉴바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

     <div class="outer">
        <span id="text1">자유게시판</span><hr>

        <form id="searchForm" action="" method="Get" align="right">
            <div class="select">
                <select class="custom-select" name="condition">
                    <option value="writer">제목</option>
                    <option value="title">내용</option>
                    <option value="content">작성자</option>
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
                    <th class="bno" width="70">순번</th>
                    <th width="400">제목</th>
                    <th width="100">작성자</th>
                    <th width="150">등록일</th>
                    <th width="80">조회수</th>
                </tr>
            </thead>
            <tbody>   
                <tr>
                    <td>10</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.10</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>9</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.9</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>8</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.8</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.7</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.6</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.5</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.4</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.3</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.2</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>
                        <a href="" style="color: black;">자유게시판 제목 입니다.1</a>&nbsp;
                        <img src="images/reply.png" style="height: 30px;"><span style="color: rgb(241, 196, 15); font-weight: bold;">1</span>
                    </td>
                    <td>홍길동</td>
                    <td>2021-05-29</td>
                    <td>10</td>
                </tr>
                
            </tbody>
        </table>

      

        <!-- 사원 모두에게 보이는 글작성 버튼 -->
        <div id="btn" align="right">
            <a class="btn btn-outline-primary btn-sm" href=""><b>글작성</b></a>&nbsp;
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